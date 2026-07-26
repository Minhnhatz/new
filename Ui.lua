-- // Acrylic UI Library v3
-- // Enhanced: Auto Device Size Detection, Tooltips, Search Sidebar,
-- //           Progress Bar, Typed Notifications, Realtime Slider Value,
-- //           Theme Switcher, Badge Tabs, Repositionable Mobile Toggle,
-- //           Section Icons, Keybind Icons, Draggable Mobile Button

local ts  = game:GetService("TweenService")
local ui  = game:GetService("UserInputService")
local plr = game:GetService("Players")
local lg  = game:GetService("Lighting")
local rs  = game:GetService("RunService")
local hs  = game:GetService("HttpService")

local LIB_NAME = "Acrylic"

-- // ─── Device Detection ─────────────────────────────────────────────────────
local Device = {}

function Device.Detect()
    local vp     = workspace.CurrentCamera.ViewportSize
    local width  = vp.X
    local height = vp.Y
    local touch  = ui.TouchEnabled
    local kb     = ui.KeyboardEnabled

    if touch and not kb then
        -- Phone or Tablet
        if width < 600 or height < 600 then
            return "Phone"
        else
            return "Tablet"
        end
    elseif width < 1024 then
        return "SmallDesktop"
    else
        return "Desktop"
    end
end

function Device.GetWindowSize()
    local d = Device.Detect()
    local vp = workspace.CurrentCamera.ViewportSize
    if d == "Phone" then
        -- Nearly full screen on phone
        return {
            Width  = math.min(vp.X - 16, 360),
            Height = math.min(vp.Y - 60, 520),
        }
    elseif d == "Tablet" then
        return { Width = 560, Height = 420 }
    elseif d == "SmallDesktop" then
        return { Width = 580, Height = 400 }
    else
        return { Width = 700, Height = 450 }
    end
end

function Device.GetSidebarWidth()
    local d = Device.Detect()
    if d == "Phone" then return 110 end
    if d == "Tablet" then return 130 end
    return 170
end

function Device.IsMobile()
    return ui.TouchEnabled and not ui.KeyboardEnabled
end

-- // ─── Color Theme ──────────────────────────────────────────────────────────
local Theme = {
    Background  = Color3.fromRGB(13, 13, 15),
    Secondary   = Color3.fromRGB(22, 22, 26),
    Tertiary    = Color3.fromRGB(30, 30, 36),
    Border      = Color3.fromRGB(42, 42, 48),
    BorderLight = Color3.fromRGB(60, 60, 70),

    Text        = Color3.fromRGB(232, 232, 240),
    TextDark    = Color3.fromRGB(85, 85, 96),
    TextFade    = Color3.fromRGB(13, 13, 15),

    Accent      = Color3.fromRGB(124, 106, 252),
    AccentDark  = Color3.fromRGB(80, 65, 180),
    AccentGlow  = Color3.fromRGB(100, 85, 220),

    -- Notification types
    Success     = Color3.fromRGB(80, 200, 120),
    Warning     = Color3.fromRGB(240, 180, 50),
    Error       = Color3.fromRGB(240, 80, 80),
    Info        = Color3.fromRGB(124, 106, 252),

    Toggle = {
        Enabled  = Color3.fromRGB(124, 106, 252),
        Disabled = Color3.fromRGB(38, 38, 46),
        Circle   = Color3.fromRGB(240, 240, 255),
    },
    Notification = {
        Background = Color3.fromRGB(15, 15, 18),
        Border     = Color3.fromRGB(35, 35, 42),
        Timer      = Color3.fromRGB(124, 106, 252),
    },
}

-- // ─── Size Constants (dynamic from Device) ────────────────────────────────
local function MakeSize()
    local win = Device.GetWindowSize()
    return {
        Window   = win,
        MinWin   = { Width = 320, Height = 260 },
        MaxWin   = { Width = 1200, Height = 800 },
        Toggle   = { Width = 38, Height = 21, Circle = 13 },
        Button   = { Height = 38 },
        Slider   = { Height = 52 },
        Dropdown = { Height = 38, OptionHeight = 30 },
        Tab      = { Width = Device.GetSidebarWidth(), Height = 34 },
        Notif    = { Width = 230, Height = 72 },
        TextBox  = { Height = 38, InputWidth = 155 },
        Sidebar  = Device.GetSidebarWidth(),
    }
end
local Size = MakeSize()

-- // ─── Typography ──────────────────────────────────────────────────────────
local FontObj = {
    Regular = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Regular),
    Medium  = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Medium),
    Bold    = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Bold),
}

local TextSize = {
    Title  = 14,
    Normal = 13,
    Small  = 12,
    Tiny   = 11,
}

-- // ─── Animation Speeds ─────────────────────────────────────────────────────
local Anim = {
    Fast     = 0.08,
    Normal   = 0.14,
    Slow     = 0.22,
    VerySlow = 0.32,
}

-- // ─── State ────────────────────────────────────────────────────────────────
local Library         = {}
Library.__index       = Library
local Connections     = {}
local NotifContainer  = nil

-- // ─── Utility Functions ────────────────────────────────────────────────────
local function Tween(inst, props, dur, style, dir)
    local t = ts:Create(
        inst,
        TweenInfo.new(dur or Anim.Normal, style or Enum.EasingStyle.Quint, dir or Enum.EasingDirection.Out),
        props
    )
    t:Play()
    return t
end

local function New(class, props)
    local inst = Instance.new(class)
    for k, v in pairs(props) do
        if k ~= "Parent" then inst[k] = v end
    end
    if props.Parent then inst.Parent = props.Parent end
    return inst
end

local function Corner(parent, r)
    return New("UICorner", { CornerRadius = UDim.new(0, r or 6), Parent = parent })
end

local function Stroke(parent, color, thickness, transp)
    return New("UIStroke", {
        ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
        Color           = color or Theme.Border,
        Transparency    = transp or 0,
        Thickness       = thickness or 1,
        Parent          = parent,
    })
end

local function Padding(parent, top, bottom, left, right)
    return New("UIPadding", {
        PaddingTop    = UDim.new(0, top    or 0),
        PaddingBottom = UDim.new(0, bottom or 0),
        PaddingLeft   = UDim.new(0, left   or 0),
        PaddingRight  = UDim.new(0, right  or 0),
        Parent        = parent,
    })
end

local function ListLayout(parent, gap, sort, dir)
    return New("UIListLayout", {
        Padding       = UDim.new(0, gap or 0),
        SortOrder     = sort or Enum.SortOrder.LayoutOrder,
        FillDirection = dir  or Enum.FillDirection.Vertical,
        Parent        = parent,
    })
end

-- // ─── Tooltip ──────────────────────────────────────────────────────────────
local ActiveTooltip = nil

local function MakeTooltip(parent, text, screenGui)
    if not text or text == "" then return end

    local tip = New("Frame", {
        Name = "Tooltip", BackgroundColor3 = Color3.fromRGB(20, 20, 26),
        BorderSizePixel = 0, AutomaticSize = Enum.AutomaticSize.XY,
        Visible = false, ZIndex = 9000,
        Parent = screenGui or parent:FindFirstAncestorOfClass("ScreenGui"),
    })
    Corner(tip, 4)
    Stroke(tip, Theme.BorderLight, 1)
    local tipLabel = New("TextLabel", {
        FontFace = FontObj.Regular, TextColor3 = Theme.Text,
        Text = text, BackgroundTransparency = 1,
        AutomaticSize = Enum.AutomaticSize.XY,
        TextSize = TextSize.Tiny, ZIndex = 9001,
        Parent = tip,
    })
    Padding(tipLabel, 4, 4, 6, 6)

    parent.MouseEnter:Connect(function()
        if ActiveTooltip and ActiveTooltip ~= tip then
            ActiveTooltip.Visible = false
        end
        ActiveTooltip = tip
        tip.Visible = true
    end)
    parent.MouseLeave:Connect(function()
        tip.Visible = false
    end)
    -- Track cursor
    local conn = rs.RenderStepped:Connect(function()
        if tip.Visible then
            local mPos = ui:GetMouseLocation()
            local vp   = workspace.CurrentCamera.ViewportSize
            local tx   = math.min(mPos.X + 12, vp.X - tip.AbsoluteSize.X - 4)
            local ty   = math.min(mPos.Y + 18, vp.Y - tip.AbsoluteSize.Y - 4)
            tip.Position = UDim2.new(0, tx, 0, ty)
        end
    end)
    table.insert(Connections, conn)
    return tip
end

-- // ─── Dragging ─────────────────────────────────────────────────────────────
local function MakeDraggable(frame, handle)
    local dragging, dragInput, dragStart, startPos = false, nil, nil, nil
    handle = handle or frame

    handle.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1
        or input.UserInputType == Enum.UserInputType.Touch then
            dragging  = true
            dragStart = input.Position
            startPos  = frame.Position
            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    dragging = false
                end
            end)
        end
    end)
    handle.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement
        or input.UserInputType == Enum.UserInputType.Touch then
            dragInput = input
        end
    end)
    ui.InputChanged:Connect(function(input)
        if input == dragInput and dragging then
            local delta = input.Position - dragStart
            frame.Position = UDim2.new(
                startPos.X.Scale, startPos.X.Offset + delta.X,
                startPos.Y.Scale, startPos.Y.Offset + delta.Y
            )
        end
    end)
end

-- // ─── Disconnect All ───────────────────────────────────────────────────────
local function DisconnectAll()
    for _, c in pairs(Connections) do
        if typeof(c) == "RBXScriptConnection" then c:Disconnect() end
    end
    Connections = {}
end

-- // ─── Config Helpers ───────────────────────────────────────────────────────
local function EnsureConfigDir()
    if isfolder and not isfolder("AcrylicConfigs") then
        makefolder("AcrylicConfigs")
    end
end

local function GetConfigs()
    local out = {}
    if isfolder and listfiles then
        EnsureConfigDir()
        for _, f in ipairs(listfiles("AcrylicConfigs")) do
            local n = f:match("AcrylicConfigs/(.+)%.json$") or f:match("AcrylicConfigs\\(.+)%.json$")
            if n then table.insert(out, n) end
        end
    end
    return out
end

-- // ─── Acrylic Blur ─────────────────────────────────────────────────────────
local AcrylicBlur = {}
AcrylicBlur.__index = AcrylicBlur

function AcrylicBlur.new(object)
    local self = setmetatable({ _object = object, _enabled = true }, AcrylicBlur)
    self:_Init()
    return self
end

function AcrylicBlur:_Init()
    for _, name in ipairs({"AcrylicBlur", "AcrylicBlurEffect"}) do
        local old = lg:FindFirstChild(name)
        if old then old:Destroy() end
    end
    local oldFolder = workspace.CurrentCamera:FindFirstChild("AcrylicBlur")
    if oldFolder then oldFolder:Destroy() end

    self._dof = New("DepthOfFieldEffect", {
        Name = "AcrylicBlur", FarIntensity = 0,
        FocusDistance = 0.05, InFocusRadius = 0.1, NearIntensity = 0.5,
        Parent = lg,
    })
    self._folder = New("Folder", { Name = "AcrylicBlur", Parent = workspace.CurrentCamera })
    self._root   = New("Part", {
        Name = "Root", Color = Color3.new(0,0,0), Material = Enum.Material.Glass,
        Size = Vector3.new(1,1,0), Anchored = true, CanCollide = false,
        CanQuery = false, Locked = true, CastShadow = false, Transparency = 0.95,
        Parent = self._folder,
    })
    New("SpecialMesh", { MeshType = Enum.MeshType.Brick, Parent = self._root })
    self._frame = New("Frame", {
        Size = UDim2.new(1,0,1,0), Position = UDim2.new(0.5,0,0.5,0),
        AnchorPoint = Vector2.new(0.5,0.5), BackgroundTransparency = 1,
        Parent = self._object,
    })
    self:_Render()
end

function AcrylicBlur:_Render(dist)
    dist = dist or 0.001
    local positions = { tl = Vector2.new(), tr = Vector2.new(), br = Vector2.new() }

    local function VpToWorld(loc, d)
        local ray = workspace.CurrentCamera:ScreenPointToRay(loc.X, loc.Y)
        return ray.Origin + ray.Direction * d
    end
    local function GetOffset()
        return (workspace.CurrentCamera.ViewportSize.Y / 2560) * 24 + 4
    end
    local function UpdatePositions(sz, pos)
        positions.tl = pos
        positions.tr = pos + Vector2.new(sz.X, 0)
        positions.br = pos + sz
    end
    local function Update()
        if not self._root or not self._enabled then return end
        local tl = VpToWorld(positions.tl, dist)
        local tr = VpToWorld(positions.tr, dist)
        local br = VpToWorld(positions.br, dist)
        self._root.CFrame = CFrame.fromMatrix(
            (tl + br) / 2,
            workspace.CurrentCamera.CFrame.XVector,
            workspace.CurrentCamera.CFrame.YVector,
            workspace.CurrentCamera.CFrame.ZVector
        )
        self._root.Mesh.Scale = Vector3.new((tr-tl).Magnitude, (tr-br).Magnitude, 0)
    end
    local function OnChange()
        if not self._enabled then return end
        local off  = GetOffset()
        local sz   = self._frame.AbsoluteSize - Vector2.new(off, off)
        local pos  = self._frame.AbsolutePosition + Vector2.new(off/2, off/2)
        UpdatePositions(sz, pos)
        task.spawn(Update)
    end

    Connections["blur_cf"]   = workspace.CurrentCamera:GetPropertyChangedSignal("CFrame"):Connect(Update)
    Connections["blur_vp"]   = workspace.CurrentCamera:GetPropertyChangedSignal("ViewportSize"):Connect(Update)
    Connections["blur_fov"]  = workspace.CurrentCamera:GetPropertyChangedSignal("FieldOfView"):Connect(Update)
    Connections["blur_apos"] = self._frame:GetPropertyChangedSignal("AbsolutePosition"):Connect(OnChange)
    Connections["blur_asz"]  = self._frame:GetPropertyChangedSignal("AbsoluteSize"):Connect(OnChange)
    Connections["blur_rs"]   = rs.RenderStepped:Connect(Update)
    task.spawn(OnChange)
end

function AcrylicBlur:SetEnabled(v)
    self._enabled = v
    if self._root then self._root.Transparency = v and 0.95 or 1 end
    if self._dof  then self._dof.Enabled = v end
end

function AcrylicBlur:Destroy()
    if self._folder then self._folder:Destroy() end
    for _, n in ipairs({"AcrylicBlur","AcrylicBlurEffect"}) do
        local f = lg:FindFirstChild(n)
        if f then f:Destroy() end
    end
end

-- // ─── Notification ─────────────────────────────────────────────────────────
local function EnsureNotifContainer(screenGui)
    if NotifContainer then return NotifContainer end
    NotifContainer = New("Frame", {
        Name = "NotifContainer", BackgroundTransparency = 1,
        Position = UDim2.new(1, -250, 0, 16),
        Size = UDim2.new(0, 230, 1, -32),
        Parent = screenGui,
    })
    ListLayout(NotifContainer, 8)
    return NotifContainer
end

-- // ─── Library Constructor ──────────────────────────────────────────────────
function Library.new(title, configFolder)
    local self = setmetatable({}, Library)
    -- Refresh Size based on device
    Size = MakeSize()

    self.title          = title or "Acrylic"
    self.configFolder   = configFolder or title or "Acrylic"
    self.sections       = {}
    self.currentTab     = nil
    self.minimized      = false
    self._acrylicBlur   = nil
    self._keybinds      = {}
    self._toggleKey     = Enum.KeyCode.RightControl
    self._visible       = true
    self._originalH     = Size.Window.Height
    self._minSize       = Vector2.new(Size.MinWin.Width, Size.MinWin.Height)
    self._maxSize       = Vector2.new(Size.MaxWin.Width, Size.MaxWin.Height)
    self._mobileToggle  = nil
    self._configElems   = {}
    self._autoSave      = false
    self._currentConfig = "default"
    self._deviceType    = Device.Detect()
    self._allTabs       = {}  -- for sidebar search

    self:_BuildWindow()
    self:_SetupKeybinds()
    self:_SetupMobile()
    self:_SetupViewportWatch()
    EnsureNotifContainer(self.screenGui)

    -- Show device info notification
    self:Notify({
        Title       = "Device Detected",
        Description = self._deviceType .. " | " .. tostring(math.floor(workspace.CurrentCamera.ViewportSize.X)) .. "x" .. tostring(math.floor(workspace.CurrentCamera.ViewportSize.Y)),
        Duration    = 3,
        Type        = "Info",
    })

    return self
end

-- // ─── Viewport Watcher (Auto Resize) ──────────────────────────────────────
function Library:_SetupViewportWatch()
    local conn = workspace.CurrentCamera:GetPropertyChangedSignal("ViewportSize"):Connect(function()
        local newDevice = Device.Detect()
        if newDevice ~= self._deviceType then
            self._deviceType = newDevice
            Size = MakeSize()
            -- Resize window smoothly
            local newWin = Device.GetWindowSize()
            Tween(self.container, {
                Size = UDim2.new(0, newWin.Width, 0, newWin.Height)
            }, Anim.Slow)
            self._originalH = newWin.Height
            -- Resize sidebar
            if self.sidebar then
                self.sidebar.Size = UDim2.new(0, Size.Sidebar, 1, 0)
            end
            if self.sidebarSep then
                self.sidebarSep.Position = UDim2.new(0, Size.Sidebar, 0, 0)
            end
            if self.contentFrame then
                self.contentFrame.Position = UDim2.new(0, Size.Sidebar + 1, 0, 0)
                self.contentFrame.Size = UDim2.new(1, -(Size.Sidebar + 1), 1, 0)
            end
            self:Notify({
                Title       = "Layout Updated",
                Description = "Switched to " .. newDevice,
                Duration    = 2,
                Type        = "Info",
            })
        end
    end)
    table.insert(Connections, conn)
end

-- // ─── Notify ───────────────────────────────────────────────────────────────
function Library:Notify(cfg)
    local title    = cfg.Title or "Notification"
    local desc     = cfg.Description or ""
    local duration = cfg.Duration or 3
    local icon     = cfg.Icon or "rbxassetid://10709775704"
    local nType    = cfg.Type or "Info"  -- "Info" | "Success" | "Warning" | "Error"

    local accentColor = Theme[nType] or Theme.Info

    local notif = New("Frame", {
        Name = "Notif", BackgroundColor3 = Theme.Notification.Background,
        Position = UDim2.new(1, 20, 0, 0),
        Size = UDim2.new(1, 0, 0, Size.Notif.Height),
        ClipsDescendants = true, Parent = NotifContainer,
    })
    Corner(notif, 6)
    Stroke(notif, Theme.Notification.Border, 1)

    -- Typed accent left bar
    New("Frame", {
        Name = "AccentBar", BackgroundColor3 = accentColor,
        Position = UDim2.new(0, 0, 0, 0), Size = UDim2.new(0, 3, 1, 0),
        BorderSizePixel = 0, Parent = notif,
    })

    New("TextLabel", {
        FontFace = FontObj.Medium, TextColor3 = Theme.Text, Text = title,
        TextXAlignment = Enum.TextXAlignment.Left,
        BackgroundTransparency = 1,
        Position = UDim2.new(0, 14, 0, 10), TextSize = TextSize.Normal,
        Size = UDim2.new(1, -55, 0, 18), Parent = notif,
    })
    New("TextLabel", {
        FontFace = FontObj.Regular, TextColor3 = Theme.TextDark, Text = desc,
        TextXAlignment = Enum.TextXAlignment.Left,
        TextTruncate = Enum.TextTruncate.AtEnd, TextWrapped = true,
        BackgroundTransparency = 1,
        Position = UDim2.new(0, 14, 0, 32), TextSize = TextSize.Small,
        Size = UDim2.new(1, -55, 0, 28), Parent = notif,
    })

    -- Type icon (colored dot)
    local dot = New("Frame", {
        BackgroundColor3 = accentColor,
        Position = UDim2.new(1, -28, 0, 14), Size = UDim2.new(0, 8, 0, 8),
        ZIndex = 2, Parent = notif,
    })
    Corner(dot, 100)

    local timerBar = New("Frame", {
        Name = "Timer", BackgroundColor3 = accentColor,
        Position = UDim2.new(0, 0, 1, -2), Size = UDim2.new(1, 0, 0, 2),
        Parent = notif,
    })
    Corner(timerBar, 100)

    Tween(notif,    { Position = UDim2.new(0, 0, 0, 0) }, 0.3, Enum.EasingStyle.Back, Enum.EasingDirection.Out)
    Tween(timerBar, { Size = UDim2.new(0, 0, 0, 2) }, duration, Enum.EasingStyle.Linear)
    task.delay(duration, function()
        Tween(notif, { Position = UDim2.new(1, 20, 0, 0) }, 0.3, Enum.EasingStyle.Back, Enum.EasingDirection.In)
        task.wait(0.35)
        notif:Destroy()
    end)
    return notif
end

-- // ─── Build Window ─────────────────────────────────────────────────────────
function Library:_BuildWindow()
    local vp = workspace.CurrentCamera.ViewportSize
    local wx = math.floor((vp.X - Size.Window.Width)  / 2)
    local wy = math.floor((vp.Y - Size.Window.Height) / 2)

    self.screenGui = New("ScreenGui", {
        Name = LIB_NAME, ResetOnSpawn = false,
        ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
        DisplayOrder = 100,
    })

    self.container = New("Frame", {
        Name = "Container", BackgroundColor3 = Theme.Background,
        BorderSizePixel = 0,
        Position = UDim2.new(0, wx, 0, wy),
        Size = UDim2.new(0, Size.Window.Width, 0, Size.Window.Height),
        ClipsDescendants = false,
        Parent = self.screenGui,
    })
    Corner(self.container, 8)
    Stroke(self.container, Theme.Border, 1)

    self.topBar = New("Frame", {
        Name = "TopBar", BackgroundTransparency = 1,
        Size = UDim2.new(1, 0, 0, 44), Parent = self.container,
    })

    New("TextLabel", {
        Name = "Title", FontFace = FontObj.Bold, TextColor3 = Theme.Text,
        Text = self.title, BackgroundTransparency = 1,
        Position = UDim2.new(0, 24, 0.5, -9), TextXAlignment = Enum.TextXAlignment.Left,
        TextSize = TextSize.Title, Size = UDim2.new(0, 160, 0, 18),
        Parent = self.topBar,
    })

    -- Device badge in title bar
    self._deviceBadge = New("TextLabel", {
        Name = "DeviceBadge", FontFace = FontObj.Regular,
        TextColor3 = Theme.TextDark,
        Text = "[" .. self._deviceType .. "]",
        BackgroundTransparency = 1,
        Position = UDim2.new(0, 190, 0.5, -7), TextXAlignment = Enum.TextXAlignment.Left,
        TextSize = TextSize.Tiny, Size = UDim2.new(0, 100, 0, 14),
        Parent = self.topBar,
    })

    self:_BuildControls()

    New("Frame", {
        Name = "Divider", BackgroundColor3 = Theme.Border,
        Position = UDim2.new(0, 0, 0, 44), BorderSizePixel = 0,
        Size = UDim2.new(1, 0, 0, 1), Parent = self.container,
    })

    self:_BuildContent()
    MakeDraggable(self.container, self.topBar)

    self.screenGui.Parent = plr.LocalPlayer:WaitForChild("PlayerGui")
    self._acrylicBlur = AcrylicBlur.new(self.container)
end

-- // ─── Window Controls ──────────────────────────────────────────────────────
function Library:_BuildControls()
    local function IconBtn(image, xOffset, onClick, hoverColor)
        local img = New("ImageButton", {
            ImageColor3 = Theme.TextDark, Image = image,
            BackgroundTransparency = 1,
            AnchorPoint = Vector2.new(1, 0.5),
            Position = UDim2.new(1, xOffset, 0.5, 0),
            Size = UDim2.new(0, 14, 0, 14),
            Parent = self.topBar,
        })
        img.MouseEnter:Connect(function() Tween(img, { ImageColor3 = hoverColor or Theme.Text }, Anim.Fast) end)
        img.MouseLeave:Connect(function() Tween(img, { ImageColor3 = Theme.TextDark }, Anim.Fast) end)
        img.MouseButton1Click:Connect(onClick)
        return img
    end

    IconBtn("rbxassetid://82603981310445", -35, function() self:_ToggleMinimize() end)
    IconBtn("rbxassetid://119943770201674", -12, function() self:Destroy() end, Color3.fromRGB(255, 90, 90))

    -- Resize handle
    self.resizeBtn = New("ImageButton", {
        Name = "Resize", ImageColor3 = Theme.Border,
        Image = "rbxassetid://120997033468887",
        BackgroundTransparency = 1,
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.new(1, -5, 1, -5),
        Size = UDim2.new(0, 60, 0, 58), BorderSizePixel = 0,
        Parent = self.container,
    })
    self:_SetupResize(self.resizeBtn)
end

-- // ─── Content Area ─────────────────────────────────────────────────────────
function Library:_BuildContent()
    self.mainContent = New("Frame", {
        Name = "MainContent", BackgroundTransparency = 1,
        Position = UDim2.new(0, 0, 0, 45),
        Size = UDim2.new(1, 0, 1, -45),
        ClipsDescendants = true, Parent = self.container,
    })

    -- Search box at top of sidebar
    local searchArea = New("Frame", {
        Name = "SearchArea", BackgroundTransparency = 1,
        Position = UDim2.new(0, 0, 0, 0),
        Size = UDim2.new(0, Size.Sidebar, 0, 36),
        Parent = self.mainContent,
    })
    local searchBox = New("TextBox", {
        FontFace = FontObj.Regular, TextColor3 = Theme.Text,
        PlaceholderText = "Search...", PlaceholderColor3 = Theme.TextDark,
        Text = "", BackgroundColor3 = Theme.Tertiary,
        BackgroundTransparency = 0.3, BorderSizePixel = 0,
        TextSize = TextSize.Small, ClearTextOnFocus = false,
        Size = UDim2.new(1, -12, 0, 24),
        Position = UDim2.new(0, 6, 0.5, -12),
        Parent = searchArea,
    })
    Corner(searchBox, 5)
    Stroke(searchBox, Theme.Border, 1)
    Padding(searchBox, 0, 0, 6, 6)

    self.sidebar = New("ScrollingFrame", {
        Name = "Sidebar", ScrollBarThickness = 0, BackgroundTransparency = 1,
        Position = UDim2.new(0, 0, 0, 36),
        Size = UDim2.new(0, Size.Sidebar, 1, -36),
        CanvasSize = UDim2.new(0,0,0,0),
        AutomaticCanvasSize = Enum.AutomaticSize.Y,
        ScrollingDirection = Enum.ScrollingDirection.Y,
        Parent = self.mainContent,
    })
    ListLayout(self.sidebar, 0)
    Padding(self.sidebar, 6, 6, 6, 6)

    self.sidebarSep = New("Frame", {
        Name = "Sep", BackgroundColor3 = Theme.Border,
        Position = UDim2.new(0, Size.Sidebar, 0, 0), BorderSizePixel = 0,
        Size = UDim2.new(0, 1, 1, 0), Parent = self.mainContent,
    })

    self.contentFrame = New("ScrollingFrame", {
        Name = "Content", ScrollBarThickness = 3,
        ScrollBarImageColor3 = Color3.fromRGB(60, 60, 72),
        BackgroundTransparency = 1,
        Position = UDim2.new(0, Size.Sidebar + 1, 0, 0),
        Size = UDim2.new(1, -(Size.Sidebar + 1), 1, 0),
        CanvasSize = UDim2.new(0,0,0,0),
        AutomaticCanvasSize = Enum.AutomaticSize.Y,
        ScrollingDirection = Enum.ScrollingDirection.Y,
        Parent = self.mainContent,
    })
    ListLayout(self.contentFrame, 8)
    Padding(self.contentFrame, 10, 10, 14, 14)

    -- Sidebar search logic
    searchBox:GetPropertyChangedSignal("Text"):Connect(function()
        local query = searchBox.Text:lower()
        for _, tabData in ipairs(self._allTabs) do
            local match = tabData.name:lower():find(query, 1, true)
            if tabData.frame then
                tabData.frame.Visible = (query == "" or match ~= nil)
            end
        end
    end)
end

-- // ─── Resize ───────────────────────────────────────────────────────────────
function Library:_SetupResize(handle)
    local resizing, resizeStart, startSize = false, nil, nil

    handle.MouseEnter:Connect(function() Tween(handle, { ImageColor3 = Theme.Accent }, Anim.Fast) end)
    handle.MouseLeave:Connect(function()
        if not resizing then Tween(handle, { ImageColor3 = Theme.Border }, Anim.Fast) end
    end)
    handle.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1
        or input.UserInputType == Enum.UserInputType.Touch then
            resizing    = true
            resizeStart = input.Position
            startSize   = self.container.AbsoluteSize
            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    resizing = false
                    Tween(handle, { ImageColor3 = Theme.Border }, Anim.Fast)
                end
            end)
        end
    end)
    ui.InputChanged:Connect(function(input)
        if resizing and (input.UserInputType == Enum.UserInputType.MouseMovement
            or input.UserInputType == Enum.UserInputType.Touch) then
            local d  = input.Position - resizeStart
            local nw = math.clamp(startSize.X + d.X, self._minSize.X, self._maxSize.X)
            local nh = math.clamp(startSize.Y + d.Y, self._minSize.Y, self._maxSize.Y)
            self.container.Size = UDim2.new(0, nw, 0, nh)
            self._originalH = nh
        end
    end)
end

-- // ─── Minimize ─────────────────────────────────────────────────────────────
function Library:_ToggleMinimize()
    self.minimized = not self.minimized
    if self.minimized then
        if self._acrylicBlur then self._acrylicBlur:SetEnabled(false) end
        Tween(self.mainContent, { Size = UDim2.new(1,0,0,0) }, Anim.Slow)
        Tween(self.container,   { Size = UDim2.new(0, self.container.AbsoluteSize.X, 0, 44) }, Anim.Slow)
        if self.resizeBtn then self.resizeBtn.Visible = false end
    else
        if self._acrylicBlur then self._acrylicBlur:SetEnabled(true) end
        Tween(self.container, { Size = UDim2.new(0, self.container.AbsoluteSize.X, 0, self._originalH) }, Anim.Slow)
        task.delay(0.1, function()
            Tween(self.mainContent, { Size = UDim2.new(1,0,1,-45) }, Anim.Normal)
        end)
        if self.resizeBtn then self.resizeBtn.Visible = true end
    end
end

-- // ─── Destroy ──────────────────────────────────────────────────────────────
function Library:Destroy()
    if self._autoSave then self:SaveConfig(self._currentConfig) end
    DisconnectAll()
    if self._acrylicBlur then self._acrylicBlur:Destroy() end
    if self.screenGui    then self.screenGui:Destroy() end
end

-- // ─── Keybind Setup ────────────────────────────────────────────────────────
function Library:_SetupKeybinds()
    local conn = ui.InputBegan:Connect(function(input, gp)
        if gp then return end
        if input.KeyCode == self._toggleKey then
            self._visible = not self._visible
            self.container.Visible = self._visible
        end
        for _, kb in pairs(self._keybinds) do
            if input.KeyCode == kb.key then
                pcall(kb.callback)
            end
        end
    end)
    table.insert(Connections, conn)
end

-- // ─── Mobile Toggle (Draggable) ────────────────────────────────────────────
function Library:_SetupMobile()
    if not Device.IsMobile() then return end
    local btn = New("ImageButton", {
        Name = "MobileToggle",
        Image = "rbxassetid://10709775704",
        ImageColor3 = Theme.Accent,
        BackgroundColor3 = Theme.Secondary,
        BackgroundTransparency = 0.2,
        Size = UDim2.new(0, 44, 0, 44),
        Position = UDim2.new(1, -54, 0.5, -22),
        ZIndex = 200,
        Parent = self.screenGui,
    })
    Corner(btn, 100)
    Stroke(btn, Theme.Accent, 1)
    Padding(btn, 10, 10, 10, 10)

    -- Make the mobile button draggable
    MakeDraggable(btn, btn)

    btn.MouseButton1Click:Connect(function()
        self._visible = not self._visible
        Tween(self.container, { BackgroundTransparency = self._visible and 0 or 1 }, Anim.Fast)
        self.container.Visible = self._visible
    end)
    self._mobileToggle = btn
end

-- // ─── Config System ────────────────────────────────────────────────────────
function Library:_RegisterConfig(id, elemType, getVal, setVal)
    self._configElems[id] = { type = elemType, getValue = getVal, setValue = setVal }
end

function Library:SaveConfig(name)
    if not writefile then
        return self:Notify({ Title = "Error", Description = "Config not supported", Duration = 3, Type = "Error" })
    end
    EnsureConfigDir()
    local data = {}
    for id, elem in pairs(self._configElems) do
        local v = elem.getValue()
        if typeof(v) == "Color3"   then v = { R=v.R, G=v.G, B=v.B, _type="Color3" } end
        if typeof(v) == "EnumItem" then v = { _type="EnumItem", _enum=tostring(v.EnumType), _value=v.Name } end
        data[id] = v
    end
    local ok = pcall(function() writefile("AcrylicConfigs/"..name..".json", hs:JSONEncode(data)) end)
    if ok then
        self._currentConfig = name
        self:Notify({ Title = "Saved", Description = name, Duration = 2, Type = "Success" })
    else
        self:Notify({ Title = "Error", Description = "Failed to save", Duration = 3, Type = "Error" })
    end
    return ok
end

function Library:LoadConfig(name)
    if not readfile or not isfile then
        return self:Notify({ Title = "Error", Description = "Config not supported", Duration = 3, Type = "Error" })
    end
    local path = "AcrylicConfigs/"..name..".json"
    if not isfile(path) then
        return self:Notify({ Title = "Error", Description = "Not found: "..name, Duration = 3, Type = "Warning" })
    end
    local ok, data = pcall(function() return hs:JSONDecode(readfile(path)) end)
    if not ok or not data then
        return self:Notify({ Title = "Error", Description = "Failed to load", Duration = 3, Type = "Error" })
    end
    for id, v in pairs(data) do
        if self._configElems[id] then
            if type(v)=="table" and v._type=="Color3"   then v = Color3.new(v.R, v.G, v.B) end
            if type(v)=="table" and v._type=="EnumItem" then v = Enum[v._enum][v._value] end
            pcall(function() self._configElems[id].setValue(v) end)
        end
    end
    self._currentConfig = name
    self:Notify({ Title = "Loaded", Description = name, Duration = 2, Type = "Success" })
    return true
end

function Library:DeleteConfig(name)
    if not delfile or not isfile then return false end
    local path = "AcrylicConfigs/"..name..".json"
    if isfile(path) then
        delfile(path)
        self:Notify({ Title = "Deleted", Description = name, Duration = 2, Type = "Warning" })
        return true
    end
    return false
end

function Library:GetConfigs() return GetConfigs() end

function Library:SetAutoSave(enabled)
    self._autoSave = enabled
    if enabled then
        task.spawn(function()
            while self._autoSave and self.screenGui and self.screenGui.Parent do
                task.wait(30)
                if self._autoSave then self:SaveConfig(self._currentConfig) end
            end
        end)
    end
end

-- // ─── Theme Switcher ───────────────────────────────────────────────────────
function Library:SetAccentColor(color)
    Theme.Accent     = color
    Theme.AccentGlow = color
    Theme.Info       = color
    Theme.Toggle.Enabled      = color
    Theme.Notification.Timer  = color
    -- You can walk all UI instances to update live if needed
    self:Notify({ Title = "Theme Updated", Description = "Accent color changed", Duration = 2, Type = "Info" })
end

-- // ─── Select Tab ───────────────────────────────────────────────────────────
function Library:_SelectTab(tab, tabFrame, tabStroke, iconLabel, tabText, accentBar)
    if self.currentTab then
        local prev = self.currentTab
        prev.content.Visible = false
        Tween(prev.button,    { BackgroundTransparency = 1 }, Anim.Normal)
        Tween(prev.stroke,    { Transparency = 1 }, Anim.Normal)
        Tween(prev.icon,      { ImageColor3 = Theme.TextDark }, Anim.Normal)
        Tween(prev.textLabel, { TextColor3 = Theme.TextDark }, Anim.Normal)
        Tween(prev.accentBar, { BackgroundTransparency = 1 }, Anim.Normal)
    end
    self.currentTab = tab
    tab.content.Visible = true
    Tween(tabFrame,   { BackgroundTransparency = 0.5 }, Anim.Normal)
    Tween(tabStroke,  { Transparency = 0 }, Anim.Normal)
    Tween(iconLabel,  { ImageColor3 = Theme.Accent }, Anim.Normal)
    Tween(tabText,    { TextColor3 = Theme.Text }, Anim.Normal)
    Tween(accentBar,  { BackgroundTransparency = 0 }, Anim.Normal)
end

-- // ─── Section ──────────────────────────────────────────────────────────────
function Library:CreateSection(name, icon)
    local section = { name=name, tabs={}, expanded=true, _library=self }

    local secFrame = New("Frame", {
        Name = "Sec_"..name, BackgroundTransparency = 1,
        Size = UDim2.new(1, -8, 0, 0),
        AutomaticSize = Enum.AutomaticSize.Y,
        Parent = self.sidebar,
    })
    ListLayout(secFrame, 2)

    local headerFrame = New("Frame", {
        Name = "Header", BackgroundTransparency = 1,
        Size = UDim2.new(1, 0, 0, 24), LayoutOrder = 0,
        Parent = secFrame,
    })
    local headerBtn = New("TextButton", {
        Text = "", BackgroundTransparency = 1,
        Size = UDim2.new(1, 0, 1, 0), Parent = headerFrame,
    })

    -- Optional section icon
    local xOffset = 4
    if icon and icon ~= "" then
        New("ImageLabel", {
            BackgroundTransparency = 1, Image = icon,
            ImageColor3 = Theme.TextDark,
            Position = UDim2.new(0, 4, 0.5, -6), Size = UDim2.new(0, 12, 0, 12),
            Parent = headerFrame,
        })
        xOffset = 20
    end

    New("TextLabel", {
        FontFace = FontObj.Medium, TextColor3 = Theme.TextDark, Text = name:upper(),
        TextXAlignment = Enum.TextXAlignment.Left, BackgroundTransparency = 1,
        Position = UDim2.new(0, xOffset, 0, 0),
        TextSize = TextSize.Tiny, Size = UDim2.new(1, -22, 1, 0),
        TextTransparency = 0, Parent = headerFrame,
    })
    local arrow = New("ImageButton", {
        Image = "rbxassetid://105558791071013", ImageColor3 = Theme.TextDark,
        BackgroundTransparency = 1, Rotation = 0,
        Position = UDim2.new(1, -18, 0.5, -6), Size = UDim2.new(0, 12, 0, 12),
        Parent = headerFrame,
    })

    local tabsCont = New("Frame", {
        Name = "Tabs", BackgroundTransparency = 1,
        Size = UDim2.new(1, 0, 0, 0),
        AutomaticSize = Enum.AutomaticSize.Y,
        ClipsDescendants = true, LayoutOrder = 1,
        Parent = secFrame,
    })
    ListLayout(tabsCont, 2)
    Padding(tabsCont, 0, 0, 8, 0)

    local function ToggleSec()
        section.expanded = not section.expanded
        Tween(arrow, { Rotation = section.expanded and 0 or 180 }, Anim.Normal)
        tabsCont.Visible = section.expanded
    end
    headerBtn.MouseButton1Click:Connect(ToggleSec)
    arrow.MouseButton1Click:Connect(ToggleSec)

    section.frame = secFrame
    section.tabsContainer = tabsCont
    table.insert(self.sections, section)

    local meta = setmetatable({}, { __index = section })
    function meta:CreateTab(n, ico, badge) return Library._CreateTab(self, n, ico, badge) end
    return meta
end

-- // ─── Tab ──────────────────────────────────────────────────────────────────
function Library._CreateTab(section, name, icon, badge)
    local tab = { name=name, elements={} }

    local tabFrame = New("Frame", {
        Name = name, BackgroundColor3 = Theme.Secondary,
        BackgroundTransparency = 1, BorderSizePixel = 0,
        Size = UDim2.new(1, 0, 0, Size.Tab.Height),
        Parent = section.tabsContainer,
    })
    Corner(tabFrame, 6)
    local tabStroke = Stroke(tabFrame, Theme.Border, 1, 1)

    local accentBar = New("Frame", {
        Name = "Accent", BackgroundColor3 = Theme.Accent,
        Position = UDim2.new(0, 0, 0.15, 0),
        Size = UDim2.new(0, 2, 0.7, 0),
        BackgroundTransparency = 1, BorderSizePixel = 0,
        Parent = tabFrame,
    })
    Corner(accentBar, 2)

    local iconLabel = New("ImageLabel", {
        BackgroundTransparency = 1, Image = icon or "rbxassetid://112235310154264",
        ImageColor3 = Theme.TextDark,
        AnchorPoint = Vector2.new(0, 0.5),
        Position = UDim2.new(0, 12, 0.5, 0), Size = UDim2.new(0, 14, 0, 14),
        Parent = tabFrame,
    })
    local tabText = New("TextLabel", {
        FontFace = FontObj.Medium, TextColor3 = Theme.TextDark, Text = name,
        TextXAlignment = Enum.TextXAlignment.Left, BackgroundTransparency = 1,
        Position = UDim2.new(0, 33, 0, 0), Size = UDim2.new(1, -46, 1, 0),
        TextSize = TextSize.Small, Parent = tabFrame,
    })

    -- Badge support
    local badgeLabel = nil
    if badge and badge ~= "" then
        badgeLabel = New("TextLabel", {
            FontFace = FontObj.Bold, TextColor3 = Color3.new(1,1,1),
            Text = tostring(badge), BackgroundColor3 = Theme.Accent,
            BorderSizePixel = 0, BackgroundTransparency = 0,
            AnchorPoint = Vector2.new(1, 0.5),
            Position = UDim2.new(1, -6, 0.5, 0),
            Size = UDim2.new(0, 0, 0, 14),
            AutomaticSize = Enum.AutomaticSize.X,
            TextSize = 9, ZIndex = 2,
            Parent = tabFrame,
        })
        Corner(badgeLabel, 4)
        Padding(badgeLabel, 0, 0, 3, 3)
    end

    local clickBtn = New("TextButton", {
        Text = "", BackgroundTransparency = 1,
        Size = UDim2.new(1, 0, 1, 0), Parent = tabFrame,
    })

    tab.content = New("Frame", {
        Name = name.."_Content", BackgroundTransparency = 1,
        Size = UDim2.new(1, 0, 0, 0),
        AutomaticSize = Enum.AutomaticSize.Y, Visible = false,
        Parent = section._library.contentFrame,
    })
    ListLayout(tab.content, 8)

    clickBtn.MouseButton1Click:Connect(function()
        Library._SelectTab(section._library, tab, tabFrame, tabStroke, iconLabel, tabText, accentBar)
    end)
    clickBtn.MouseEnter:Connect(function()
        if section._library.currentTab ~= tab then
            Tween(tabFrame, { BackgroundTransparency = 0.6 }, Anim.Fast)
        end
    end)
    clickBtn.MouseLeave:Connect(function()
        if section._library.currentTab ~= tab then
            Tween(tabFrame, { BackgroundTransparency = 1 }, Anim.Fast)
        end
    end)

    tab.button     = tabFrame
    tab.stroke     = tabStroke
    tab.icon       = iconLabel
    tab.textLabel  = tabText
    tab.accentBar  = accentBar
    tab.badgeLabel = badgeLabel
    tab.frame      = tabFrame
    tab._library   = section._library

    -- Register for search
    table.insert(section._library._allTabs, tab)

    table.insert(section.tabs, tab)
    if not section._library.currentTab then
        Library._SelectTab(section._library, tab, tabFrame, tabStroke, iconLabel, tabText, accentBar)
    end

    local meta = setmetatable({}, { __index = tab })
    function meta:CreateSection(n)        return Library._CreateContentSection(self, n) end
    function meta:CreateParagraph(c)      return Library._CreateParagraph(self, c) end
    function meta:CreateSlider(c)         return Library._CreateSlider(self, c) end
    function meta:CreateButton(c)         return Library._CreateButton(self, c) end
    function meta:CreateToggle(c)         return Library._CreateToggle(self, c) end
    function meta:CreateDropdown(c)       return Library._CreateDropdown(self, c) end
    function meta:CreateKeybind(c)        return Library._CreateKeybind(self, c, section._library) end
    function meta:CreateColorPicker(c)    return Library._CreateColorPicker(self, c) end
    function meta:CreateTextBox(c)        return Library._CreateTextBox(self, c) end
    function meta:CreateProgressBar(c)    return Library._CreateProgressBar(self, c) end
    function meta:CreateConfigSection()   return Library._CreateConfigSection(self) end
    function meta:SetBadge(b)
        if badgeLabel then
            badgeLabel.Text = tostring(b)
            badgeLabel.Visible = (b ~= nil and b ~= "")
        end
    end
    return meta
end

-- // ─── Content Section Label ────────────────────────────────────────────────
function Library._CreateContentSection(tab, name, icon)
    local frame = New("Frame", {
        Name = "Section_"..name, BackgroundTransparency = 1,
        Size = UDim2.new(1, 0, 0, 22), Parent = tab.content,
    })
    local xOff = 0
    if icon and icon ~= "" then
        New("ImageLabel", {
            BackgroundTransparency = 1, Image = icon,
            ImageColor3 = Theme.TextDark,
            Position = UDim2.new(0, 0, 0.5, -6), Size = UDim2.new(0, 12, 0, 12),
            Parent = frame,
        })
        xOff = 16
    end
    New("TextLabel", {
        FontFace = FontObj.Bold, TextColor3 = Theme.TextDark, Text = name:upper(),
        TextXAlignment = Enum.TextXAlignment.Left, BackgroundTransparency = 1,
        Position = UDim2.new(0, xOff, 0, 0), TextSize = TextSize.Tiny,
        Size = UDim2.new(0, 120, 1, 0), Parent = frame,
    })
    New("Frame", {
        BackgroundColor3 = Theme.Border, BorderSizePixel = 0,
        Position = UDim2.new(0, xOff + 125, 0.5, 0), Size = UDim2.new(1, -(xOff+130), 0, 1),
        Parent = frame,
    })
    return frame
end

-- // ─── Paragraph ────────────────────────────────────────────────────────────
function Library._CreateParagraph(tab, cfg)
    local frame = New("Frame", {
        Name = "Para", BackgroundColor3 = Theme.Secondary,
        BackgroundTransparency = 0.4, BorderSizePixel = 0,
        AutomaticSize = Enum.AutomaticSize.Y, Size = UDim2.new(1, 0, 0, 0),
        Parent = tab.content,
    })
    Corner(frame) Stroke(frame)
    Padding(frame, 10, 10, 12, 12)
    local layout = ListLayout(frame, 4)
    New("TextLabel", {
        FontFace = FontObj.Medium, TextColor3 = Theme.Text,
        Text = cfg.Title or "", TextXAlignment = Enum.TextXAlignment.Left,
        BackgroundTransparency = 1, TextWrapped = true,
        TextSize = TextSize.Normal, AutomaticSize = Enum.AutomaticSize.Y,
        Size = UDim2.new(1, 0, 0, 0), Parent = frame,
    })
    New("TextLabel", {
        FontFace = FontObj.Regular, TextColor3 = Theme.TextDark,
        Text = cfg.Content or "", TextXAlignment = Enum.TextXAlignment.Left,
        BackgroundTransparency = 1, TextWrapped = true,
        TextSize = TextSize.Small, AutomaticSize = Enum.AutomaticSize.Y,
        Size = UDim2.new(1, 0, 0, 0), Parent = frame,
    })
    return frame
end

-- // ─── Button ───────────────────────────────────────────────────────────────
function Library._CreateButton(tab, cfg)
    local name      = cfg.Name or "Button"
    local callback  = cfg.Callback or function() end
    local tooltip   = cfg.Tooltip or ""

    local frame = New("Frame", {
        Name = "BTN_"..name, BackgroundColor3 = Theme.Secondary,
        BackgroundTransparency = 0.4, BorderSizePixel = 0,
        Size = UDim2.new(1, 0, 0, Size.Button.Height), Parent = tab.content,
    })
    Corner(frame) Stroke(frame)

    New("TextLabel", {
        FontFace = FontObj.Medium, TextColor3 = Theme.Text, Text = name,
        TextXAlignment = Enum.TextXAlignment.Left, BackgroundTransparency = 1,
        Position = UDim2.new(0, 10, 0.5, -9), TextSize = TextSize.Normal,
        Size = UDim2.new(1, -60, 0, 18), Parent = frame,
    })

    local btn = New("TextButton", {
        FontFace = FontObj.Medium, TextColor3 = Theme.Accent,
        Text = "Run", BackgroundColor3 = Theme.Tertiary,
        BackgroundTransparency = 0.3, BorderSizePixel = 0,
        AnchorPoint = Vector2.new(1, 0.5),
        Position = UDim2.new(1, -10, 0.5, 0),
        Size = UDim2.new(0, 44, 0, 24), TextSize = TextSize.Small,
        Parent = frame,
    })
    Corner(btn, 5) Stroke(btn, Theme.Accent, 1, 0.6)

    btn.MouseEnter:Connect(function()
        Tween(btn, { BackgroundTransparency = 0, TextColor3 = Theme.Text }, Anim.Fast)
    end)
    btn.MouseLeave:Connect(function()
        Tween(btn, { BackgroundTransparency = 0.3, TextColor3 = Theme.Accent }, Anim.Fast)
    end)
    btn.MouseButton1Click:Connect(function()
        Tween(btn, { BackgroundTransparency = 0.6 }, Anim.Fast)
        task.delay(0.1, function() Tween(btn, { BackgroundTransparency = 0.3 }, Anim.Fast) end)
        pcall(callback)
    end)

    local sGui = frame:FindFirstAncestorOfClass("ScreenGui")
    if tooltip ~= "" and sGui then MakeTooltip(frame, tooltip, sGui) end
    return { Click = function() pcall(callback) end }
end

-- // ─── Toggle ───────────────────────────────────────────────────────────────
function Library._CreateToggle(tab, cfg)
    local name      = cfg.Name or "Toggle"
    local callback  = cfg.Callback or function() end
    local state     = cfg.Default or false
    local tooltip   = cfg.Tooltip or ""

    local frame = New("Frame", {
        Name = "TG_"..name, BackgroundColor3 = Theme.Secondary,
        BackgroundTransparency = 0.4, BorderSizePixel = 0,
        Size = UDim2.new(1, 0, 0, Size.Button.Height), Parent = tab.content,
    })
    Corner(frame) Stroke(frame)
    New("TextLabel", {
        FontFace = FontObj.Medium, TextColor3 = Theme.Text, Text = name,
        TextXAlignment = Enum.TextXAlignment.Left, BackgroundTransparency = 1,
        Position = UDim2.new(0, 10, 0.5, -9), TextSize = TextSize.Normal,
        Size = UDim2.new(1, -60, 0, 18), Parent = frame,
    })

    local track = New("Frame", {
        BackgroundColor3 = state and Theme.Toggle.Enabled or Theme.Toggle.Disabled,
        AnchorPoint = Vector2.new(1, 0.5), Position = UDim2.new(1, -10, 0.5, 0),
        BorderSizePixel = 0, Size = UDim2.new(0, Size.Toggle.Width, 0, Size.Toggle.Height),
        Parent = frame,
    })
    Corner(track, 100)
    local circle = New("Frame", {
        BackgroundColor3 = Theme.Toggle.Circle, BorderSizePixel = 0,
        AnchorPoint = Vector2.new(0, 0.5), Position = UDim2.new(0, state and (Size.Toggle.Width - Size.Toggle.Circle - 4) or 4, 0.5, 0),
        Size = UDim2.new(0, Size.Toggle.Circle, 0, Size.Toggle.Circle),
        Parent = track,
    })
    Corner(circle, 100)

    local btn = New("TextButton", {
        Text = "", BackgroundTransparency = 1,
        Size = UDim2.new(1,0,1,0), Parent = frame,
    })

    local function Update(s)
        state = s
        Tween(track,  { BackgroundColor3 = s and Theme.Toggle.Enabled or Theme.Toggle.Disabled }, Anim.Normal)
        Tween(circle, { Position = UDim2.new(0, s and (Size.Toggle.Width - Size.Toggle.Circle - 4) or 4, 0.5, 0) }, Anim.Normal)
        pcall(callback, s)
    end
    btn.MouseButton1Click:Connect(function() Update(not state) end)

    local sGui = frame:FindFirstAncestorOfClass("ScreenGui")
    if tooltip ~= "" and sGui then MakeTooltip(frame, tooltip, sGui) end

    local methods = {
        SetState = function(_, s) Update(s) end,
        GetState = function() return state end,
    }
    if cfg.Flag and tab._library then
        tab._library:_RegisterConfig(cfg.Flag, "Toggle", function() return state end, function(v) Update(v) end)
    end
    return methods
end

-- // ─── Slider (with Realtime Popup Value) ──────────────────────────────────
function Library._CreateSlider(tab, cfg)
    local name     = cfg.Name or "Slider"
    local min      = cfg.Min or 0
    local max      = cfg.Max or 100
    local default  = cfg.Default or min
    local suffix   = cfg.Suffix or ""
    local callback = cfg.Callback or function() end
    local tooltip  = cfg.Tooltip or ""

    local curVal = math.clamp(default, min, max)

    local frame = New("Frame", {
        Name = "SL_"..name, BackgroundColor3 = Theme.Secondary,
        BackgroundTransparency = 0.4, BorderSizePixel = 0,
        Size = UDim2.new(1, 0, 0, Size.Slider.Height), Parent = tab.content,
    })
    Corner(frame) Stroke(frame)

    New("TextLabel", {
        FontFace = FontObj.Medium, TextColor3 = Theme.Text, Text = name,
        TextXAlignment = Enum.TextXAlignment.Left, BackgroundTransparency = 1,
        Position = UDim2.new(0, 10, 0, 6), TextSize = TextSize.Normal,
        Size = UDim2.new(0.6, 0, 0, 18), Parent = frame,
    })

    local valueLabel = New("TextLabel", {
        FontFace = FontObj.Regular, TextColor3 = Theme.TextDark,
        Text = tostring(curVal)..suffix,
        TextXAlignment = Enum.TextXAlignment.Right, BackgroundTransparency = 1,
        Position = UDim2.new(0.6, 0, 0, 6), TextSize = TextSize.Small,
        Size = UDim2.new(0.4, -10, 0, 18), Parent = frame,
    })

    local track = New("Frame", {
        BackgroundColor3 = Theme.Tertiary, BorderSizePixel = 0,
        Position = UDim2.new(0, 10, 0, 30), Size = UDim2.new(1, -20, 0, 6),
        Parent = frame,
    })
    Corner(track, 100)

    local fill = New("Frame", {
        BackgroundColor3 = Theme.Accent, BorderSizePixel = 0,
        Size = UDim2.new((curVal - min) / (max - min), 0, 1, 0),
        Parent = track,
    })
    Corner(fill, 100)
    New("UIGradient", {
        Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, Theme.AccentDark),
            ColorSequenceKeypoint.new(1, Theme.Accent),
        }),
        Parent = fill,
    })

    local thumb = New("Frame", {
        BackgroundColor3 = Theme.Toggle.Circle,
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.new((curVal - min) / (max - min), 0, 0.5, 0),
        Size = UDim2.new(0, 12, 0, 12), BorderSizePixel = 0,
        ZIndex = 2, Parent = track,
    })
    Corner(thumb, 100)
    Stroke(thumb, Theme.Accent, 1)

    -- Realtime popup value bubble
    local popup = New("Frame", {
        BackgroundColor3 = Color3.fromRGB(20, 20, 26),
        AnchorPoint = Vector2.new(0.5, 1),
        Position = UDim2.new((curVal - min)/(max - min), 0, -0.4, 0),
        Size = UDim2.new(0, 36, 0, 20),
        Visible = false, ZIndex = 50, BorderSizePixel = 0,
        Parent = track,
    })
    Corner(popup, 4)
    Stroke(popup, Theme.BorderLight, 1)
    local popupLabel = New("TextLabel", {
        FontFace = FontObj.Bold, TextColor3 = Theme.Accent,
        Text = tostring(curVal), BackgroundTransparency = 1,
        TextSize = TextSize.Tiny, Size = UDim2.new(1,0,1,0),
        ZIndex = 51, Parent = popup,
    })

    local btn = New("TextButton", {
        Text = "", BackgroundTransparency = 1,
        Size = UDim2.new(1, 0, 1, 0), ZIndex = 3, Parent = frame,
    })

    local dragging = false
    local function SetValue(v)
        v = math.clamp(math.round(v), min, max)
        curVal = v
        local t = (v - min) / (max - min)
        fill.Size    = UDim2.new(t, 0, 1, 0)
        thumb.Position = UDim2.new(t, 0, 0.5, 0)
        popup.Position = UDim2.new(t, 0, -0.4, 0)
        valueLabel.Text  = tostring(v)..suffix
        popupLabel.Text  = tostring(v)
        pcall(callback, v)
    end

    local function HandleInput(input)
        local trackPos  = track.AbsolutePosition
        local trackSize = track.AbsoluteSize
        local rel = (input.Position.X - trackPos.X) / trackSize.X
        SetValue(min + (max - min) * math.clamp(rel, 0, 1))
    end

    btn.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1
        or input.UserInputType == Enum.UserInputType.Touch then
            dragging = true
            popup.Visible = true
            Tween(thumb, { Size = UDim2.new(0, 16, 0, 16) }, Anim.Fast)
            HandleInput(input)
        end
    end)
    ui.InputChanged:Connect(function(input)
        if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement
            or input.UserInputType == Enum.UserInputType.Touch) then
            HandleInput(input)
        end
    end)
    ui.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1
        or input.UserInputType == Enum.UserInputType.Touch then
            dragging = false
            popup.Visible = false
            Tween(thumb, { Size = UDim2.new(0, 12, 0, 12) }, Anim.Fast)
        end
    end)

    local sGui = frame:FindFirstAncestorOfClass("ScreenGui")
    if tooltip ~= "" and sGui then MakeTooltip(frame, tooltip, sGui) end

    local methods = {
        SetValue = function(_, v) SetValue(v) end,
        GetValue = function() return curVal end,
    }
    if cfg.Flag and tab._library then
        tab._library:_RegisterConfig(cfg.Flag, "Slider", function() return curVal end, function(v) SetValue(v) end)
    end
    return methods
end

-- // ─── Progress Bar ─────────────────────────────────────────────────────────
function Library._CreateProgressBar(tab, cfg)
    local name    = cfg.Name or "Progress"
    local min     = cfg.Min or 0
    local max     = cfg.Max or 100
    local default = cfg.Default or 0
    local suffix  = cfg.Suffix or "%"
    local color   = cfg.Color or Theme.Accent

    local curVal = math.clamp(default, min, max)

    local frame = New("Frame", {
        Name = "PB_"..name, BackgroundColor3 = Theme.Secondary,
        BackgroundTransparency = 0.4, BorderSizePixel = 0,
        Size = UDim2.new(1, 0, 0, 44), Parent = tab.content,
    })
    Corner(frame) Stroke(frame)

    New("TextLabel", {
        FontFace = FontObj.Medium, TextColor3 = Theme.Text, Text = name,
        TextXAlignment = Enum.TextXAlignment.Left, BackgroundTransparency = 1,
        Position = UDim2.new(0, 10, 0, 5), TextSize = TextSize.Normal,
        Size = UDim2.new(0.7, 0, 0, 18), Parent = frame,
    })

    local valLabel = New("TextLabel", {
        FontFace = FontObj.Regular, TextColor3 = color,
        Text = tostring(curVal)..suffix,
        TextXAlignment = Enum.TextXAlignment.Right, BackgroundTransparency = 1,
        Position = UDim2.new(0.7, 0, 0, 5), TextSize = TextSize.Small,
        Size = UDim2.new(0.3, -10, 0, 18), Parent = frame,
    })

    local track = New("Frame", {
        BackgroundColor3 = Theme.Tertiary, BorderSizePixel = 0,
        Position = UDim2.new(0, 10, 0, 28), Size = UDim2.new(1, -20, 0, 6),
        Parent = frame,
    })
    Corner(track, 100)

    local fill = New("Frame", {
        BackgroundColor3 = color, BorderSizePixel = 0,
        Size = UDim2.new((curVal - min) / (max - min), 0, 1, 0),
        Parent = track,
    })
    Corner(fill, 100)
    New("UIGradient", {
        Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, color),
            ColorSequenceKeypoint.new(1, Color3.new(
                math.min(color.R + 0.15, 1),
                math.min(color.G + 0.15, 1),
                math.min(color.B + 0.15, 1)
            )),
        }),
        Parent = fill,
    })

    local function SetValue(v)
        v = math.clamp(v, min, max)
        curVal = v
        local t = (v - min) / (max - min)
        Tween(fill, { Size = UDim2.new(t, 0, 1, 0) }, Anim.Normal)
        valLabel.Text = tostring(math.floor(v))..suffix
    end

    return {
        SetValue = function(_, v) SetValue(v) end,
        GetValue = function() return curVal end,
        -- Animate to value over time
        AnimateTo = function(_, v, dur)
            local steps = 30
            local diff  = v - curVal
            for i = 1, steps do
                task.wait((dur or 1) / steps)
                SetValue(curVal + diff / steps)
            end
        end,
    }
end

-- // ─── Dropdown ─────────────────────────────────────────────────────────────
function Library._CreateDropdown(tab, cfg)
    local name      = cfg.Name or "Dropdown"
    local options   = cfg.Options or {}
    local callback  = cfg.Callback or function() end
    local multiSel  = cfg.MultiSelect or false
    local maxVis    = cfg.MaxVisible or 5
    local tooltip   = cfg.Tooltip or ""

    local selected  = cfg.Default or (multiSel and {} or (options[1] or ""))

    local frame = New("Frame", {
        Name = "DD_"..name, BackgroundColor3 = Theme.Secondary,
        BackgroundTransparency = 0.4, BorderSizePixel = 0,
        Size = UDim2.new(1, 0, 0, Size.Dropdown.Height), Parent = tab.content,
        ZIndex = 1,
    })
    Corner(frame) Stroke(frame)

    New("TextLabel", {
        FontFace = FontObj.Medium, TextColor3 = Theme.Text, Text = name,
        TextXAlignment = Enum.TextXAlignment.Left, BackgroundTransparency = 1,
        Position = UDim2.new(0, 10, 0.5, -9), TextSize = TextSize.Normal,
        Size = UDim2.new(0.5, 0, 0, 18), Parent = frame,
    })

    local selDisplay = New("Frame", {
        BackgroundColor3 = Theme.Tertiary, BackgroundTransparency = 0.1,
        AnchorPoint = Vector2.new(1, 0.5), Position = UDim2.new(1, -10, 0.5, 0),
        BorderSizePixel = 0, Size = UDim2.new(0, 138, 0, 24), ZIndex = 2, Parent = frame,
    })
    Corner(selDisplay, 5) Stroke(selDisplay)

    local selLabel = New("TextLabel", {
        FontFace = FontObj.Regular, TextColor3 = Theme.Text,
        Text = "", TextXAlignment = Enum.TextXAlignment.Left,
        BackgroundTransparency = 1, TextSize = TextSize.Small,
        TextTruncate = Enum.TextTruncate.AtEnd,
        Position = UDim2.new(0, 6, 0, 0), Size = UDim2.new(1, -20, 1, 0),
        ZIndex = 2, Parent = selDisplay,
    })
    local arrow = New("ImageLabel", {
        BackgroundTransparency = 1, Image = "rbxassetid://105558791071013",
        ImageColor3 = Theme.TextDark, Rotation = 0,
        AnchorPoint = Vector2.new(1, 0.5),
        Position = UDim2.new(1, -6, 0.5, 0), Size = UDim2.new(0, 10, 0, 10),
        ZIndex = 2, Parent = selDisplay,
    })

    local optsH    = math.min(#options, maxVis) * Size.Dropdown.OptionHeight
    local expanded = false
    local optsCont = New("Frame", {
        BackgroundColor3 = Theme.Secondary, BorderSizePixel = 0,
        AnchorPoint = Vector2.new(1, 0),
        Position = UDim2.new(1, -10, 1, 4),
        Size = UDim2.new(0, 138, 0, optsH),
        Visible = false, ZIndex = 100, ClipsDescendants = true, Parent = frame,
    })
    Corner(optsCont, 6) Stroke(optsCont)
    local optsScroll = New("ScrollingFrame", {
        BackgroundTransparency = 1, BorderSizePixel = 0,
        Size = UDim2.new(1,0,1,0),
        CanvasSize = UDim2.new(0,0,0,#options*Size.Dropdown.OptionHeight),
        ScrollBarThickness = 3, ScrollBarImageColor3 = Color3.fromRGB(60,60,72),
        ZIndex = 100, Parent = optsCont,
    })
    ListLayout(optsScroll, 0)

    local function UpdateText()
        selLabel.Text = multiSel and (#selected>0 and table.concat(selected,", ") or "None") or tostring(selected)
    end

    local function MakeOption(opt)
        local ob = New("TextButton", {
            Name = opt, FontFace = FontObj.Regular, TextColor3 = Theme.Text, Text = opt,
            BackgroundTransparency = 1, BorderSizePixel = 0,
            TextSize = TextSize.Small,
            Size = UDim2.new(1, 0, 0, Size.Dropdown.OptionHeight),
            ZIndex = 100, Parent = optsScroll,
        })
        ob.MouseEnter:Connect(function() Tween(ob, { BackgroundTransparency = 0.5, TextColor3 = Theme.Accent }, Anim.Fast) end)
        ob.MouseLeave:Connect(function() Tween(ob, { BackgroundTransparency = 1, TextColor3 = Theme.Text }, Anim.Fast) end)
        ob.MouseButton1Click:Connect(function()
            if multiSel then
                local idx = table.find(selected, opt)
                if idx then table.remove(selected, idx) else table.insert(selected, opt) end
                UpdateText() callback(selected)
            else
                selected = opt UpdateText() callback(selected)
                expanded = false optsCont.Visible = false
                Tween(arrow, { Rotation = 0 }, Anim.Normal)
                frame.ZIndex = 1
            end
        end)
    end
    for _, o in ipairs(options) do MakeOption(o) end
    UpdateText()

    New("TextButton", {
        Text = "", BackgroundTransparency = 1, Size = UDim2.new(1,0,1,0),
        ZIndex = 3, Parent = selDisplay,
    }).MouseButton1Click:Connect(function()
        expanded = not expanded
        optsCont.Visible = expanded
        Tween(arrow, { Rotation = expanded and 180 or 0 }, Anim.Normal)
        frame.ZIndex = expanded and 10 or 1
    end)

    local sGui = frame:FindFirstAncestorOfClass("ScreenGui")
    if tooltip ~= "" and sGui then MakeTooltip(frame, tooltip, sGui) end

    local methods = {
        SetValue = function(_, v)
            if multiSel and type(v)=="table" then selected=v elseif not multiSel then selected=v end
            UpdateText() callback(selected)
        end,
        GetValue = function() return selected end,
        Refresh  = function(_, newOpts)
            options = newOpts
            for _, c in ipairs(optsScroll:GetChildren()) do
                if c:IsA("TextButton") then c:Destroy() end
            end
            for _, o in ipairs(options) do MakeOption(o) end
            optsScroll.CanvasSize = UDim2.new(0,0,0,#options*Size.Dropdown.OptionHeight)
            local newH = math.min(#options*Size.Dropdown.OptionHeight, maxVis*Size.Dropdown.OptionHeight)
            optsCont.Size = UDim2.new(0, 138, 0, newH)
        end,
    }
    if cfg.Flag and tab._library then
        tab._library:_RegisterConfig(cfg.Flag, "Dropdown", function() return selected end, function(v) methods:SetValue(v) end)
    end
    return methods
end

-- // ─── Keybind ──────────────────────────────────────────────────────────────
function Library._CreateKeybind(tab, cfg, lib)
    local name     = cfg.Name or "Keybind"
    local callback = cfg.Callback or function() end
    local curKey   = cfg.Default or Enum.KeyCode.F
    local listening = false
    local tooltip   = cfg.Tooltip or "Click to rebind"

    local frame = New("Frame", {
        Name = "KB_"..name, BackgroundColor3 = Theme.Secondary,
        BackgroundTransparency = 0.4, BorderSizePixel = 0,
        Size = UDim2.new(1, 0, 0, Size.Button.Height), Parent = tab.content,
    })
    Corner(frame) Stroke(frame)
    New("TextLabel", {
        FontFace = FontObj.Medium, TextColor3 = Theme.Text, Text = name,
        TextXAlignment = Enum.TextXAlignment.Left, BackgroundTransparency = 1,
        Position = UDim2.new(0, 10, 0.5, -9), TextSize = TextSize.Normal,
        Size = UDim2.new(0, 200, 0, 18), Parent = frame,
    })

    -- Keyboard icon + key label box
    local kbBox = New("Frame", {
        BackgroundColor3 = Theme.Tertiary, BackgroundTransparency = 0.1,
        AnchorPoint = Vector2.new(1, 0.5), Position = UDim2.new(1, -10, 0.5, 0),
        BorderSizePixel = 0, Size = UDim2.new(0, 50, 0, 22), Parent = frame,
    })
    Corner(kbBox, 5) Stroke(kbBox)

    -- Small keyboard icon
    New("ImageLabel", {
        BackgroundTransparency = 1,
        Image = "rbxassetid://10734896603",
        ImageColor3 = Theme.TextDark,
        AnchorPoint = Vector2.new(0, 0.5),
        Position = UDim2.new(0, 4, 0.5, 0),
        Size = UDim2.new(0, 12, 0, 12),
        Parent = kbBox,
    })
    local keyL = New("TextLabel", {
        FontFace = FontObj.Regular, TextColor3 = Theme.Text,
        Text = curKey.Name, BackgroundTransparency = 1,
        TextSize = TextSize.Tiny,
        Position = UDim2.new(0, 18, 0, 0),
        Size = UDim2.new(1, -20, 1, 0), Parent = kbBox,
        TextXAlignment = Enum.TextXAlignment.Left,
        TextTruncate = Enum.TextTruncate.AtEnd,
    })

    local kbId = name.."_"..tostring(tick())
    lib._keybinds[kbId] = { key = curKey, callback = callback }

    local function UpdateDisplay()
        if listening then
            keyL.Text = "..."
            Tween(kbBox, { BackgroundColor3 = Theme.AccentDark }, Anim.Fast)
            Tween(keyL,  { TextColor3 = Theme.Accent }, Anim.Fast)
        else
            local displayName = curKey.Name
            if #displayName > 6 then displayName = displayName:sub(1,5)..".." end
            keyL.Text = displayName
            Tween(kbBox, { BackgroundColor3 = Theme.Tertiary }, Anim.Fast)
            Tween(keyL,  { TextColor3 = Theme.Text }, Anim.Fast)
        end
    end

    New("TextButton", {
        Text = "", BackgroundTransparency = 1, Size = UDim2.new(1,0,1,0), Parent = kbBox,
    }).MouseButton1Click:Connect(function() listening = true UpdateDisplay() end)

    local conn = ui.InputBegan:Connect(function(input, gp)
        if listening and input.UserInputType == Enum.UserInputType.Keyboard then
            curKey = input.KeyCode listening = false
            lib._keybinds[kbId].key = curKey UpdateDisplay()
        end
    end)
    table.insert(Connections, conn)
    UpdateDisplay()

    local sGui = frame:FindFirstAncestorOfClass("ScreenGui")
    if tooltip ~= "" and sGui then MakeTooltip(kbBox, tooltip, sGui) end

    local methods = {
        SetKey = function(_, kc)
            curKey = kc lib._keybinds[kbId].key = kc UpdateDisplay()
        end,
        GetKey = function() return curKey end,
    }
    if cfg.Flag and lib then
        lib:_RegisterConfig(cfg.Flag, "Keybind", function() return curKey end, function(v) methods:SetKey(v) end)
    end
    return methods
end

-- // ─── Color Picker ─────────────────────────────────────────────────────────
function Library._CreateColorPicker(tab, cfg)
    local name     = cfg.Name or "Color"
    local callback = cfg.Callback or function() end
    local cur      = cfg.Default or Color3.fromRGB(124,106,252)
    local h, s, v  = cur:ToHSV()
    local expanded = false

    local frame = New("Frame", {
        Name = "CP_"..name, BackgroundColor3 = Theme.Secondary,
        BackgroundTransparency = 0.4, BorderSizePixel = 0,
        Size = UDim2.new(1, 0, 0, Size.Button.Height), Parent = tab.content,
    })
    Corner(frame) Stroke(frame)
    New("TextLabel", {
        FontFace = FontObj.Medium, TextColor3 = Theme.Text, Text = name,
        TextXAlignment = Enum.TextXAlignment.Left, BackgroundTransparency = 1,
        Position = UDim2.new(0, 10, 0, 0), TextSize = TextSize.Normal,
        Size = UDim2.new(1, -50, 1, 0), Parent = frame,
    })
    local preview = New("Frame", {
        BackgroundColor3 = cur, Position = UDim2.new(1, -44, 0.5, -8),
        Size = UDim2.new(0, 34, 0, 16), ZIndex = 2, Parent = frame,
    })
    Corner(preview, 4) Stroke(preview)
    local prevBtn = New("TextButton", {
        Text = "", BackgroundTransparency = 1, Size = UDim2.new(1,0,1,0),
        ZIndex = 3, Parent = preview,
    })

    local picker = New("Frame", {
        BackgroundColor3 = Color3.fromRGB(18,18,22), BorderSizePixel = 0,
        Size = UDim2.new(0, 164, 0, 120), Visible = false, ZIndex = 3000,
        Parent = tab.content:FindFirstAncestorOfClass("ScreenGui") or tab.content,
    })
    Corner(picker, 8) Stroke(picker, Theme.Border, 1)

    local svPicker = New("Frame", {
        BackgroundColor3 = Color3.fromHSV(h, 1, 1),
        Position = UDim2.new(0, 8, 0, 8),
        Size = UDim2.new(1, -16, 0, 88), ZIndex = 3001, Parent = picker,
    })
    Corner(svPicker, 5)
    local wL = New("Frame", { BackgroundColor3 = Color3.new(1,1,1), Size = UDim2.new(1,0,1,0), ZIndex = 3002, Parent = svPicker })
    Corner(wL, 5)
    New("UIGradient", { Color = ColorSequence.new(Color3.new(1,1,1)), Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0,0),NumberSequenceKeypoint.new(1,1)}), Parent = wL })
    local bL = New("Frame", { BackgroundColor3 = Color3.new(0,0,0), Size = UDim2.new(1,0,1,0), ZIndex = 3003, Parent = svPicker })
    Corner(bL, 5)
    New("UIGradient", { Color = ColorSequence.new(Color3.new(0,0,0)), Rotation = 90, Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0,1),NumberSequenceKeypoint.new(1,0)}), Parent = bL })

    local svCursor = New("Frame", {
        BackgroundColor3 = Color3.new(1,1,1), BackgroundTransparency = 1,
        AnchorPoint = Vector2.new(0.5,0.5),
        Position = UDim2.new(s, 0, 1-v, 0), Size = UDim2.new(0,10,0,10), ZIndex = 3005, Parent = svPicker,
    })
    Corner(svCursor, 100)
    New("UIStroke", { Thickness = 1.5, Color = Color3.new(1,1,1), Parent = svCursor })

    local hueSl = New("Frame", {
        Position = UDim2.new(0, 8, 0, 102), Size = UDim2.new(1, -16, 0, 8), ZIndex = 3001, Parent = picker,
    })
    Corner(hueSl, 100)
    New("UIGradient", {
        Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0,     Color3.fromHSV(0,1,1)),
            ColorSequenceKeypoint.new(0.167, Color3.fromHSV(0.167,1,1)),
            ColorSequenceKeypoint.new(0.333, Color3.fromHSV(0.333,1,1)),
            ColorSequenceKeypoint.new(0.5,   Color3.fromHSV(0.5,1,1)),
            ColorSequenceKeypoint.new(0.667, Color3.fromHSV(0.667,1,1)),
            ColorSequenceKeypoint.new(0.833, Color3.fromHSV(0.833,1,1)),
            ColorSequenceKeypoint.new(1,     Color3.fromHSV(1,1,1)),
        }), Parent = hueSl,
    })
    local hCursor = New("Frame", {
        BackgroundColor3 = Color3.new(1,1,1), AnchorPoint = Vector2.new(0.5,0.5),
        Position = UDim2.new(h, 0, 0.5, 0), Size = UDim2.new(0,10,0,10), ZIndex = 3005, Parent = hueSl,
    })
    Corner(hCursor, 100)
    New("UIStroke", { Thickness = 1, Color = Color3.fromRGB(20,20,28), Parent = hCursor })

    local function UpdateColor()
        cur = Color3.fromHSV(h, s, v)
        preview.BackgroundColor3 = cur
        svPicker.BackgroundColor3 = Color3.fromHSV(h, 1, 1)
        svCursor.Position = UDim2.new(s, 0, 1-v, 0)
        hCursor.Position  = UDim2.new(h, 0, 0.5, 0)
        callback(cur)
    end

    local svDrag, hDrag = false, false
    local function HandleInput(input)
        if not picker.Visible then return end
        if svDrag then
            local sz = svPicker.AbsoluteSize local pos = svPicker.AbsolutePosition
            s = math.clamp((input.Position.X - pos.X) / sz.X, 0, 1)
            v = 1 - math.clamp((input.Position.Y - pos.Y) / sz.Y, 0, 1)
            UpdateColor()
        elseif hDrag then
            local sz = hueSl.AbsoluteSize local pos = hueSl.AbsolutePosition
            h = math.clamp((input.Position.X - pos.X) / sz.X, 0, 1)
            UpdateColor()
        end
    end

    svPicker.InputBegan:Connect(function(i)
        if i.UserInputType == Enum.UserInputType.MouseButton1 then svDrag = true HandleInput(i) end
    end)
    hueSl.InputBegan:Connect(function(i)
        if i.UserInputType == Enum.UserInputType.MouseButton1 then hDrag = true HandleInput(i) end
    end)
    ui.InputChanged:Connect(function(i)
        if i.UserInputType == Enum.UserInputType.MouseMovement then HandleInput(i) end
    end)
    ui.InputEnded:Connect(function(i)
        if i.UserInputType == Enum.UserInputType.MouseButton1 then svDrag = false hDrag = false end
    end)

    local function Close()
        picker.Visible = false expanded = false
        if Library.ActivePicker == Close then Library.ActivePicker = nil end
    end

    prevBtn.MouseButton1Click:Connect(function()
        if expanded then Close() return end
        if Library.ActivePicker then Library.ActivePicker() end
        Library.ActivePicker = Close
        local bp  = preview.AbsolutePosition
        local vp  = workspace.CurrentCamera.ViewportSize
        local tx  = math.max(0, bp.X - 174)
        local ty  = math.clamp(bp.Y, 0, vp.Y - 130)
        picker.Position = UDim2.new(0, tx, 0, ty)
        picker.Visible  = true expanded = true
    end)

    local methods = {
        SetColor = function(_, col)
            cur = col h, s, v = col:ToHSV() UpdateColor()
        end,
        GetColor = function() return cur end,
    }
    if cfg.Flag and tab._library then
        tab._library:_RegisterConfig(cfg.Flag, "ColorPicker", function() return cur end, function(val) methods:SetColor(val) end)
    end
    return methods
end

-- // ─── TextBox ──────────────────────────────────────────────────────────────
function Library._CreateTextBox(tab, cfg)
    local name      = cfg.Name or "TextBox"
    local callback  = cfg.Callback or function() end
    local curText   = cfg.Default or ""
    local tooltip   = cfg.Tooltip or ""

    local frame = New("Frame", {
        Name = "TB_"..name, BackgroundColor3 = Theme.Secondary,
        BackgroundTransparency = 0.4, BorderSizePixel = 0,
        Size = UDim2.new(1, 0, 0, Size.TextBox.Height), Parent = tab.content,
    })
    Corner(frame) Stroke(frame)
    New("TextLabel", {
        FontFace = FontObj.Medium, TextColor3 = Theme.Text, Text = name,
        TextXAlignment = Enum.TextXAlignment.Left, BackgroundTransparency = 1,
        Position = UDim2.new(0, 10, 0.5, -9), TextSize = TextSize.Normal,
        Size = UDim2.new(0, 150, 0, 18), Parent = frame,
    })

    local tbCont = New("Frame", {
        BackgroundColor3 = Theme.Tertiary, BackgroundTransparency = 0.1,
        AnchorPoint = Vector2.new(1, 0.5), Position = UDim2.new(1, -10, 0.5, 0),
        BorderSizePixel = 0, Size = UDim2.new(0, Size.TextBox.InputWidth, 0, 24),
        Parent = frame,
    })
    Corner(tbCont, 5)
    local tbStroke = Stroke(tbCont)

    local textBox = New("TextBox", {
        FontFace = FontObj.Regular, TextColor3 = Theme.Text,
        PlaceholderText = cfg.Placeholder or "...",
        PlaceholderColor3 = Theme.TextDark,
        Text = curText, TextXAlignment = Enum.TextXAlignment.Left,
        TextTruncate = Enum.TextTruncate.AtEnd,
        BackgroundTransparency = 1, TextSize = TextSize.Small,
        Size = UDim2.new(1, -14, 1, 0), Position = UDim2.new(0, 7, 0, 0),
        ClearTextOnFocus = cfg.ClearOnFocus or false,
        Parent = tbCont,
    })
    textBox.Focused:Connect(function()
        Tween(tbCont,   { BackgroundTransparency = 0 }, Anim.Fast)
        Tween(tbStroke, { Color = Theme.Accent }, Anim.Fast)
    end)
    textBox.FocusLost:Connect(function(enter)
        Tween(tbCont,   { BackgroundTransparency = 0.1 }, Anim.Fast)
        Tween(tbStroke, { Color = Theme.Border }, Anim.Fast)
        if cfg.NumbersOnly then
            local n = tonumber(textBox.Text)
            textBox.Text = n and tostring(n) or curText
        end
        curText = textBox.Text
        callback(curText, enter)
    end)
    if cfg.NumbersOnly then
        textBox:GetPropertyChangedSignal("Text"):Connect(function()
            local t = textBox.Text
            local f = t:gsub("[^%d%.%-]","")
            if t ~= f then textBox.Text = f end
        end)
    end

    local sGui = frame:FindFirstAncestorOfClass("ScreenGui")
    if tooltip ~= "" and sGui then MakeTooltip(frame, tooltip, sGui) end

    local methods = {
        SetText = function(_, t) curText = tostring(t) textBox.Text = curText end,
        GetText = function() return curText end,
        SetPlaceholder = function(_, p) textBox.PlaceholderText = p end,
        Focus = function() textBox:CaptureFocus() end,
    }
    if cfg.Flag and tab._library then
        tab._library:_RegisterConfig(cfg.Flag, "TextBox", function() return curText end, function(v) methods:SetText(v) end)
    end
    return methods
end

-- // ─── Config Section ───────────────────────────────────────────────────────
function Library._CreateConfigSection(tab)
    local lib = tab._library
    Library._CreateContentSection(tab, "Configuration")

    local nameBox = Library._CreateTextBox(tab, {
        Name = "Config Name", Default = "default",
        Placeholder = "config name...",
        Callback = function(t) lib._currentConfig = t end,
    })
    local drop; drop = Library._CreateDropdown(tab, {
        Name = "Select Config", Options = lib:GetConfigs(), Default = "default",
        Callback = function(sel) nameBox:SetText(sel) lib._currentConfig = sel end,
    })
    Library._CreateButton(tab, { Name = "Save Config",   Callback = function()
        local n = nameBox:GetText()
        if n and n ~= "" then lib:SaveConfig(n) drop:Refresh(lib:GetConfigs()) end
    end })
    Library._CreateButton(tab, { Name = "Load Config",   Callback = function()
        local n = nameBox:GetText()
        if n and n ~= "" then lib:LoadConfig(n) end
    end })
    Library._CreateButton(tab, { Name = "Delete Config", Callback = function()
        local n = nameBox:GetText()
        if n and n ~= "" then lib:DeleteConfig(n) drop:Refresh(lib:GetConfigs()) end
    end })
    Library._CreateButton(tab, { Name = "Refresh List",  Callback = function()
        drop:Refresh(lib:GetConfigs())
        lib:Notify({ Title = "Refreshed", Description = "Config list updated", Duration = 2, Type = "Success" })
    end })
    Library._CreateToggle(tab, { Name = "Auto Save", Default = false,
        Callback = function(en) lib:SetAutoSave(en) end,
        Tooltip = "Auto-saves every 30 seconds",
    })

    -- Theme Switcher in config
    Library._CreateContentSection(tab, "Theme")
    local accentPresets = {
        { name = "Purple",  color = Color3.fromRGB(124, 106, 252) },
        { name = "Cyan",    color = Color3.fromRGB(80,  210, 230) },
        { name = "Green",   color = Color3.fromRGB(80,  200, 120) },
        { name = "Red",     color = Color3.fromRGB(240, 80,  80)  },
        { name = "Orange",  color = Color3.fromRGB(240, 160, 60)  },
    }
    local presetNames = {}
    for _, p in ipairs(accentPresets) do table.insert(presetNames, p.name) end
    Library._CreateDropdown(tab, {
        Name = "Accent Color", Options = presetNames, Default = "Purple",
        Tooltip = "Change the accent color theme",
        Callback = function(sel)
            for _, p in ipairs(accentPresets) do
                if p.name == sel then
                    lib:SetAccentColor(p.color)
                    break
                end
            end
        end,
    })

    -- Device info display
    Library._CreateContentSection(tab, "Device")
    Library._CreateParagraph(tab, {
        Title = "Device Info",
        Content = Device.Detect() .. " | " .. tostring(math.floor(workspace.CurrentCamera.ViewportSize.X)) .. " x " .. tostring(math.floor(workspace.CurrentCamera.ViewportSize.Y))
    })

    return { RefreshConfigs = function() drop:Refresh(lib:GetConfigs()) end }
end

return Library
