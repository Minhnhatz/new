-- // Acrylic UI Library v2
-- // Remade with improved visuals, cleaner code, purple accent theme

local ts  = game:GetService("TweenService")
local ui  = game:GetService("UserInputService")
local plr = game:GetService("Players")
local lg  = game:GetService("Lighting")
local rs  = game:GetService("RunService")
local hs  = game:GetService("HttpService")

local LIB_NAME = "Acrylic"

-- // ─── Color Theme ───────────────────────────────────────────────────────────
local Theme = {
    Background  = Color3.fromRGB(13, 13, 15),
    Secondary   = Color3.fromRGB(22, 22, 26),
    Tertiary    = Color3.fromRGB(30, 30, 36),
    Border      = Color3.fromRGB(42, 42, 48),
    BorderLight = Color3.fromRGB(60, 60, 70),

    Text        = Color3.fromRGB(232, 232, 240),
    TextDark    = Color3.fromRGB(85, 85, 96),
    TextFade    = Color3.fromRGB(13, 13, 15),

    Accent      = Color3.fromRGB(124, 106, 252),  -- purple accent
    AccentDark  = Color3.fromRGB(80, 65, 180),
    AccentGlow  = Color3.fromRGB(100, 85, 220),

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

-- // ─── Size Constants ────────────────────────────────────────────────────────
local Size = {
    Window   = { Width = 700, Height = 450 },
    MinWin   = { Width = 480, Height = 300 },
    MaxWin   = { Width = 1200, Height = 800 },
    Toggle   = { Width = 38, Height = 21, Circle = 13 },
    Button   = { Height = 38 },
    Slider   = { Height = 48 },
    Dropdown = { Height = 38, OptionHeight = 30 },
    Tab      = { Width = 140, Height = 34 },
    Notif    = { Width = 230, Height = 72 },
    TextBox  = { Height = 38, InputWidth = 155 },
}

-- // ─── Typography ────────────────────────────────────────────────────────────
local Font = {
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

-- // ─── Animation Speeds ──────────────────────────────────────────────────────
local Anim = {
    Fast     = 0.08,
    Normal   = 0.14,
    Slow     = 0.22,
    VerySlow = 0.32,
}

-- // ─── State ─────────────────────────────────────────────────────────────────
local Library    = {}
Library.__index  = Library
local Connections        = {}
local NotifContainer     = nil

-- // ─── Utility Functions ─────────────────────────────────────────────────────
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

local function IsMobile()
    return ui.TouchEnabled and not ui.KeyboardEnabled
end

-- // ─── Dragging ──────────────────────────────────────────────────────────────
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

-- // ─── Disconnect All ────────────────────────────────────────────────────────
local function DisconnectAll()
    for _, c in pairs(Connections) do
        if typeof(c) == "RBXScriptConnection" then c:Disconnect() end
    end
    Connections = {}
end

-- // ─── Config Helpers ────────────────────────────────────────────────────────
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

-- // ─── Acrylic Blur ──────────────────────────────────────────────────────────
local AcrylicBlur = {}
AcrylicBlur.__index = AcrylicBlur

function AcrylicBlur.new(object)
    local self = setmetatable({ _object = object, _enabled = true }, AcrylicBlur)
    self:_Init()
    return self
end

function AcrylicBlur:_Init()
    -- clean up existing
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

-- // ─── Notification ──────────────────────────────────────────────────────────
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

-- // ─── Library Constructor ───────────────────────────────────────────────────
function Library.new(title, configFolder)
    local self = setmetatable({}, Library)
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

    self:_BuildWindow()
    self:_SetupKeybinds()
    self:_SetupMobile()
    EnsureNotifContainer(self.screenGui)
    return self
end

-- // ─── Notify ────────────────────────────────────────────────────────────────
function Library:Notify(cfg)
    local title    = cfg.Title or "Notification"
    local desc     = cfg.Description or ""
    local duration = cfg.Duration or 3
    local icon     = cfg.Icon or "rbxassetid://10709775704"

    local notif = New("Frame", {
        Name = "Notif", BackgroundColor3 = Theme.Notification.Background,
        Position = UDim2.new(1, 20, 0, 0),
        Size = UDim2.new(1, 0, 0, Size.Notif.Height),
        ClipsDescendants = true, Parent = NotifContainer,
    })
    Corner(notif, 6)
    Stroke(notif, Theme.Notification.Border, 1)

    -- accent left bar
    New("Frame", {
        Name = "AccentBar", BackgroundColor3 = Theme.Accent,
        Position = UDim2.new(0, 0, 0, 0), Size = UDim2.new(0, 2, 1, 0),
        BorderSizePixel = 0, Parent = notif,
    })

    New("TextLabel", {
        FontFace = Font.Medium, TextColor3 = Theme.Text, Text = title,
        TextXAlignment = Enum.TextXAlignment.Left,
        BackgroundTransparency = 1,
        Position = UDim2.new(0, 14, 0, 13), TextSize = TextSize.Normal,
        Size = UDim2.new(1, -55, 0, 18), Parent = notif,
    })
    New("TextLabel", {
        FontFace = Font.Regular, TextColor3 = Theme.TextDark, Text = desc,
        TextXAlignment = Enum.TextXAlignment.Left,
        TextTruncate = Enum.TextTruncate.AtEnd,
        BackgroundTransparency = 1,
        Position = UDim2.new(0, 14, 0, 36), TextSize = TextSize.Small,
        Size = UDim2.new(1, -55, 0, 18), Parent = notif,
    })
    local iconImg = New("ImageLabel", {
        BackgroundTransparency = 1, Image = icon,
        ImageColor3 = Theme.Accent,
        Position = UDim2.new(1, -34, 0, 20), Size = UDim2.new(0, 20, 0, 20),
        Parent = notif,
    })
    New("UIAspectRatioConstraint", { Parent = iconImg })

    local timerBar = New("Frame", {
        Name = "Timer", BackgroundColor3 = Theme.Notification.Timer,
        Position = UDim2.new(0, 0, 1, -2), Size = UDim2.new(1, 0, 0, 2),
        Parent = notif,
    })
    Corner(timerBar, 100)

    Tween(notif,     { Position = UDim2.new(0, 0, 0, 0) }, 0.3, Enum.EasingStyle.Back, Enum.EasingDirection.Out)
    Tween(timerBar,  { Size = UDim2.new(0, 0, 0, 2) }, duration, Enum.EasingStyle.Linear)
    task.delay(duration, function()
        Tween(notif, { Position = UDim2.new(1, 20, 0, 0) }, 0.3, Enum.EasingStyle.Back, Enum.EasingDirection.In)
        task.wait(0.35)
        notif:Destroy()
    end)
    return notif
end

-- // ─── Keybind Listener ─────────────────────────────────────────────────────
function Library:_SetupKeybinds()
    Connections["kb_listen"] = ui.InputBegan:Connect(function(input, gameProcessed)
        if gameProcessed then return end
        if input.KeyCode == self._toggleKey then self:Toggle() end
        for _, kb in pairs(self._keybinds) do
            if input.KeyCode == kb.key then kb.callback() end
        end
    end)
end

function Library:Toggle()
    self._visible = not self._visible
    self.container.Visible = self._visible
    if self._acrylicBlur then self._acrylicBlur:SetEnabled(self._visible) end
    if self._mobileToggle then self._mobileToggle.Visible = not self._visible end
end

function Library:SetToggleKey(kc) self._toggleKey = kc end

-- // ─── Mobile Support ────────────────────────────────────────────────────────
function Library:_SetupMobile()
    local btn = New("ImageButton", {
        Name = "MobileToggle", Image = "rbxassetid://112235310154264",
        ImageColor3 = Theme.Text, BackgroundColor3 = Theme.Secondary,
        BackgroundTransparency = 0.1,
        Position = UDim2.new(0, 14, 0.5, -25),
        Size = UDim2.new(0, 50, 0, 50),
        AnchorPoint = Vector2.new(0, 0.5), Visible = false, ZIndex = 999,
        Parent = self.screenGui,
    })
    Corner(btn, 25) Stroke(btn)

    local dragging, dragStart, startPos = false, nil, nil
    btn.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.Touch
        or input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = true dragStart = input.Position startPos = btn.Position
        end
    end)
    btn.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.Touch
        or input.UserInputType == Enum.UserInputType.MouseButton1 then
            if dragging and (input.Position - dragStart).Magnitude < 10 then self:Toggle() end
            dragging = false
        end
    end)
    ui.InputChanged:Connect(function(input)
        if dragging and (input.UserInputType == Enum.UserInputType.Touch
            or input.UserInputType == Enum.UserInputType.MouseMovement) then
            local d = input.Position - dragStart
            btn.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + d.X,
                                     startPos.Y.Scale, startPos.Y.Offset + d.Y)
        end
    end)

    self._mobileToggle = btn
    if IsMobile() then btn.Visible = not self._visible end
end

-- // ─── Build Window ──────────────────────────────────────────────────────────
function Library:_BuildWindow()
    self.screenGui = New("ScreenGui", {
        Name = LIB_NAME, ZIndexBehavior = Enum.ZIndexBehavior.Sibling, ResetOnSpawn = false,
    })
    self.container = New("Frame", {
        Name = "Container", BackgroundColor3 = Theme.Background,
        BackgroundTransparency = 0.04,
        Position = UDim2.new(0.5, -Size.Window.Width/2, 0.5, -Size.Window.Height/2),
        BorderSizePixel = 0,
        Size = UDim2.new(0, Size.Window.Width, 0, Size.Window.Height),
        ClipsDescendants = false, Parent = self.screenGui,
    })
    Corner(self.container, 8)
    Stroke(self.container, Theme.Border)

    -- top bar
    self.topBar = New("Frame", {
        Name = "TopBar", BackgroundTransparency = 1,
        Size = UDim2.new(1, 0, 0, 44), Parent = self.container,
    })

    -- title with accent dot
    New("Frame", {
        Name = "AccentDot", BackgroundColor3 = Theme.Accent,
        Position = UDim2.new(0, 12, 0.5, -4),
        Size = UDim2.new(0, 4, 0, 8),
        BorderSizePixel = 0, Parent = self.topBar,
    })
    Corner(New("Frame", { -- dummy for dot corner
        BackgroundColor3 = Theme.Accent,
        Position = UDim2.new(0, 12, 0.5, -4), Size = UDim2.new(0, 4, 0, 8),
        BorderSizePixel = 0, Parent = self.topBar,
    }), 4)

    self.titleLabel = New("TextLabel", {
        Name = "Title", FontFace = Font.Bold, TextColor3 = Theme.Text,
        Text = self.title, BackgroundTransparency = 1,
        Position = UDim2.new(0, 24, 0.5, -9), TextXAlignment = Enum.TextXAlignment.Left,
        TextSize = TextSize.Title, Size = UDim2.new(0, 160, 0, 18),
        Parent = self.topBar,
    })

    self:_BuildControls()

    -- divider
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

-- // ─── Window Controls ───────────────────────────────────────────────────────
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

    -- resize handle
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

-- // ─── Content Area ──────────────────────────────────────────────────────────
function Library:_BuildContent()
    self.mainContent = New("Frame", {
        Name = "MainContent", BackgroundTransparency = 1,
        Position = UDim2.new(0, 0, 0, 45),
        Size = UDim2.new(1, 0, 1, -45),
        ClipsDescendants = true, Parent = self.container,
    })

    -- sidebar (sections / tabs list)
    self.sidebar = New("ScrollingFrame", {
        Name = "Sidebar", ScrollBarThickness = 0, BackgroundTransparency = 1,
        Position = UDim2.new(0, 0, 0, 0),
        Size = UDim2.new(0, 170, 1, 0),
        CanvasSize = UDim2.new(0,0,0,0),
        AutomaticCanvasSize = Enum.AutomaticSize.Y,
        ScrollingDirection = Enum.ScrollingDirection.Y,
        Parent = self.mainContent,
    })
    ListLayout(self.sidebar, 0)
    Padding(self.sidebar, 6, 6, 6, 6)

    -- sidebar / content separator
    New("Frame", {
        Name = "Sep", BackgroundColor3 = Theme.Border,
        Position = UDim2.new(0, 170, 0, 0), BorderSizePixel = 0,
        Size = UDim2.new(0, 1, 1, 0), Parent = self.mainContent,
    })

    self.contentFrame = New("ScrollingFrame", {
        Name = "Content", ScrollBarThickness = 3,
        ScrollBarImageColor3 = Color3.fromRGB(60, 60, 72),
        BackgroundTransparency = 1,
        Position = UDim2.new(0, 171, 0, 0),
        Size = UDim2.new(1, -171, 1, 0),
        CanvasSize = UDim2.new(0,0,0,0),
        AutomaticCanvasSize = Enum.AutomaticSize.Y,
        ScrollingDirection = Enum.ScrollingDirection.Y,
        Parent = self.mainContent,
    })
    ListLayout(self.contentFrame, 8)
    Padding(self.contentFrame, 10, 10, 14, 14)
end

-- // ─── Resize ────────────────────────────────────────────────────────────────
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

-- // ─── Minimize ──────────────────────────────────────────────────────────────
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

-- // ─── Destroy ───────────────────────────────────────────────────────────────
function Library:Destroy()
    if self._autoSave then self:SaveConfig(self._currentConfig) end
    DisconnectAll()
    if self._acrylicBlur then self._acrylicBlur:Destroy() end
    if self.screenGui    then self.screenGui:Destroy() end
end

-- // ─── Config System ─────────────────────────────────────────────────────────
function Library:_RegisterConfig(id, elemType, getVal, setVal)
    self._configElems[id] = { type = elemType, getValue = getVal, setValue = setVal }
end

function Library:SaveConfig(name)
    if not writefile then
        return self:Notify({ Title = "Error", Description = "Config not supported", Duration = 3 })
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
        self:Notify({ Title = "Saved", Description = name, Duration = 2, Icon = "rbxassetid://10723356507" })
    else
        self:Notify({ Title = "Error", Description = "Failed to save", Duration = 3 })
    end
    return ok
end

function Library:LoadConfig(name)
    if not readfile or not isfile then
        return self:Notify({ Title = "Error", Description = "Config not supported", Duration = 3 })
    end
    local path = "AcrylicConfigs/"..name..".json"
    if not isfile(path) then
        return self:Notify({ Title = "Error", Description = "Not found: "..name, Duration = 3 })
    end
    local ok, data = pcall(function() return hs:JSONDecode(readfile(path)) end)
    if not ok or not data then
        return self:Notify({ Title = "Error", Description = "Failed to load", Duration = 3 })
    end
    for id, v in pairs(data) do
        if self._configElems[id] then
            if type(v)=="table" and v._type=="Color3"   then v = Color3.new(v.R, v.G, v.B) end
            if type(v)=="table" and v._type=="EnumItem" then v = Enum[v._enum][v._value] end
            pcall(function() self._configElems[id].setValue(v) end)
        end
    end
    self._currentConfig = name
    self:Notify({ Title = "Loaded", Description = name, Duration = 2, Icon = "rbxassetid://10723356507" })
    return true
end

function Library:DeleteConfig(name)
    if not delfile or not isfile then return false end
    local path = "AcrylicConfigs/"..name..".json"
    if isfile(path) then
        delfile(path)
        self:Notify({ Title = "Deleted", Description = name, Duration = 2 })
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

-- // ─── Section ───────────────────────────────────────────────────────────────
function Library:CreateSection(name)
    local section = { name=name, tabs={}, expanded=true, _library=self }

    local secFrame = New("Frame", {
        Name = "Sec_"..name, BackgroundTransparency = 1,
        Size = UDim2.new(1, -8, 0, 0),
        AutomaticSize = Enum.AutomaticSize.Y,
        Parent = self.sidebar,
    })
    ListLayout(secFrame, 2)

    -- header
    local headerFrame = New("Frame", {
        Name = "Header", BackgroundTransparency = 1,
        Size = UDim2.new(1, 0, 0, 24), LayoutOrder = 0,
        Parent = secFrame,
    })
    local headerBtn = New("TextButton", {
        Text = "", BackgroundTransparency = 1,
        Size = UDim2.new(1, 0, 1, 0), Parent = headerFrame,
    })
    New("TextLabel", {
        FontFace = Font.Medium, TextColor3 = Theme.TextDark, Text = name,
        TextXAlignment = Enum.TextXAlignment.Left, BackgroundTransparency = 1,
        Position = UDim2.new(0, 4, 0, 0),
        TextSize = TextSize.Tiny, Size = UDim2.new(1, -22, 1, 0),
        TextTransparency = 0, Parent = headerFrame,
    })
    local arrow = New("ImageButton", {
        Image = "rbxassetid://105558791071013", ImageColor3 = Theme.TextDark,
        BackgroundTransparency = 1, Rotation = 0,
        Position = UDim2.new(1, -18, 0.5, -6), Size = UDim2.new(0, 12, 0, 12),
        Parent = headerFrame,
    })

    -- tabs container
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
    function meta:CreateTab(n, icon) return Library._CreateTab(self, n, icon) end
    return meta
end

-- // ─── Tab ───────────────────────────────────────────────────────────────────
function Library._CreateTab(section, name, icon)
    local tab = { name=name, elements={} }

    local tabFrame = New("Frame", {
        Name = name, BackgroundColor3 = Theme.Secondary,
        BackgroundTransparency = 1, BorderSizePixel = 0,
        Size = UDim2.new(1, 0, 0, Size.Tab.Height),
        Parent = section.tabsContainer,
    })
    Corner(tabFrame, 6)
    local tabStroke = Stroke(tabFrame, Theme.Border, 1, 1)

    -- left accent bar (hidden until selected)
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
        FontFace = Font.Medium, TextColor3 = Theme.TextDark, Text = name,
        TextXAlignment = Enum.TextXAlignment.Left, BackgroundTransparency = 1,
        Position = UDim2.new(0, 33, 0, 0), Size = UDim2.new(1, -40, 1, 0),
        TextSize = TextSize.Small, Parent = tabFrame,
    })
    Padding(New("Frame", { Size=UDim2.new(0,0,0,0), BackgroundTransparency=1, Parent=tabText }), 0,0,0,8) -- dummy

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

    tab.button = tabFrame tab.stroke = tabStroke
    tab.icon = iconLabel tab.textLabel = tabText tab.accentBar = accentBar
    tab._library = section._library

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
    function meta:CreateConfigSection()   return Library._CreateConfigSection(self) end
    return meta
end

-- // ─── Select Tab ────────────────────────────────────────────────────────────
function Library._SelectTab(lib, tab, btn, stroke, icon, textLabel, accentBar)
    if lib.currentTab then
        lib.currentTab.content.Visible = false
        Tween(lib.currentTab.button, { BackgroundTransparency = 1 }, Anim.Fast)
        Tween(lib.currentTab.icon,   { ImageColor3 = Theme.TextDark }, Anim.Fast)
        Tween(lib.currentTab.accentBar, { BackgroundTransparency = 1 }, Anim.Fast)
        lib.currentTab.stroke.Transparency = 1
        lib.currentTab.textLabel.TextColor3 = Theme.TextDark
    end
    lib.currentTab = tab
    tab.content.Visible = true
    Tween(btn,       { BackgroundTransparency = 0.7 }, Anim.Fast)
    Tween(icon,      { ImageColor3 = Theme.Accent }, Anim.Fast)
    Tween(accentBar, { BackgroundTransparency = 0 }, Anim.Fast)
    stroke.Transparency = 0
    textLabel.TextColor3 = Theme.Text
end

-- // ─── Content Section Label ─────────────────────────────────────────────────
function Library._CreateContentSection(tab, name)
    local frame = New("Frame", {
        Name = "SecLabel_"..name, BackgroundTransparency = 1,
        Size = UDim2.new(1, 0, 0, 22), Parent = tab.content,
    })

    New("Frame", {
        BackgroundColor3 = Theme.Accent, BackgroundTransparency = 0.4,
        Position = UDim2.new(0, 0, 0.5, 0), Size = UDim2.new(0, 2, 0.6, 0),
        BorderSizePixel = 0, Parent = frame,
    })
    New("TextLabel", {
        FontFace = Font.Medium, TextColor3 = Theme.TextDark, Text = name,
        TextXAlignment = Enum.TextXAlignment.Left, BackgroundTransparency = 1,
        Position = UDim2.new(0, 10, 0, 0),
        TextSize = TextSize.Small, Size = UDim2.new(1, -10, 1, 0),
        Parent = frame,
    })
    return frame
end

-- // ─── Paragraph ─────────────────────────────────────────────────────────────
function Library._CreateParagraph(tab, cfg)
    local frame = New("Frame", {
        Name = "Para", BackgroundColor3 = Theme.Secondary,
        BackgroundTransparency = 0.4, BorderSizePixel = 0,
        Size = UDim2.new(1, 0, 0, 0), AutomaticSize = Enum.AutomaticSize.Y,
        Parent = tab.content,
    })
    Corner(frame) Stroke(frame) Padding(frame, 10, 10, 10, 10)

    local titleL = New("TextLabel", {
        FontFace = Font.Medium, TextColor3 = Theme.Text, Text = cfg.Title or "Paragraph",
        TextXAlignment = Enum.TextXAlignment.Left, BackgroundTransparency = 1,
        TextSize = TextSize.Normal, Size = UDim2.new(1, 0, 0, 18), Parent = frame,
    })
    local contentL = New("TextLabel", {
        FontFace = Font.Regular, TextColor3 = Theme.TextDark,
        Text = cfg.Content or "", TextXAlignment = Enum.TextXAlignment.Left,
        TextWrapped = true, BackgroundTransparency = 1,
        TextSize = TextSize.Small, Position = UDim2.new(0, 0, 0, 21),
        Size = UDim2.new(1, 0, 0, 0), AutomaticSize = Enum.AutomaticSize.Y,
        Parent = frame,
    })
    return {
        SetTitle   = function(_, v) titleL.Text   = v end,
        SetContent = function(_, v) contentL.Text = v end,
    }
end

-- // ─── Slider ────────────────────────────────────────────────────────────────
function Library._CreateSlider(tab, cfg)
    local name    = cfg.Name or "Slider"
    local min     = cfg.Min or 0
    local max     = cfg.Max or 100
    local default = cfg.Default or 50
    local callback = cfg.Callback or function() end
    local cur = default

    local frame = New("Frame", {
        Name = "Slider_"..name, BackgroundColor3 = Theme.Secondary,
        BackgroundTransparency = 0.4, BorderSizePixel = 0,
        Size = UDim2.new(1, 0, 0, Size.Slider.Height), Parent = tab.content,
    })
    Corner(frame) Stroke(frame)

    New("TextLabel", {
        FontFace = Font.Medium, TextColor3 = Theme.Text, Text = name,
        TextXAlignment = Enum.TextXAlignment.Left, BackgroundTransparency = 1,
        Position = UDim2.new(0, 10, 0, 6), TextSize = TextSize.Normal,
        Size = UDim2.new(0, 200, 0, 18), Parent = frame,
    })
    local valLabel = New("TextLabel", {
        FontFace = Font.Regular, TextColor3 = Theme.Accent, Text = tostring(cur),
        TextXAlignment = Enum.TextXAlignment.Right, BackgroundTransparency = 1,
        Position = UDim2.new(1, -55, 0, 6), TextSize = TextSize.Small,
        Size = UDim2.new(0, 45, 0, 18), Parent = frame,
    })

    local track = New("Frame", {
        BackgroundColor3 = Theme.Tertiary, Position = UDim2.new(0, 10, 0, 32),
        BorderSizePixel = 0, Size = UDim2.new(1, -20, 0, 6), Parent = frame,
    })
    Corner(track, 100)

    local fill = New("Frame", {
        BackgroundColor3 = Theme.Accent, BorderSizePixel = 0,
        Size = UDim2.new((default-min)/(max-min), 0, 1, 0), Parent = track,
    })
    Corner(fill, 100)

    -- thumb
    local thumb = New("Frame", {
        BackgroundColor3 = Theme.Text,
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.new((default-min)/(max-min), 0, 0.5, 0),
        Size = UDim2.new(0, 12, 0, 12), ZIndex = 2, Parent = track,
    })
    Corner(thumb, 100)
    Stroke(thumb, Theme.Accent, 1.5)

    local dragging = false
    local function UpdateSlider(input)
        local rX = math.clamp((input.Position.X - track.AbsolutePosition.X) / track.AbsoluteSize.X, 0, 1)
        cur = math.floor(min + (max - min) * rX)
        Tween(fill,  { Size = UDim2.new(rX, 0, 1, 0) }, 0.04)
        Tween(thumb, { Position = UDim2.new(rX, 0, 0.5, 0) }, 0.04)
        valLabel.Text = tostring(cur)
        callback(cur)
    end

    track.InputBegan:Connect(function(i)
        if i.UserInputType == Enum.UserInputType.MouseButton1 or i.UserInputType == Enum.UserInputType.Touch then
            dragging = true UpdateSlider(i)
        end
    end)
    track.InputEnded:Connect(function(i)
        if i.UserInputType == Enum.UserInputType.MouseButton1 or i.UserInputType == Enum.UserInputType.Touch then
            dragging = false
        end
    end)
    ui.InputChanged:Connect(function(i)
        if dragging and (i.UserInputType == Enum.UserInputType.MouseMovement or i.UserInputType == Enum.UserInputType.Touch) then
            UpdateSlider(i)
        end
    end)

    local methods = {
        SetValue = function(_, v)
            cur = math.clamp(v, min, max)
            local rX = (cur - min) / (max - min)
            fill.Size = UDim2.new(rX, 0, 1, 0)
            thumb.Position = UDim2.new(rX, 0, 0.5, 0)
            valLabel.Text = tostring(cur)
            callback(cur)
        end,
        GetValue = function() return cur end,
    }
    if cfg.Flag and tab._library then
        tab._library:_RegisterConfig(cfg.Flag, "Slider", function() return cur end, function(v) methods:SetValue(v) end)
    end
    return methods
end

-- // ─── Button ────────────────────────────────────────────────────────────────
function Library._CreateButton(tab, cfg)
    local name     = cfg.Name or "Button"
    local callback = cfg.Callback or function() end

    local frame = New("Frame", {
        Name = "Btn_"..name, BackgroundColor3 = Theme.Secondary,
        BackgroundTransparency = 0.4, BorderSizePixel = 0,
        Size = UDim2.new(1, 0, 0, Size.Button.Height), Parent = tab.content,
    })
    Corner(frame) Stroke(frame)

    local nameL = New("TextLabel", {
        FontFace = Font.Medium, TextColor3 = Theme.Text, Text = name,
        TextXAlignment = Enum.TextXAlignment.Left, BackgroundTransparency = 1,
        Position = UDim2.new(0, 10, 0.5, -9), TextSize = TextSize.Normal,
        Size = UDim2.new(0, 200, 0, 18), Parent = frame,
    })
    local iconImg = New("ImageLabel", {
        BackgroundTransparency = 1, Image = "rbxassetid://10734898355",
        ImageColor3 = Theme.TextDark,
        Position = UDim2.new(1, -28, 0.5, -9), Size = UDim2.new(0, 18, 0, 18),
        Parent = frame,
    })
    New("UIAspectRatioConstraint", { Parent = iconImg })

    local btn = New("TextButton", {
        Text = "", BackgroundTransparency = 1,
        Size = UDim2.new(1, 0, 1, 0), Parent = frame,
    })
    btn.MouseButton1Click:Connect(function()
        Tween(frame, { BackgroundTransparency = 0.1 }, Anim.Fast)
        Tween(iconImg, { ImageColor3 = Theme.Accent }, Anim.Fast)
        task.wait(0.12)
        Tween(frame, { BackgroundTransparency = 0.4 }, Anim.Normal)
        Tween(iconImg, { ImageColor3 = Theme.TextDark }, Anim.Normal)
        callback()
    end)
    btn.MouseEnter:Connect(function()
        Tween(frame, { BackgroundTransparency = 0.25 }, Anim.Fast)
    end)
    btn.MouseLeave:Connect(function()
        Tween(frame, { BackgroundTransparency = 0.4 }, Anim.Fast)
    end)
    return { SetText = function(_, t) nameL.Text = t end }
end

-- // ─── Toggle ────────────────────────────────────────────────────────────────
function Library._CreateToggle(tab, cfg)
    local name     = cfg.Name or "Toggle"
    local default  = cfg.Default or false
    local callback = cfg.Callback or function() end
    local enabled  = default

    local frame = New("Frame", {
        Name = "Tog_"..name, BackgroundColor3 = Theme.Secondary,
        BackgroundTransparency = 0.4, BorderSizePixel = 0,
        Size = UDim2.new(1, 0, 0, Size.Button.Height), Parent = tab.content,
    })
    Corner(frame) Stroke(frame)
    New("TextLabel", {
        FontFace = Font.Medium, TextColor3 = Theme.Text, Text = name,
        TextXAlignment = Enum.TextXAlignment.Left, BackgroundTransparency = 1,
        Position = UDim2.new(0, 10, 0.5, -9), TextSize = TextSize.Normal,
        Size = UDim2.new(0, 200, 0, 18), Parent = frame,
    })

    local swBg = New("Frame", {
        BackgroundColor3 = enabled and Theme.Toggle.Enabled or Theme.Toggle.Disabled,
        Position = UDim2.new(1, -48, 0.5, -10), BorderSizePixel = 0,
        Size = UDim2.new(0, Size.Toggle.Width, 0, Size.Toggle.Height), Parent = frame,
    })
    Corner(swBg, 100)

    local circle = New("Frame", {
        BackgroundColor3 = Theme.Toggle.Circle,
        AnchorPoint = Vector2.new(0, 0.5),
        Position = enabled and UDim2.new(0, 21, 0.5, 0) or UDim2.new(0, 4, 0.5, 0),
        BorderSizePixel = 0,
        Size = UDim2.new(0, Size.Toggle.Circle, 0, Size.Toggle.Circle), Parent = swBg,
    })
    Corner(circle, 100)

    New("TextButton", {
        Text = "", BackgroundTransparency = 1,
        Size = UDim2.new(1, 0, 1, 0), Parent = frame,
    }).MouseButton1Click:Connect(function()
        enabled = not enabled
        Tween(swBg,   { BackgroundColor3 = enabled and Theme.Toggle.Enabled or Theme.Toggle.Disabled }, Anim.Normal)
        Tween(circle, { Position = enabled and UDim2.new(0, 21, 0.5, 0) or UDim2.new(0, 4, 0.5, 0) }, Anim.Normal)
        callback(enabled)
    end)

    local methods = {
        SetValue = function(_, v)
            enabled = v
            Tween(swBg,   { BackgroundColor3 = v and Theme.Toggle.Enabled or Theme.Toggle.Disabled }, Anim.Normal)
            Tween(circle, { Position = v and UDim2.new(0, 21, 0.5, 0) or UDim2.new(0, 4, 0.5, 0) }, Anim.Normal)
            callback(v)
        end,
        GetValue = function() return enabled end,
    }
    if cfg.Flag and tab._library then
        tab._library:_RegisterConfig(cfg.Flag, "Toggle", function() return enabled end, function(v) methods:SetValue(v) end)
    end
    return methods
end

-- // ─── Dropdown ──────────────────────────────────────────────────────────────
function Library._CreateDropdown(tab, cfg)
    local name       = cfg.Name or "Dropdown"
    local options    = cfg.Options or {}
    local multiSel   = cfg.MultiSelect or false
    local callback   = cfg.Callback or function() end
    local selected   = multiSel and (type(cfg.Default)=="table" and cfg.Default or {}) or (cfg.Default or options[1])
    local expanded   = false

    local frame = New("Frame", {
        Name = "Drop_"..name, BackgroundColor3 = Theme.Secondary,
        BackgroundTransparency = 0.4, BorderSizePixel = 0,
        Size = UDim2.new(1, 0, 0, Size.Dropdown.Height),
        ClipsDescendants = false, ZIndex = 1, Parent = tab.content,
    })
    Corner(frame) Stroke(frame)
    New("TextLabel", {
        FontFace = Font.Medium, TextColor3 = Theme.Text, Text = name,
        TextXAlignment = Enum.TextXAlignment.Left, BackgroundTransparency = 1,
        Position = UDim2.new(0, 10, 0, 10), TextSize = TextSize.Normal,
        Size = UDim2.new(0, 200, 0, 18), ZIndex = 1, Parent = frame,
    })

    local selDisplay = New("Frame", {
        BackgroundColor3 = Theme.Tertiary, BackgroundTransparency = 0.1,
        Position = UDim2.new(1, -148, 0, 6), BorderSizePixel = 0,
        Size = UDim2.new(0, 138, 0, 26), ZIndex = 2, Parent = frame,
    })
    Corner(selDisplay, 5) Stroke(selDisplay)
    local selLabel = New("TextLabel", {
        FontFace = Font.Regular, TextColor3 = Theme.Text,
        Text = multiSel and (#selected>0 and table.concat(selected,", ") or "None") or tostring(selected),
        TextTruncate = Enum.TextTruncate.AtEnd, BackgroundTransparency = 1,
        TextSize = TextSize.Small, Size = UDim2.new(1, -28, 1, 0),
        Position = UDim2.new(0, 8, 0, 0), TextXAlignment = Enum.TextXAlignment.Left,
        ZIndex = 2, Parent = selDisplay,
    })
    local arrow = New("ImageLabel", {
        Image = "rbxassetid://105558791071013", ImageColor3 = Theme.TextDark,
        BackgroundTransparency = 1, Position = UDim2.new(1, -18, 0.5, -5),
        Size = UDim2.new(0, 10, 0, 10), Rotation = 0, ZIndex = 2, Parent = selDisplay,
    })

    local maxVis    = 5
    local optsH     = math.min(#options * Size.Dropdown.OptionHeight, maxVis * Size.Dropdown.OptionHeight)
    local optsCont  = New("Frame", {
        BackgroundColor3 = Theme.Secondary, BackgroundTransparency = 0.02,
        Position = UDim2.new(1, -148, 0, 37), BorderSizePixel = 0,
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
            Name = opt, FontFace = Font.Regular, TextColor3 = Theme.Text, Text = opt,
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

    New("TextButton", {
        Text = "", BackgroundTransparency = 1, Size = UDim2.new(1,0,1,0),
        ZIndex = 3, Parent = selDisplay,
    }).MouseButton1Click:Connect(function()
        expanded = not expanded
        optsCont.Visible = expanded
        Tween(arrow, { Rotation = expanded and 180 or 0 }, Anim.Normal)
        frame.ZIndex = expanded and 10 or 1
    end)

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

-- // ─── Keybind ───────────────────────────────────────────────────────────────
function Library._CreateKeybind(tab, cfg, lib)
    local name     = cfg.Name or "Keybind"
    local callback = cfg.Callback or function() end
    local curKey   = cfg.Default or Enum.KeyCode.F
    local listening = false

    local frame = New("Frame", {
        Name = "KB_"..name, BackgroundColor3 = Theme.Secondary,
        BackgroundTransparency = 0.4, BorderSizePixel = 0,
        Size = UDim2.new(1, 0, 0, Size.Button.Height), Parent = tab.content,
    })
    Corner(frame) Stroke(frame)
    New("TextLabel", {
        FontFace = Font.Medium, TextColor3 = Theme.Text, Text = name,
        TextXAlignment = Enum.TextXAlignment.Left, BackgroundTransparency = 1,
        Position = UDim2.new(0, 10, 0.5, -9), TextSize = TextSize.Normal,
        Size = UDim2.new(0, 200, 0, 18), Parent = frame,
    })

    local kbBox = New("Frame", {
        BackgroundColor3 = Theme.Tertiary, BackgroundTransparency = 0.1,
        AnchorPoint = Vector2.new(1, 0.5), Position = UDim2.new(1, -10, 0.5, 0),
        BorderSizePixel = 0, Size = UDim2.new(0, 32, 0, 22), Parent = frame,
    })
    Corner(kbBox, 5) Stroke(kbBox)
    local keyL = New("TextLabel", {
        FontFace = Font.Regular, TextColor3 = Theme.Text,
        Text = curKey.Name, BackgroundTransparency = 1,
        TextSize = TextSize.Tiny, Size = UDim2.new(1,0,1,0), Parent = kbBox,
    })

    local kbId = name.."_"..tostring(tick())
    lib._keybinds[kbId] = { key = curKey, callback = callback }

    local function UpdateDisplay()
        if listening then
            keyL.Text = "..."
            kbBox.Size = UDim2.new(0, 44, 0, 22)
        else
            keyL.Text = curKey.Name
            kbBox.Size = UDim2.new(0, math.max(#curKey.Name * 8 + 10, 28), 0, 22)
        end
    end

    New("TextButton", {
        Text = "", BackgroundTransparency = 1, Size = UDim2.new(1,0,1,0), Parent = kbBox,
    }).MouseButton1Click:Connect(function() listening = true UpdateDisplay() end)

    local conn; conn = ui.InputBegan:Connect(function(input, gp)
        if listening and input.UserInputType == Enum.UserInputType.Keyboard then
            curKey = input.KeyCode listening = false
            lib._keybinds[kbId].key = curKey UpdateDisplay()
        end
    end)
    table.insert(Connections, conn)
    UpdateDisplay()

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

-- // ─── Color Picker ──────────────────────────────────────────────────────────
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
        FontFace = Font.Medium, TextColor3 = Theme.Text, Text = name,
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

-- // ─── TextBox ───────────────────────────────────────────────────────────────
function Library._CreateTextBox(tab, cfg)
    local name      = cfg.Name or "TextBox"
    local callback  = cfg.Callback or function() end
    local curText   = cfg.Default or ""

    local frame = New("Frame", {
        Name = "TB_"..name, BackgroundColor3 = Theme.Secondary,
        BackgroundTransparency = 0.4, BorderSizePixel = 0,
        Size = UDim2.new(1, 0, 0, Size.TextBox.Height), Parent = tab.content,
    })
    Corner(frame) Stroke(frame)
    New("TextLabel", {
        FontFace = Font.Medium, TextColor3 = Theme.Text, Text = name,
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
        FontFace = Font.Regular, TextColor3 = Theme.Text,
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

-- // ─── Config Section ────────────────────────────────────────────────────────
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
        lib:Notify({ Title = "Refreshed", Description = "Config list updated", Duration = 2 })
    end })
    Library._CreateToggle(tab, { Name = "Auto Save", Default = false,
        Callback = function(en) lib:SetAutoSave(en) end,
    })
    return { RefreshConfigs = function() drop:Refresh(lib:GetConfigs()) end }
end

return Library
