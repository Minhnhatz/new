-- ╔══════════════════════════════════════════════════════════════════════════╗
-- ║                    Zenith UI Library  v4.0.0                           ║
-- ║                                                                        ║
-- ║  New in v4:                                                            ║
-- ║  • Library.Version string                                              ║
-- ║  • Element :SetVisible() / :Destroy() on every element                ║
-- ║  • Chainable API  (element:SetState(true):SetVisible(true))            ║
-- ║  • window:GetFlag(flag) / window:SetFlag(flag, value)                  ║
-- ║  • window:OnFlagChanged(flag, cb)                                      ║
-- ║  • tab:Clear()                                                         ║
-- ║  • CreateLabel  — inline realtime value display                        ║
-- ║  • CreateDivider — simple separator                                    ║
-- ║  • Slider Step  (Step = 5)                                             ║
-- ║  • Scroll-to-top on tab switch                                         ║
-- ║  • Confirm Dialog  window:Confirm({})                                  ║
-- ║  • Improved error hints via warn()                                     ║
-- ║  • Redesigned Notify animation (slide + blur-in + icon pulse)          ║
-- ╚══════════════════════════════════════════════════════════════════════════╝

-- // ─── Services ─────────────────────────────────────────────────────────────
local ts  = game:GetService("TweenService")
local ui  = game:GetService("UserInputService")
local plr = game:GetService("Players")
local lg  = game:GetService("Lighting")
local rs  = game:GetService("RunService")
local hs  = game:GetService("HttpService")

-- // ─── Library Meta ─────────────────────────────────────────────────────────
local Library       = {}
Library.__index     = Library
Library.Version     = "4.0.0"
Library.Name        = "ZenithUi"
Library.Author      = "Zenith Team"
Library.ActivePicker = nil

local Connections   = {}
local NotifQueue    = {}          -- queued notifications
local NotifContainer = nil

-- // ─── Device Detection ─────────────────────────────────────────────────────
local Device = {}

function Device.Detect()
    local vp  = workspace.CurrentCamera.ViewportSize
    local kb  = ui.KeyboardEnabled
    local tch = ui.TouchEnabled
    if tch and not kb then
        return (vp.X < 600 or vp.Y < 600) and "Phone" or "Tablet"
    end
    return vp.X < 1024 and "SmallDesktop" or "Desktop"
end

function Device.GetWindowSize()
    local d  = Device.Detect()
    local vp = workspace.CurrentCamera.ViewportSize
    if d == "Phone"        then return { Width = math.min(vp.X-16,360), Height = math.min(vp.Y-60,520) } end
    if d == "Tablet"       then return { Width = 560,  Height = 420 } end
    if d == "SmallDesktop" then return { Width = 580,  Height = 400 } end
    return { Width = 700, Height = 450 }
end

function Device.GetSidebarWidth()
    local d = Device.Detect()
    if d == "Phone"  then return 110 end
    if d == "Tablet" then return 130 end
    return 170
end

function Device.IsMobile()
    return ui.TouchEnabled and not ui.KeyboardEnabled
end

-- // ─── Theme ────────────────────────────────────────────────────────────────
local Theme = {
    Background  = Color3.fromRGB(13,  13,  15),
    Secondary   = Color3.fromRGB(22,  22,  26),
    Tertiary    = Color3.fromRGB(30,  30,  36),
    Border      = Color3.fromRGB(42,  42,  48),
    BorderLight = Color3.fromRGB(60,  60,  70),
    Text        = Color3.fromRGB(232, 232, 240),
    TextDark    = Color3.fromRGB(85,  85,  96),
    Accent      = Color3.fromRGB(124, 106, 252),
    AccentDark  = Color3.fromRGB(80,  65,  180),
    Success     = Color3.fromRGB(80,  200, 120),
    Warning     = Color3.fromRGB(240, 180, 50),
    Error       = Color3.fromRGB(240, 80,  80),
    Info        = Color3.fromRGB(124, 106, 252),
    Toggle = {
        Enabled  = Color3.fromRGB(124, 106, 252),
        Disabled = Color3.fromRGB(38,  38,  46),
        Circle   = Color3.fromRGB(240, 240, 255),
    },
}

-- // ─── Sizes ────────────────────────────────────────────────────────────────
local Size = {}
local function RebuildSize()
    local win = Device.GetWindowSize()
    Size = {
        Window   = win,
        MinWin   = { Width = 320, Height = 260 },
        MaxWin   = { Width = 1200, Height = 800 },
        Toggle   = { Width = 38, Height = 21, Circle = 13 },
        Button   = { Height = 38 },
        Slider   = { Height = 52 },
        Dropdown = { Height = 38, OptionHeight = 30 },
        Notif    = { Width = 260, Height = 76 },
        TextBox  = { Height = 38, InputWidth = 155 },
        Sidebar  = Device.GetSidebarWidth(),
    }
end
RebuildSize()

-- // ─── Typography ───────────────────────────────────────────────────────────
-- FIX Bug 1: Renamed to `Fonts` to avoid shadowing the global Roblox `Font` constructor
-- before the table literal finishes evaluating.
local Fonts = {
    Regular = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Regular),
    Medium  = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Medium),
    Bold    = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Bold),
}
local Font = Fonts  -- keep the short alias used everywhere else in the file
local TS = { Title=14, Normal=13, Small=12, Tiny=11 }

-- // ─── Animation ────────────────────────────────────────────────────────────
local Anim = { Fast=0.08, Normal=0.14, Slow=0.22, VerySlow=0.32 }

-- // ─── Language Packs ───────────────────────────────────────────────────────
local Languages = {
    English = {
        Save="Save Config", Load="Load Config", Delete="Delete Config",
        Refresh="Refresh List", AutoSave="Auto Save (30s)",
        ConfigName="Config Name", SelectConfig="Select Config",
        AccentPreset="Accent Preset", Device="Device", Version="Version",
        Theme="Theme", Configuration="Configuration",
        Settings="Settings", Background="Background Image URL",
        Font="Font", Language="Language",
        BgPreview="Preview", BgClear="Clear Background",
        BgApply="Apply Background",
        ConfirmDelete="Delete", ConfirmDeleteDesc="This cannot be undone.",
        Saved="Saved", SaveFail="Save Failed", LoadFail="Load Failed",
        ThemeUpdated="Theme Updated", AccentChanged="Accent color changed",
        Refreshed="Refreshed", ConfigListUpdated="Config list updated",
        LayoutAdjusted="Layout Adjusted", SwitchedTo="Switched to",
        Watermark="Watermark",
    },
    Vietnamese = {
        Save="Lưu Config", Load="Tải Config", Delete="Xoá Config",
        Refresh="Làm mới danh sách", AutoSave="Tự lưu (30 giây)",
        ConfigName="Tên Config", SelectConfig="Chọn Config",
        AccentPreset="Màu Accent", Device="Thiết bị", Version="Phiên bản",
        Theme="Giao diện", Configuration="Cấu hình",
        Settings="Cài đặt", Background="URL ảnh nền",
        Font="Phông chữ", Language="Ngôn ngữ",
        BgPreview="Xem trước", BgClear="Xoá ảnh nền",
        BgApply="Áp dụng ảnh nền",
        ConfirmDelete="Xoá", ConfirmDeleteDesc="Hành động này không thể hoàn tác.",
        Saved="Đã lưu", SaveFail="Lưu thất bại", LoadFail="Tải thất bại",
        ThemeUpdated="Đã cập nhật giao diện", AccentChanged="Đã đổi màu accent",
        Refreshed="Đã làm mới", ConfigListUpdated="Danh sách config đã cập nhật",
        LayoutAdjusted="Đã điều chỉnh bố cục", SwitchedTo="Chuyển sang",
        Watermark="Hình mờ",
    },
    Japanese = {
        Save="保存", Load="読込", Delete="削除",
        Refresh="一覧更新", AutoSave="自動保存 (30秒)",
        ConfigName="設定名", SelectConfig="設定選択",
        AccentPreset="アクセント", Device="デバイス", Version="バージョン",
        Theme="テーマ", Configuration="設定",
        Settings="オプション", Background="背景URL",
        Font="フォント", Language="言語",
        BgPreview="プレビュー", BgClear="背景削除",
        BgApply="背景適用",
        ConfirmDelete="削除", ConfirmDeleteDesc="この操作は元に戻せません。",
        Saved="保存済み", SaveFail="保存失敗", LoadFail="読込失敗",
        ThemeUpdated="テーマ更新", AccentChanged="アクセント変更",
        Refreshed="更新済み", ConfigListUpdated="一覧を更新しました",
        LayoutAdjusted="レイアウト調整", SwitchedTo="切替:",
        Watermark="ウォーターマーク",
    },
    Chinese = {
        Save="保存配置", Load="加载配置", Delete="删除配置",
        Refresh="刷新列表", AutoSave="自动保存 (30秒)",
        ConfigName="配置名称", SelectConfig="选择配置",
        AccentPreset="主题色", Device="设备", Version="版本",
        Theme="主题", Configuration="配置管理",
        Settings="设置", Background="背景图片链接",
        Font="字体", Language="语言",
        BgPreview="预览", BgClear="清除背景",
        BgApply="应用背景",
        ConfirmDelete="删除", ConfirmDeleteDesc="此操作无法撤销。",
        Saved="已保存", SaveFail="保存失败", LoadFail="加载失败",
        ThemeUpdated="主题已更新", AccentChanged="主题色已更改",
        Refreshed="已刷新", ConfigListUpdated="配置列表已更新",
        LayoutAdjusted="布局已调整", SwitchedTo="切换至",
        Watermark="水印",
    },
}
local CurrentLang = "English"
local function L(key) return (Languages[CurrentLang] or Languages.English)[key] or key end

-- // ─── Font Registry ────────────────────────────────────────────────────────
local FontRegistry = {
    -- FIX Bug 1 (cont): FontRegistry is defined AFTER `local Font = Fonts`, so Font.new
    -- here refers to the global Roblox Font constructor correctly.
    { name="Gotham",       regular=Fonts.Regular, medium=Fonts.Medium, bold=Fonts.Bold },
    { name="Ubuntu",       regular=Font.new("rbxasset://fonts/families/Ubuntu.json",        Enum.FontWeight.Regular), medium=Font.new("rbxasset://fonts/families/Ubuntu.json",        Enum.FontWeight.Medium), bold=Font.new("rbxasset://fonts/families/Ubuntu.json",        Enum.FontWeight.Bold) },
    { name="Montserrat",   regular=Font.new("rbxasset://fonts/families/Montserrat.json",    Enum.FontWeight.Regular), medium=Font.new("rbxasset://fonts/families/Montserrat.json",    Enum.FontWeight.Medium), bold=Font.new("rbxasset://fonts/families/Montserrat.json",    Enum.FontWeight.Bold) },
    { name="Source Sans",  regular=Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Regular), medium=Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Medium), bold=Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Bold) },
    { name="Roboto Mono",  regular=Font.new("rbxasset://fonts/families/RobotoMono.json",    Enum.FontWeight.Regular), medium=Font.new("rbxasset://fonts/families/RobotoMono.json",    Enum.FontWeight.Medium), bold=Font.new("rbxasset://fonts/families/RobotoMono.json",    Enum.FontWeight.Bold) },
    { name="Nunito",       regular=Font.new("rbxasset://fonts/families/Nunito.json",         Enum.FontWeight.Regular), medium=Font.new("rbxasset://fonts/families/Nunito.json",         Enum.FontWeight.Medium), bold=Font.new("rbxasset://fonts/families/Nunito.json",         Enum.FontWeight.Bold) },
}
local function ApplyFont(entry)
    Font.Regular = entry.regular
    Font.Medium  = entry.medium
    Font.Bold    = entry.bold
end

-- // ─── Notify Icons per type ───────────────────────────────────────────────
local NotifIcons = {
    Info    = "rbxassetid://10709775704",
    Success = "rbxassetid://10734950586",
    Warning = "rbxassetid://10734918732",
    Error   = "rbxassetid://10734896603",
}

-- // ─── Helpers ──────────────────────────────────────────────────────────────
local function Tween(inst, props, dur, style, dir)
    local t = ts:Create(inst,
        TweenInfo.new(dur or Anim.Normal,
            style or Enum.EasingStyle.Quint,
            dir   or Enum.EasingDirection.Out), props)
    t:Play(); return t
end

local function New(class, props)
    local inst = Instance.new(class)
    for k, v in pairs(props) do if k ~= "Parent" then inst[k] = v end end
    if props.Parent then inst.Parent = props.Parent end
    return inst
end

local function Corner(p, r)  return New("UICorner",  { CornerRadius=UDim.new(0,r or 6), Parent=p }) end
local function Stroke(p,c,t,tr)
    return New("UIStroke", {
        ApplyStrokeMode=Enum.ApplyStrokeMode.Border,
        Color=c or Theme.Border, Thickness=t or 1, Transparency=tr or 0, Parent=p })
end
local function Padding(p,t,b,l,r)
    return New("UIPadding",{PaddingTop=UDim.new(0,t or 0),PaddingBottom=UDim.new(0,b or 0),
        PaddingLeft=UDim.new(0,l or 0),PaddingRight=UDim.new(0,r or 0),Parent=p})
end
local function List(p,gap,sort,dir)
    return New("UIListLayout",{Padding=UDim.new(0,gap or 0),
        SortOrder=sort or Enum.SortOrder.LayoutOrder,
        FillDirection=dir or Enum.FillDirection.Vertical,Parent=p})
end

-- Warn with library prefix
local function Warn(msg, ...)
    warn(("[Zenith Ui v%s] %s"):format(Library.Version, msg:format(...)))
end

-- Validate required cfg fields
local function Require(cfg, field, context)
    if cfg[field] == nil then
        Warn("Missing '%s' in %s — using default", field, context or "element")
    end
end

-- // ─── Chainable wrapper ────────────────────────────────────────────────────
-- Wraps a methods table so every method returns self (enables chaining)
local function Chainable(methods)
    return setmetatable(methods, {
        __index = function(t, k)
            local fn = rawget(t, k)
            if fn then return fn end
        end,
        __newindex = function(t, k, v) rawset(t, k, v) end,
    })
end

-- // ─── Dragging ─────────────────────────────────────────────────────────────
local function MakeDraggable(frame, handle)
    local drag, inp, start, pos0 = false, nil, nil, nil
    handle = handle or frame
    handle.InputBegan:Connect(function(i)
        if i.UserInputType == Enum.UserInputType.MouseButton1
        or i.UserInputType == Enum.UserInputType.Touch then
            drag=true; start=i.Position; pos0=frame.Position
            i.Changed:Connect(function()
                if i.UserInputState==Enum.UserInputState.End then drag=false end
            end)
        end
    end)
    handle.InputChanged:Connect(function(i)
        if i.UserInputType==Enum.UserInputType.MouseMovement
        or i.UserInputType==Enum.UserInputType.Touch then inp=i end
    end)
    ui.InputChanged:Connect(function(i)
        if i==inp and drag then
            local d=i.Position-start
            frame.Position=UDim2.new(pos0.X.Scale,pos0.X.Offset+d.X,
                                     pos0.Y.Scale,pos0.Y.Offset+d.Y)
        end
    end)
end

-- // ─── Tooltip ──────────────────────────────────────────────────────────────
local ActiveTooltip = nil

local function MakeTooltip(parent, text, sGui)
    if not text or text=="" then return end
    local tip = New("Frame",{
        Name="Tooltip", BackgroundColor3=Color3.fromRGB(18,18,24),
        BorderSizePixel=0, AutomaticSize=Enum.AutomaticSize.XY,
        Visible=false, ZIndex=9000,
        Parent=sGui or parent:FindFirstAncestorOfClass("ScreenGui"),
    })
    Corner(tip,4); Stroke(tip,Theme.BorderLight,1)
    local lbl=New("TextLabel",{
        FontFace=Font.Regular, TextColor3=Theme.Text, Text=text,
        BackgroundTransparency=1, AutomaticSize=Enum.AutomaticSize.XY,
        TextSize=TS.Tiny, ZIndex=9001, Parent=tip,
    })
    Padding(lbl,4,4,7,7)
    parent.MouseEnter:Connect(function()
        if ActiveTooltip and ActiveTooltip~=tip then ActiveTooltip.Visible=false end
        ActiveTooltip=tip; tip.Visible=true
    end)
    parent.MouseLeave:Connect(function() tip.Visible=false end)
    local c=rs.RenderStepped:Connect(function()
        if not tip.Visible then return end
        local m=ui:GetMouseLocation()
        local vp=workspace.CurrentCamera.ViewportSize
        tip.Position=UDim2.new(0,math.min(m.X+14,vp.X-tip.AbsoluteSize.X-4),
                                 0,math.min(m.Y+20,vp.Y-tip.AbsoluteSize.Y-4))
    end)
    table.insert(Connections,c)
    return tip
end

-- // ─── Disconnect ───────────────────────────────────────────────────────────
local function DisconnectAll()
    for _,c in pairs(Connections) do
        if typeof(c)=="RBXScriptConnection" then pcall(function() c:Disconnect() end) end
    end
    Connections={}
end

-- // ─── Config file helpers ──────────────────────────────────────────────────
local function EnsureDir(folder)
    if isfolder and not isfolder(folder) then makefolder(folder) end
end
local function GetConfigs(folder)
    local out={}
    if isfolder and listfiles then
        EnsureDir(folder)
        for _,f in ipairs(listfiles(folder)) do
            local n=f:match(folder.."/(.+)%.json$") or f:match(folder.."\\(.+)%.json$")
            if n then table.insert(out,n) end
        end
    end
    return out
end

-- // ─── Acrylic Blur ─────────────────────────────────────────────────────────
local AcrylicBlur = {}; AcrylicBlur.__index = AcrylicBlur

function AcrylicBlur.new(object)
    local self=setmetatable({_object=object,_enabled=true},AcrylicBlur)
    self:_Init(); return self
end
function AcrylicBlur:_Init()
    for _,n in ipairs({"AcrylicBlur","AcrylicBlurEffect"}) do
        local o=lg:FindFirstChild(n); if o then o:Destroy() end
    end
    local old=workspace.CurrentCamera:FindFirstChild("AcrylicBlur")
    if old then old:Destroy() end
    self._dof=New("DepthOfFieldEffect",{Name="AcrylicBlur",FarIntensity=0,
        FocusDistance=0.05,InFocusRadius=0.1,NearIntensity=0.5,Parent=lg})
    self._folder=New("Folder",{Name="AcrylicBlur",Parent=workspace.CurrentCamera})
    self._root=New("Part",{Name="Root",Color=Color3.new(0,0,0),
        Material=Enum.Material.Glass,Size=Vector3.new(1,1,0),Anchored=true,
        CanCollide=false,CanQuery=false,Locked=true,CastShadow=false,
        Transparency=0.95,Parent=self._folder})
    New("SpecialMesh",{MeshType=Enum.MeshType.Brick,Parent=self._root})
    self._frame=New("Frame",{Size=UDim2.new(1,0,1,0),
        Position=UDim2.new(0.5,0,0.5,0),AnchorPoint=Vector2.new(0.5,0.5),
        BackgroundTransparency=1,Parent=self._object})
    self:_Render()
end
function AcrylicBlur:_Render(dist)
    dist=dist or 0.001
    local positions={tl=Vector2.new(),tr=Vector2.new(),br=Vector2.new()}
    local function VW(loc,d)
        local r=workspace.CurrentCamera:ScreenPointToRay(loc.X,loc.Y)
        return r.Origin+r.Direction*d
    end
    local function GetOff() return(workspace.CurrentCamera.ViewportSize.Y/2560)*24+4 end
    local function UpdPos(sz,pos)
        positions.tl=pos; positions.tr=pos+Vector2.new(sz.X,0)
        positions.br=pos+sz
    end
    local function Upd()
        if not self._root or not self._enabled then return end
        local tl=VW(positions.tl,dist); local tr=VW(positions.tr,dist)
        local br=VW(positions.br,dist)
        self._root.CFrame=CFrame.fromMatrix((tl+br)/2,
            workspace.CurrentCamera.CFrame.XVector,
            workspace.CurrentCamera.CFrame.YVector,
            workspace.CurrentCamera.CFrame.ZVector)
        self._root.Mesh.Scale=Vector3.new((tr-tl).Magnitude,(tr-br).Magnitude,0)
    end
    local function OnChange()
        if not self._enabled then return end
        local off=GetOff()
        local sz=self._frame.AbsoluteSize-Vector2.new(off,off)
        local pos=self._frame.AbsolutePosition+Vector2.new(off/2,off/2)
        UpdPos(sz,pos); task.spawn(Upd)
    end
    Connections["blur_cf"]=workspace.CurrentCamera:GetPropertyChangedSignal("CFrame"):Connect(Upd)
    Connections["blur_vp"]=workspace.CurrentCamera:GetPropertyChangedSignal("ViewportSize"):Connect(Upd)
    Connections["blur_ap"]=self._frame:GetPropertyChangedSignal("AbsolutePosition"):Connect(OnChange)
    Connections["blur_as"]=self._frame:GetPropertyChangedSignal("AbsoluteSize"):Connect(OnChange)
    Connections["blur_rs"]=rs.RenderStepped:Connect(Upd)
    task.spawn(OnChange)
end
function AcrylicBlur:SetEnabled(v)
    self._enabled=v
    if self._root then self._root.Transparency=v and 0.95 or 1 end
    if self._dof  then self._dof.Enabled=v end
end
function AcrylicBlur:Destroy()
    if self._folder then self._folder:Destroy() end
    for _,n in ipairs({"AcrylicBlur","AcrylicBlurEffect"}) do
        local f=lg:FindFirstChild(n); if f then f:Destroy() end
    end
end

-- // ─── Notification (redesigned) ────────────────────────────────────────────
--[[
  Animation sequence (per notif):
  1. Spawn off-screen right, full transparent, scale X = 0.6
  2. Slide in (Back.Out) + fade-in simultaneously → 0.35s
  3. Icon pulses once (scale up → down) → 0.25s
  4. Timer bar drains left → duration
  5. Slide out (Back.In) + fade-out → 0.28s → destroy
]]

local function EnsureNotifContainer(sGui)
    if NotifContainer and NotifContainer.Parent then return NotifContainer end
    NotifContainer=New("Frame",{
        Name="NotifContainer",BackgroundTransparency=1,
        Position=UDim2.new(1,-276,0,16),
        Size=UDim2.new(0,260,1,-32),
        Parent=sGui,
    })
    New("UIListLayout",{
        Padding=UDim.new(0,6),
        SortOrder=Enum.SortOrder.LayoutOrder,
        FillDirection=Enum.FillDirection.Vertical,
        Parent=NotifContainer,
    })
    return NotifContainer
end

local function FireNotify(sGui, cfg)
    local title    = cfg.Title       or "Notification"
    local desc     = cfg.Description or ""
    local duration = cfg.Duration    or 3
    local nType    = cfg.Type        or "Info"
    local icon     = NotifIcons[nType] or NotifIcons.Info
    local accent   = Theme[nType]    or Theme.Info

    EnsureNotifContainer(sGui)

    -- Wrapper (drives height for list layout)
    local wrapper=New("Frame",{
        Name="NW", BackgroundTransparency=1,
        Size=UDim2.new(1,0,0,Size.Notif.Height+4),
        ClipsDescendants=false,
        Parent=NotifContainer,
    })

    -- Card (the visible notif) — square corners, slide-in from right
    local card=New("Frame",{
        Name="Card",
        BackgroundColor3=Color3.fromRGB(16,16,20),
        BorderSizePixel=0,
        -- Start: off-screen to the right
        Position=UDim2.new(0,Size.Notif.Width+24,0,0),
        Size=UDim2.new(1,0,0,Size.Notif.Height),
        BackgroundTransparency=1,
        ClipsDescendants=true,
        Parent=wrapper,
    })
    -- NO Corner() → square notif
    local cardStroke=Stroke(card,accent,1,0.4)

    -- Glow left bar (accent color) — square
    local glowBar=New("Frame",{
        BackgroundColor3=accent, BorderSizePixel=0,
        Size=UDim2.new(0,3,1,0), Parent=card,
    })

    -- Icon area
    local iconFrame=New("Frame",{
        BackgroundColor3=accent,BackgroundTransparency=0.85,
        BorderSizePixel=0,
        Position=UDim2.new(0,10,0.5,-12),
        Size=UDim2.new(0,24,0,24),
        Parent=card,
    })
    -- no corner on icon frame → square
    local iconImg=New("ImageLabel",{
        BackgroundTransparency=1, Image=icon,
        ImageColor3=accent,
        AnchorPoint=Vector2.new(0.5,0.5),
        Position=UDim2.new(0.5,0,0.5,0),
        Size=UDim2.new(0,14,0,14),
        Parent=iconFrame,
    })

    -- Texts
    New("TextLabel",{
        FontFace=Font.Bold, TextColor3=Theme.Text,
        Text=title, BackgroundTransparency=1,
        TextXAlignment=Enum.TextXAlignment.Left,
        Position=UDim2.new(0,42,0,10),
        TextSize=TS.Normal,
        Size=UDim2.new(1,-52,0,16), Parent=card,
    })
    New("TextLabel",{
        FontFace=Font.Regular, TextColor3=Theme.TextDark,
        Text=desc, BackgroundTransparency=1,
        TextXAlignment=Enum.TextXAlignment.Left,
        TextWrapped=true, TextTruncate=Enum.TextTruncate.AtEnd,
        Position=UDim2.new(0,42,0,28),
        TextSize=TS.Small,
        Size=UDim2.new(1,-52,0,32), Parent=card,
    })

    -- Timer bar (bottom)
    local timerTrack=New("Frame",{
        BackgroundColor3=Color3.fromRGB(30,30,36),BorderSizePixel=0,
        Position=UDim2.new(0,0,1,-3),
        Size=UDim2.new(1,0,0,3),
        Parent=card,
    })
    local timerFill=New("Frame",{
        BackgroundColor3=accent,BorderSizePixel=0,
        Size=UDim2.new(1,0,1,0),
        Parent=timerTrack,
    })
    -- square timer fill
    New("UIGradient",{
        Color=ColorSequence.new({
            ColorSequenceKeypoint.new(0, Theme.AccentDark or Color3.fromRGB(80,65,180)),
            ColorSequenceKeypoint.new(1, accent),
        }),
        Parent=timerFill,
    })

    -- Close button
    local closeBtn=New("ImageButton",{
        Image="rbxassetid://119943770201674",
        ImageColor3=Theme.TextDark,BackgroundTransparency=1,
        AnchorPoint=Vector2.new(1,0),
        Position=UDim2.new(1,-6,0,6),
        Size=UDim2.new(0,12,0,12),
        Parent=card,
    })

    -- ── Animate IN: slide in from right ────────────────────────────────────
    Tween(card,{Position=UDim2.new(0,0,0,0), BackgroundTransparency=0},
        0.3, Enum.EasingStyle.Quint, Enum.EasingDirection.Out)
    Tween(cardStroke,{Transparency=0}, 0.3)

    -- Step 3: timer drain
    Tween(timerFill,{Size=UDim2.new(0,0,1,0)}, duration, Enum.EasingStyle.Linear)

    -- ── Close function ──────────────────────────────────────────────────────
    local closed=false
    local function Close()
        if closed then return end; closed=true
        Tween(card,{Position=UDim2.new(0,Size.Notif.Width+24,0,0),BackgroundTransparency=1},
            0.25,Enum.EasingStyle.Quint,Enum.EasingDirection.In)
        Tween(cardStroke,{Transparency=1},0.28)
        task.delay(0.32,function()
            Tween(wrapper,{Size=UDim2.new(1,0,0,0)},0.18,Enum.EasingStyle.Quint)
            task.delay(0.22,function() wrapper:Destroy() end)
        end)
    end

    closeBtn.MouseButton1Click:Connect(Close)
    task.delay(duration+0.05,Close)

    -- Hover: pause timer visual (UX nicety)
    card.MouseEnter:Connect(function()
        timerFill.Size=UDim2.new(timerFill.Size.X.Scale,0,1,0) -- freeze width
    end)
end

-- // ─── Library Constructor ──────────────────────────────────────────────────
function Library.new(title, configFolder)
    RebuildSize()
    local self=setmetatable({},Library)
    self.title          = title         or "Acrylic"
    self.configFolder   = configFolder  or title or "Acrylic"
    self._sections      = {}
    self._allTabs       = {}
    self.currentTab     = nil
    self.minimized      = false
    self._visible       = true
    self._originalH     = Size.Window.Height
    self._toggleKey     = Enum.KeyCode.RightControl
    self._keybinds      = {}
    self._flags         = {}      -- { [flagName] = value }
    self._flagListeners = {}      -- { [flagName] = { callbacks } }
    self._configElems   = {}      -- { [flagName] = { getValue, setValue } }
    self._autoSave      = false
    self._currentConfig = "default"
    self._deviceType    = Device.Detect()
    self._acrylicBlur   = nil
    self._mobileToggle  = nil

    self:_Build()
    self:_SetupKeybinds()
    self:_SetupMobile()
    self:_SetupViewportWatch()
    EnsureNotifContainer(self.screenGui)

    self:Notify({
        Title="Zenith Ui  v"..Library.Version,
        Description=self._deviceType.." detected — UI ready",
        Duration=3, Type="Success",
    })
    return self
end

-- // ─── Flag System ──────────────────────────────────────────────────────────
function Library:_RegisterConfig(flag, getVal, setVal)
    if not flag then return end
    self._configElems[flag]={ getValue=getVal, setValue=setVal }
end

function Library:_SetFlagInternal(flag, value)
    if not flag then return end
    self._flags[flag]=value
    if self._flagListeners[flag] then
        for _,cb in ipairs(self._flagListeners[flag]) do pcall(cb,value) end
    end
end

function Library:GetFlag(flag)
    if self._flags[flag]==nil then
        Warn("GetFlag: flag '%s' not found", tostring(flag))
    end
    return self._flags[flag]
end

function Library:SetFlag(flag, value)
    if self._configElems[flag] then
        pcall(self._configElems[flag].setValue, value)
    else
        Warn("SetFlag: flag '%s' not registered", tostring(flag))
    end
end

function Library:OnFlagChanged(flag, callback)
    if type(callback)~="function" then
        Warn("OnFlagChanged: callback must be a function"); return
    end
    if not self._flagListeners[flag] then self._flagListeners[flag]={} end
    table.insert(self._flagListeners[flag], callback)
end

-- // ─── Notifications ────────────────────────────────────────────────────────
function Library:Notify(cfg)
    if not self.screenGui then return end
    FireNotify(self.screenGui, cfg)
end

-- // ─── Confirm Dialog ───────────────────────────────────────────────────────
function Library:Confirm(cfg)
    local title  = cfg.Title       or "Are you sure?"
    local desc   = cfg.Description or ""
    local onYes  = cfg.OnYes       or function() end
    local onNo   = cfg.OnNo        or function() end
    local yesLbl = cfg.YesLabel    or "Confirm"
    local noLbl  = cfg.NoLabel     or "Cancel"

    local overlay=New("Frame",{
        Name="ConfirmOverlay",
        BackgroundColor3=Color3.new(0,0,0),
        BackgroundTransparency=0.5,
        Size=UDim2.new(1,0,1,0),
        ZIndex=5000, Parent=self.screenGui,
    })
    local dialog=New("Frame",{
        Name="Dialog",
        BackgroundColor3=Color3.fromRGB(18,18,22),
        BorderSizePixel=0,
        AnchorPoint=Vector2.new(0.5,0.5),
        Position=UDim2.new(0.5,0,0.4,0),
        Size=UDim2.new(0,280,0,0),
        AutomaticSize=Enum.AutomaticSize.Y,
        ZIndex=5001, Parent=overlay,
    })
    Corner(dialog,10); Stroke(dialog,Theme.Border,1)
    Padding(dialog,16,16,16,16)

    local layout=List(dialog,10)

    New("TextLabel",{
        FontFace=Font.Bold,TextColor3=Theme.Text,
        Text=title,BackgroundTransparency=1,
        TextXAlignment=Enum.TextXAlignment.Left,
        TextSize=TS.Normal,AutomaticSize=Enum.AutomaticSize.Y,
        Size=UDim2.new(1,0,0,0),ZIndex=5002,Parent=dialog,
    })
    if desc~="" then
        New("TextLabel",{
            FontFace=Font.Regular,TextColor3=Theme.TextDark,
            Text=desc,BackgroundTransparency=1,
            TextXAlignment=Enum.TextXAlignment.Left,
            TextWrapped=true,TextSize=TS.Small,
            AutomaticSize=Enum.AutomaticSize.Y,
            Size=UDim2.new(1,0,0,0),ZIndex=5002,Parent=dialog,
        })
    end

    local btnRow=New("Frame",{
        BackgroundTransparency=1,
        Size=UDim2.new(1,0,0,32),ZIndex=5002,Parent=dialog,
    })
    List(btnRow,8,Enum.SortOrder.LayoutOrder,Enum.FillDirection.Horizontal)

    local function MakeBtn(lbl,color,cb)
        local b=New("TextButton",{
            FontFace=Font.Bold,Text=lbl,
            TextColor3=Color3.new(1,1,1),
            BackgroundColor3=color,BorderSizePixel=0,
            AutomaticSize=Enum.AutomaticSize.X,
            Size=UDim2.new(0,0,1,0),ZIndex=5003,Parent=btnRow,
        })
        Corner(b,6); Padding(b,0,0,14,14)
        b.MouseButton1Click:Connect(function()
            overlay:Destroy(); pcall(cb)
        end)
        b.MouseEnter:Connect(function()
            Tween(b,{BackgroundTransparency=0.2},Anim.Fast)
        end)
        b.MouseLeave:Connect(function()
            Tween(b,{BackgroundTransparency=0},Anim.Fast)
        end)
    end
    MakeBtn(yesLbl, Theme[cfg.YesType or "Error"] or Theme.Error, onYes)
    MakeBtn(noLbl,  Theme.Tertiary, onNo)

    -- Animate in
    dialog.BackgroundTransparency=1
    Tween(dialog,{BackgroundTransparency=0},0.2)
end

-- // ─── Build Window ─────────────────────────────────────────────────────────
function Library:_Build()
    local vp=workspace.CurrentCamera.ViewportSize
    local wx=math.floor((vp.X-Size.Window.Width)/2)
    local wy=math.floor((vp.Y-Size.Window.Height)/2)

    self.screenGui=New("ScreenGui",{
        Name=Library.Name,ResetOnSpawn=false,
        ZIndexBehavior=Enum.ZIndexBehavior.Sibling,DisplayOrder=100,
    })
    self.container=New("Frame",{
        Name="Container",BackgroundColor3=Theme.Background,
        BorderSizePixel=0,
        Position=UDim2.new(0,wx,0,wy),
        Size=UDim2.new(0,Size.Window.Width,0,Size.Window.Height),
        ClipsDescendants=false,
        Parent=self.screenGui,
    })
    Corner(self.container,8); Stroke(self.container,Theme.Border,1)

    -- Background image/gif layer (hidden by default, sits below everything)
    self._bgLayer = New("ImageLabel",{
        Name="BgLayer", BackgroundTransparency=1,
        Image="", ImageTransparency=0.15,
        ScaleType=Enum.ScaleType.Crop,
        Size=UDim2.new(1,0,1,0), ZIndex=0,
        Visible=false, Parent=self.container,
    })
    Corner(self._bgLayer, 8)

    self.topBar=New("Frame",{
        Name="TopBar",BackgroundTransparency=1,
        Size=UDim2.new(1,0,0,44),Parent=self.container,
    })
    New("TextLabel",{
        FontFace=Font.Bold,TextColor3=Theme.Text,Text=self.title,
        BackgroundTransparency=1,TextXAlignment=Enum.TextXAlignment.Left,
        Position=UDim2.new(0,16,0.5,-9),TextSize=TS.Title,
        Size=UDim2.new(0,160,0,18),Parent=self.topBar,
    })
    -- Version badge
    New("TextLabel",{
        FontFace=Font.Regular,TextColor3=Theme.TextDark,
        Text="v"..Library.Version,
        BackgroundTransparency=1,TextXAlignment=Enum.TextXAlignment.Left,
        Position=UDim2.new(0,180,0.5,-7),TextSize=TS.Tiny,
        Size=UDim2.new(0,60,0,14),Parent=self.topBar,
    })
    -- Device badge
    self._deviceBadge=New("TextLabel",{
        FontFace=Font.Regular,TextColor3=Theme.TextDark,
        Text="["..self._deviceType.."]",
        BackgroundTransparency=1,TextXAlignment=Enum.TextXAlignment.Left,
        Position=UDim2.new(0,234,0.5,-7),TextSize=TS.Tiny,
        Size=UDim2.new(0,90,0,14),Parent=self.topBar,
    })

    self:_BuildControls()
    New("Frame",{Name="Div",BackgroundColor3=Theme.Border,
        Position=UDim2.new(0,0,0,44),BorderSizePixel=0,
        Size=UDim2.new(1,0,0,1),Parent=self.container})
    self:_BuildContent()
    MakeDraggable(self.container,self.topBar)
    self.screenGui.Parent=plr.LocalPlayer:WaitForChild("PlayerGui")
    self._acrylicBlur=AcrylicBlur.new(self.container)
    self:_BuildWatermark()
end

-- // ─── Watermark ────────────────────────────────────────────────────────────
function Library:_BuildWatermark()
    -- Default label: "Zenith Ui  |  <script title>"
    local wmText = Library.Name .. "  |  " .. self.title

    local wm = New("Frame", {
        Name = "Watermark",
        BackgroundColor3 = Color3.fromRGB(13, 13, 15),
        BackgroundTransparency = 0.25,
        BorderSizePixel = 0,
        AutomaticSize = Enum.AutomaticSize.X,
        Size = UDim2.new(0, 0, 0, 24),
        -- bottom-left corner
        AnchorPoint = Vector2.new(0, 1),
        Position = UDim2.new(0, 8, 1, -8),
        ZIndex = 150,
        Parent = self.screenGui,
    })
    Stroke(wm, Theme.Accent, 1, 0.5)
    Padding(wm, 0, 0, 8, 8)

    -- Accent left bar
    New("Frame", {
        BackgroundColor3 = Theme.Accent,
        BorderSizePixel = 0,
        Size = UDim2.new(0, 2, 1, 0),
        ZIndex = 151,
        Parent = wm,
    })

    local wmLabel = New("TextLabel", {
        FontFace = Font.Medium,
        TextColor3 = Theme.Text,
        Text = wmText,
        BackgroundTransparency = 1,
        TextXAlignment = Enum.TextXAlignment.Left,
        TextSize = TS.Small,
        AutomaticSize = Enum.AutomaticSize.X,
        Size = UDim2.new(0, 0, 1, 0),
        Position = UDim2.new(0, 10, 0, 0),
        ZIndex = 151,
        Parent = wm,
    })

    -- Fade in
    wm.BackgroundTransparency = 1
    wmLabel.TextTransparency = 1
    Tween(wm,      { BackgroundTransparency = 0.25 }, 0.4)
    Tween(wmLabel, { TextTransparency = 0 },           0.4)

    self._watermark      = wm
    self._watermarkLabel = wmLabel
    self._watermarkVisible = true
    MakeDraggable(wm, wm)
end

-- Public API ──────────────────────────────────────────────────────────────────

-- SetWatermarkText(text) → override the watermark string entirely
function Library:SetWatermarkText(text)
    if self._watermarkLabel then
        self._watermarkLabel.Text = tostring(text)
    end
end

-- SetWatermarkVisible(bool) → show / hide with fade
function Library:SetWatermarkVisible(bool)
    if not self._watermark then return end
    self._watermarkVisible = bool
    if bool then
        self._watermark.Visible = true
        Tween(self._watermark,      { BackgroundTransparency = 0.25 }, Anim.Normal)
        Tween(self._watermarkLabel, { TextTransparency = 0 },           Anim.Normal)
    else
        Tween(self._watermark,      { BackgroundTransparency = 1 }, Anim.Normal)
        Tween(self._watermarkLabel, { TextTransparency = 1 },       Anim.Normal)
        task.delay(Anim.Normal + 0.05, function()
            if not self._watermarkVisible and self._watermark then
                self._watermark.Visible = false
            end
        end)
    end
end

-- // ─── Controls (minimize / close / resize) ────────────────────────────────
function Library:_BuildControls()
    local function IconBtn(img,xOff,onClick,hoverC)
        local b=New("ImageButton",{
            ImageColor3=Theme.TextDark,Image=img,
            BackgroundTransparency=1,AnchorPoint=Vector2.new(1,0.5),
            Position=UDim2.new(1,xOff,0.5,0),Size=UDim2.new(0,14,0,14),
            Parent=self.topBar,
        })
        b.MouseEnter:Connect(function() Tween(b,{ImageColor3=hoverC or Theme.Text},Anim.Fast) end)
        b.MouseLeave:Connect(function() Tween(b,{ImageColor3=Theme.TextDark},Anim.Fast) end)
        b.MouseButton1Click:Connect(onClick)
        return b
    end
    IconBtn("rbxassetid://82603981310445",-35,function() self:_ToggleMinimize() end)
    IconBtn("rbxassetid://119943770201674",-12,function() self:Destroy() end,Color3.fromRGB(255,90,90))

    self.resizeBtn=New("ImageButton",{
        Name="Resize",ImageColor3=Theme.Border,
        Image="rbxassetid://120997033468887",BackgroundTransparency=1,
        AnchorPoint=Vector2.new(0.5,0.5),
        Position=UDim2.new(1,-5,1,-5),Size=UDim2.new(0,60,0,58),
        Parent=self.container,
    })
    self:_SetupResize(self.resizeBtn)
end

-- // ─── Content area ─────────────────────────────────────────────────────────
function Library:_BuildContent()
    self.mainContent=New("Frame",{
        Name="MainContent",BackgroundTransparency=1,
        Position=UDim2.new(0,0,0,45),
        Size=UDim2.new(1,0,1,-45),
        ClipsDescendants=true,Parent=self.container,
    })
    -- Search box
    local searchArea=New("Frame",{
        BackgroundTransparency=1,
        Position=UDim2.new(0,0,0,0),
        Size=UDim2.new(0,Size.Sidebar,0,34),
        Parent=self.mainContent,
    })
    local sb=New("TextBox",{
        FontFace=Font.Regular,TextColor3=Theme.Text,
        PlaceholderText="Search…",PlaceholderColor3=Theme.TextDark,
        Text="",BackgroundColor3=Theme.Tertiary,
        BackgroundTransparency=0.3,BorderSizePixel=0,
        TextSize=TS.Small,ClearTextOnFocus=false,
        Size=UDim2.new(1,-10,0,22),Position=UDim2.new(0,5,0.5,-11),
        Parent=searchArea,
    })
    Corner(sb,5); Stroke(sb,Theme.Border,1); Padding(sb,0,0,6,6)

    self.sidebar=New("ScrollingFrame",{
        Name="Sidebar",ScrollBarThickness=0,BackgroundTransparency=1,
        Position=UDim2.new(0,0,0,34),
        Size=UDim2.new(0,Size.Sidebar,1,-34),
        CanvasSize=UDim2.new(0,0,0,0),
        AutomaticCanvasSize=Enum.AutomaticSize.Y,
        ScrollingDirection=Enum.ScrollingDirection.Y,
        Parent=self.mainContent,
    })
    List(self.sidebar,0); Padding(self.sidebar,6,6,6,6)

    self.sidebarSep=New("Frame",{
        Name="Sep",BackgroundColor3=Theme.Border,
        Position=UDim2.new(0,Size.Sidebar,0,0),BorderSizePixel=0,
        Size=UDim2.new(0,1,1,0),Parent=self.mainContent,
    })
    self.contentFrame=New("ScrollingFrame",{
        Name="Content",ScrollBarThickness=3,
        ScrollBarImageColor3=Color3.fromRGB(60,60,72),
        BackgroundTransparency=1,
        Position=UDim2.new(0,Size.Sidebar+1,0,0),
        Size=UDim2.new(1,-(Size.Sidebar+1),1,0),
        CanvasSize=UDim2.new(0,0,0,0),
        AutomaticCanvasSize=Enum.AutomaticSize.Y,
        ScrollingDirection=Enum.ScrollingDirection.Y,
        Parent=self.mainContent,
    })
    List(self.contentFrame,8); Padding(self.contentFrame,10,10,14,14)

    -- Sidebar search filter
    sb:GetPropertyChangedSignal("Text"):Connect(function()
        local q=sb.Text:lower()
        for _,td in ipairs(self._allTabs) do
            if td.frame then
                td.frame.Visible=(q=="" or td.name:lower():find(q,1,true)~=nil)
            end
        end
    end)
end

-- // ─── Resize ───────────────────────────────────────────────────────────────
function Library:_SetupResize(handle)
    local resizing,rStart,rSize=false,nil,nil
    handle.MouseEnter:Connect(function() Tween(handle,{ImageColor3=Theme.Accent},Anim.Fast) end)
    handle.MouseLeave:Connect(function()
        if not resizing then Tween(handle,{ImageColor3=Theme.Border},Anim.Fast) end
    end)
    handle.InputBegan:Connect(function(i)
        if i.UserInputType==Enum.UserInputType.MouseButton1
        or i.UserInputType==Enum.UserInputType.Touch then
            resizing=true; rStart=i.Position; rSize=self.container.AbsoluteSize
            i.Changed:Connect(function()
                if i.UserInputState==Enum.UserInputState.End then
                    resizing=false; Tween(handle,{ImageColor3=Theme.Border},Anim.Fast)
                end
            end)
        end
    end)
    ui.InputChanged:Connect(function(i)
        if resizing and (i.UserInputType==Enum.UserInputType.MouseMovement
        or i.UserInputType==Enum.UserInputType.Touch) then
            local d=i.Position-rStart
            local nw=math.clamp(rSize.X+d.X,Size.MinWin.Width,Size.MaxWin.Width)
            local nh=math.clamp(rSize.Y+d.Y,Size.MinWin.Height,Size.MaxWin.Height)
            self.container.Size=UDim2.new(0,nw,0,nh)
            self._originalH=nh
        end
    end)
end

-- // ─── Minimize ─────────────────────────────────────────────────────────────
function Library:_ToggleMinimize()
    self.minimized=not self.minimized
    if self.minimized then
        if self._acrylicBlur then self._acrylicBlur:SetEnabled(false) end
        Tween(self.mainContent,{Size=UDim2.new(1,0,0,0)},Anim.Slow)
        Tween(self.container,{Size=UDim2.new(0,self.container.AbsoluteSize.X,0,44)},Anim.Slow)
        if self.resizeBtn then self.resizeBtn.Visible=false end
    else
        if self._acrylicBlur then self._acrylicBlur:SetEnabled(true) end
        Tween(self.container,{Size=UDim2.new(0,self.container.AbsoluteSize.X,0,self._originalH)},Anim.Slow)
        task.delay(0.1,function()
            Tween(self.mainContent,{Size=UDim2.new(1,0,1,-45)},Anim.Normal)
        end)
        if self.resizeBtn then self.resizeBtn.Visible=true end
    end
end

-- // ─── Destroy ──────────────────────────────────────────────────────────────
function Library:Destroy()
    if self._autoSave then self:SaveConfig(self._currentConfig) end
    DisconnectAll()
    if self._acrylicBlur then self._acrylicBlur:Destroy() end
    if self._watermark and self._watermark.Parent then self._watermark:Destroy() end
    if self.screenGui and self.screenGui.Parent then self.screenGui:Destroy() end
    if NotifContainer then NotifContainer=nil end
end

-- // ─── Toggle visibility ────────────────────────────────────────────────────
function Library:SetVisible(bool)
    self._visible=bool
    self.container.Visible=bool
    if self._watermark then
        self:SetWatermarkVisible(bool and self._watermarkVisible ~= false)
    end
end

function Library:SetToggleKey(key)
    self._toggleKey=key
end

-- // ─── Keybinds ─────────────────────────────────────────────────────────────
function Library:_SetupKeybinds()
    local c=ui.InputBegan:Connect(function(i,gp)
        if gp then return end
        if i.KeyCode==self._toggleKey then
            self:SetVisible(not self._visible)
        end
        for _,kb in pairs(self._keybinds) do
            if i.KeyCode==kb.key then pcall(kb.callback) end
        end
    end)
    table.insert(Connections,c)
end

-- // ─── Mobile ───────────────────────────────────────────────────────────────
function Library:_SetupMobile()
    if not Device.IsMobile() then return end
    local btn=New("ImageButton",{
        Name="MobileToggle",Image="rbxassetid://10709775704",
        ImageColor3=Theme.Accent,BackgroundColor3=Theme.Secondary,
        BackgroundTransparency=0.2,
        Size=UDim2.new(0,44,0,44),
        Position=UDim2.new(1,-54,0.5,-22),
        ZIndex=200,Parent=self.screenGui,
    })
    Corner(btn,100); Stroke(btn,Theme.Accent,1); Padding(btn,10,10,10,10)
    MakeDraggable(btn,btn)
    btn.MouseButton1Click:Connect(function() self:SetVisible(not self._visible) end)
    self._mobileToggle=btn
end

-- // ─── Viewport watch ───────────────────────────────────────────────────────
function Library:_SetupViewportWatch()
    local c=workspace.CurrentCamera:GetPropertyChangedSignal("ViewportSize"):Connect(function()
        local nd=Device.Detect()
        if nd~=self._deviceType then
            self._deviceType=nd; RebuildSize()
            local nw=Device.GetWindowSize()
            Tween(self.container,{Size=UDim2.new(0,nw.Width,0,nw.Height)},Anim.Slow)
            self._originalH=nw.Height
            if self.sidebar    then self.sidebar.Size=UDim2.new(0,Size.Sidebar,1,-34) end
            if self.sidebarSep then self.sidebarSep.Position=UDim2.new(0,Size.Sidebar,0,0) end
            if self.contentFrame then
                self.contentFrame.Position=UDim2.new(0,Size.Sidebar+1,0,0)
                self.contentFrame.Size=UDim2.new(1,-(Size.Sidebar+1),1,0)
            end
            if self._deviceBadge then self._deviceBadge.Text="["..nd.."]" end
            self:Notify({Title="Layout Adjusted",Description="Switched to "..nd,Duration=2,Type="Info"})
        end
    end)
    table.insert(Connections,c)
end

-- // ─── Theme ────────────────────────────────────────────────────────────────
function Library:SetAccentColor(color)
    Theme.Accent=color; Theme.Info=color
    Theme.Toggle.Enabled=color
    self:Notify({Title="Theme Updated",Description="Accent color changed",Duration=2,Type="Info"})
end

-- // ─── Background Image/GIF ────────────────────────────────────────────────
function Library:SetBackground(url, transparency)
    if not self._bgLayer then return end
    -- Accept full https:// URL or rbxassetid://
    local img = url
    if url:sub(1,8)=="https://" or url:sub(1,7)=="http://" then
        -- Roblox ImageLabel supports direct https image URLs on some executors
        img = url
    end
    self._bgLayer.Image = img
    self._bgLayer.ImageTransparency = transparency or 0.15
    self._bgLayer.Visible = img ~= ""
    Tween(self._bgLayer, {ImageTransparency = transparency or 0.15}, Anim.Slow)
end

function Library:ClearBackground()
    if not self._bgLayer then return end
    Tween(self._bgLayer, {ImageTransparency=1}, Anim.Normal)
    task.delay(Anim.Normal+0.05, function()
        if self._bgLayer then
            self._bgLayer.Image=""
            self._bgLayer.Visible=false
        end
    end)
end

-- // ─── Font ─────────────────────────────────────────────────────────────────
function Library:SetFont(fontName)
    for _, entry in ipairs(FontRegistry) do
        if entry.name == fontName then
            ApplyFont(entry)
            self:Notify({Title=L("Theme"), Description="Font → "..fontName, Duration=2, Type="Info"})
            return
        end
    end
    Warn("Font '%s' not found in registry", fontName)
end

-- // ─── Language ─────────────────────────────────────────────────────────────
function Library:SetLanguage(lang)
    if not Languages[lang] then
        Warn("Language '%s' not found", lang); return
    end
    CurrentLang = lang
    self:Notify({Title=L("Settings"), Description="Language → "..lang, Duration=2, Type="Info"})
end

-- // ─── Config Save/Load ─────────────────────────────────────────────────────
function Library:SaveConfig(name)
    if not writefile then
        return self:Notify({Title="Error",Description="writefile not available",Duration=3,Type="Error"})
    end
    EnsureDir(self.configFolder)
    local data={}
    for flag,e in pairs(self._configElems) do
        local v=e.getValue()
        if typeof(v)=="Color3"   then v={R=v.R,G=v.G,B=v.B,_t="Color3"} end
        if typeof(v)=="EnumItem" then v={_t="Enum",_e=tostring(v.EnumType),_v=v.Name} end
        data[flag]=v
    end
    local ok=pcall(function()
        writefile(self.configFolder.."/"..name..".json", hs:JSONEncode(data))
    end)
    if ok then
        self._currentConfig=name
        self:Notify({Title="Saved",Description=name,Duration=2,Type="Success"})
    else
        self:Notify({Title="Save Failed",Description=name,Duration=3,Type="Error"})
    end
    return ok
end

function Library:LoadConfig(name)
    if not readfile or not isfile then
        return self:Notify({Title="Error",Description="readfile not available",Duration=3,Type="Error"})
    end
    local path=self.configFolder.."/"..name..".json"
    if not isfile(path) then
        return self:Notify({Title="Not Found",Description=name,Duration=3,Type="Warning"})
    end
    local ok,data=pcall(function() return hs:JSONDecode(readfile(path)) end)
    if not ok or not data then
        return self:Notify({Title="Load Failed",Description=name,Duration=3,Type="Error"})
    end
    for flag,v in pairs(data) do
        if self._configElems[flag] then
            if type(v)=="table" and v._t=="Color3"  then v=Color3.new(v.R,v.G,v.B) end
            if type(v)=="table" and v._t=="Enum"    then v=Enum[v._e][v._v] end
            pcall(function() self._configElems[flag].setValue(v) end)
        end
    end
    self._currentConfig=name
    self:Notify({Title="Loaded",Description=name,Duration=2,Type="Success"})
    return true
end

function Library:DeleteConfig(name)
    if not delfile or not isfile then return false end
    local path=self.configFolder.."/"..name..".json"
    if isfile(path) then
        delfile(path)
        self:Notify({Title="Deleted",Description=name,Duration=2,Type="Warning"})
        return true
    end
    return false
end

function Library:GetConfigs() return GetConfigs(self.configFolder) end

function Library:SetAutoSave(en)
    self._autoSave=en
    if en then
        task.spawn(function()
            while self._autoSave and self.screenGui and self.screenGui.Parent do
                task.wait(30)
                if self._autoSave then self:SaveConfig(self._currentConfig) end
            end
        end)
    end
end

-- // ─── Tab Selection ────────────────────────────────────────────────────────
function Library:_SelectTab(tab)
    if self.currentTab then
        local p=self.currentTab
        if p.content then p.content.Visible=false end
        Tween(p.button,  {BackgroundTransparency=1},Anim.Normal)
        Tween(p.stroke,  {Transparency=1},Anim.Normal)
        Tween(p.icon,    {ImageColor3=Theme.TextDark},Anim.Normal)
        Tween(p.textLbl, {TextColor3=Theme.TextDark},Anim.Normal)
        Tween(p.accentBar,{BackgroundTransparency=1},Anim.Normal)
    end
    self.currentTab=tab
    if tab.content then tab.content.Visible=true end
    -- Scroll to top
    if self.contentFrame then self.contentFrame.CanvasPosition=Vector2.new(0,0) end
    Tween(tab.button,  {BackgroundTransparency=0.5},Anim.Normal)
    Tween(tab.stroke,  {Transparency=0},Anim.Normal)
    Tween(tab.icon,    {ImageColor3=Theme.Accent},Anim.Normal)
    Tween(tab.textLbl, {TextColor3=Theme.Text},Anim.Normal)
    Tween(tab.accentBar,{BackgroundTransparency=0},Anim.Normal)
end

-- // ─── Section ──────────────────────────────────────────────────────────────
function Library:CreateSection(name, icon)
    local sec={name=name,tabs={},expanded=true,_library=self}

    local secFrame=New("Frame",{Name="Sec_"..name,BackgroundTransparency=1,
        Size=UDim2.new(1,-8,0,0),AutomaticSize=Enum.AutomaticSize.Y,
        Parent=self.sidebar})
    List(secFrame,2)

    local hdr=New("Frame",{Name="Hdr",BackgroundTransparency=1,
        Size=UDim2.new(1,0,0,24),LayoutOrder=0,Parent=secFrame})
    local hBtn=New("TextButton",{Text="",BackgroundTransparency=1,
        Size=UDim2.new(1,0,1,0),Parent=hdr})

    local xOff=4
    if icon and icon~="" then
        New("ImageLabel",{BackgroundTransparency=1,Image=icon,ImageColor3=Theme.TextDark,
            Position=UDim2.new(0,4,0.5,-6),Size=UDim2.new(0,12,0,12),Parent=hdr})
        xOff=20
    end
    New("TextLabel",{FontFace=Font.Medium,TextColor3=Theme.TextDark,
        Text=name:upper(),TextXAlignment=Enum.TextXAlignment.Left,
        BackgroundTransparency=1,Position=UDim2.new(0,xOff,0,0),
        TextSize=TS.Tiny,Size=UDim2.new(1,-22,1,0),Parent=hdr})
    local arrow=New("ImageButton",{
        Image="rbxassetid://105558791071013",ImageColor3=Theme.TextDark,
        BackgroundTransparency=1,Rotation=0,
        Position=UDim2.new(1,-18,0.5,-6),Size=UDim2.new(0,12,0,12),Parent=hdr})

    local tabsCont=New("Frame",{Name="Tabs",BackgroundTransparency=1,
        Size=UDim2.new(1,0,0,0),AutomaticSize=Enum.AutomaticSize.Y,
        ClipsDescendants=true,LayoutOrder=1,Parent=secFrame})
    List(tabsCont,2); Padding(tabsCont,0,0,8,0)

    local function Toggle()
        sec.expanded=not sec.expanded
        Tween(arrow,{Rotation=sec.expanded and 0 or 180},Anim.Normal)
        tabsCont.Visible=sec.expanded
    end
    hBtn.MouseButton1Click:Connect(Toggle)
    arrow.MouseButton1Click:Connect(Toggle)

    sec.frame=secFrame; sec.tabsContainer=tabsCont
    table.insert(self._sections,sec)

    local meta=setmetatable({},{__index=sec})
    function meta:CreateTab(n,ico,badge) return Library._CreateTab(self,n,ico,badge) end
    return meta
end

-- // ─── Tab ──────────────────────────────────────────────────────────────────
function Library._CreateTab(section, name, icon, badge)
    local lib=section._library
    local tab={name=name,elements={},_library=lib}

    local tf=New("Frame",{Name=name,BackgroundColor3=Theme.Secondary,
        BackgroundTransparency=1,BorderSizePixel=0,
        Size=UDim2.new(1,0,0,34),Parent=section.tabsContainer})
    Corner(tf,6)
    local ts2=Stroke(tf,Theme.Border,1,1)

    local acBar=New("Frame",{BackgroundColor3=Theme.Accent,
        Position=UDim2.new(0,0,0.15,0),Size=UDim2.new(0,2,0.7,0),
        BackgroundTransparency=1,BorderSizePixel=0,Parent=tf})
    Corner(acBar,2)

    local iconL=New("ImageLabel",{BackgroundTransparency=1,
        Image=icon or "rbxassetid://112235310154264",ImageColor3=Theme.TextDark,
        AnchorPoint=Vector2.new(0,0.5),Position=UDim2.new(0,12,0.5,0),
        Size=UDim2.new(0,14,0,14),Parent=tf})
    -- Badge is built first so we know if it exists, then size text accordingly
    local badgeL=nil
    local textRightPad = 12  -- default right padding when no badge
    if badge and badge~="" then
        badgeL=New("TextLabel",{FontFace=Font.Bold,TextColor3=Color3.new(1,1,1),
            Text=tostring(badge),BackgroundColor3=Theme.Accent,BorderSizePixel=0,
            AnchorPoint=Vector2.new(1,0.5),Position=UDim2.new(1,-6,0.5,0),
            Size=UDim2.new(0,0,0,14),AutomaticSize=Enum.AutomaticSize.X,
            TextSize=9,ZIndex=2,Parent=tf})
        Corner(badgeL,0); Padding(badgeL,0,0,4,4)
        textRightPad = 42  -- leave fixed space for badge (approx max badge width + gap)
    end

    local textL=New("TextLabel",{FontFace=Font.Medium,TextColor3=Theme.TextDark,Text=name,
        TextXAlignment=Enum.TextXAlignment.Left,BackgroundTransparency=1,
        Position=UDim2.new(0,33,0,0),
        Size=UDim2.new(1,-(33+textRightPad),1,0),
        TextTruncate=Enum.TextTruncate.AtEnd,
        TextSize=TS.Small,Parent=tf})

    local cBtn=New("TextButton",{Text="",BackgroundTransparency=1,
        Size=UDim2.new(1,0,1,0),Parent=tf})

    -- Content frame (lives in contentFrame, not sidebar)
    tab.content=New("Frame",{Name=name.."_Content",BackgroundTransparency=1,
        Size=UDim2.new(1,0,0,0),AutomaticSize=Enum.AutomaticSize.Y,
        Visible=false,Parent=lib.contentFrame})
    List(tab.content,8)

    cBtn.MouseButton1Click:Connect(function() lib:_SelectTab(tab) end)
    cBtn.MouseEnter:Connect(function()
        if lib.currentTab~=tab then Tween(tf,{BackgroundTransparency=0.6},Anim.Fast) end
    end)
    cBtn.MouseLeave:Connect(function()
        if lib.currentTab~=tab then Tween(tf,{BackgroundTransparency=1},Anim.Fast) end
    end)

    tab.button=tf; tab.stroke=ts2; tab.icon=iconL
    tab.textLbl=textL; tab.accentBar=acBar
    tab.badgeL=badgeL; tab.frame=tf

    table.insert(lib._allTabs,tab)
    table.insert(section.tabs,tab)
    if not lib.currentTab then lib:_SelectTab(tab) end

    -- Build tab API
    local meta=setmetatable({},{__index=tab})

    function meta:SetBadge(b)
        if badgeL then badgeL.Text=tostring(b); badgeL.Visible=(b~=nil and b~="") end
        return self
    end
    function meta:SetVisible(bool)
        if tf then tf.Visible=bool end; return self
    end
    function meta:Clear()
        if tab.content then
            for _,c in ipairs(tab.content:GetChildren()) do
                if not c:IsA("UIListLayout") and not c:IsA("UIPadding") then c:Destroy() end
            end
        end
        return self
    end

    -- Element creators
    function meta:CreateSection(n,ico)   return Library._CreateContentSection(self,n,ico) end
    function meta:CreateParagraph(c)     return Library._CreateParagraph(self,c) end
    function meta:CreateLabel(c)         return Library._CreateLabel(self,c) end
    function meta:CreateDivider()        return Library._CreateDivider(self) end
    function meta:CreateSlider(c)        return Library._CreateSlider(self,c) end
    function meta:CreateButton(c)        return Library._CreateButton(self,c) end
    function meta:CreateToggle(c)        return Library._CreateToggle(self,c) end
    function meta:CreateDropdown(c)      return Library._CreateDropdown(self,c) end
    function meta:CreateKeybind(c)       return Library._CreateKeybind(self,c,lib) end
    function meta:CreateColorPicker(c)   return Library._CreateColorPicker(self,c) end
    function meta:CreateTextBox(c)       return Library._CreateTextBox(self,c) end
    function meta:CreateProgressBar(c)   return Library._CreateProgressBar(self,c) end
    function meta:CreateConfigSection()  return Library._CreateConfigSection(self) end
    return meta
end

-- // ─── Element base (adds SetVisible + Destroy to every element) ────────────
local function WrapElement(frame, methods)
    methods = methods or {}
    function methods:SetVisible(bool)
        if frame then frame.Visible=bool end; return self
    end
    function methods:Destroy()
        if frame then frame:Destroy() end; return self
    end
    return Chainable(methods)
end

-- // ─── Content Section Header ───────────────────────────────────────────────
function Library._CreateContentSection(tab, name, icon)
    local frame=New("Frame",{Name="Sec_"..name,BackgroundTransparency=1,
        Size=UDim2.new(1,0,0,22),Parent=tab.content})
    local xOff=0
    if icon and icon~="" then
        New("ImageLabel",{BackgroundTransparency=1,Image=icon,ImageColor3=Theme.TextDark,
            Position=UDim2.new(0,0,0.5,-6),Size=UDim2.new(0,12,0,12),Parent=frame})
        xOff=16
    end
    New("TextLabel",{FontFace=Font.Bold,TextColor3=Theme.TextDark,Text=name:upper(),
        TextXAlignment=Enum.TextXAlignment.Left,BackgroundTransparency=1,
        Position=UDim2.new(0,xOff,0,0),TextSize=TS.Tiny,
        Size=UDim2.new(0,120,1,0),Parent=frame})
    New("Frame",{BackgroundColor3=Theme.Border,BorderSizePixel=0,
        Position=UDim2.new(0,xOff+125,0.5,0),Size=UDim2.new(1,-(xOff+130),0,1),Parent=frame})
    return WrapElement(frame)
end

-- // ─── Divider ──────────────────────────────────────────────────────────────
function Library._CreateDivider(tab)
    local frame=New("Frame",{Name="Divider",BackgroundColor3=Theme.Border,
        BorderSizePixel=0,Size=UDim2.new(1,0,0,1),Parent=tab.content})
    return WrapElement(frame)
end

-- // ─── Label (realtime display) ─────────────────────────────────────────────
function Library._CreateLabel(tab, cfg)
    Require(cfg,"Name","CreateLabel")
    local name=cfg.Name or "Label"
    local val =cfg.Value or ""

    local frame=New("Frame",{Name="LBL_"..name,BackgroundTransparency=1,
        Size=UDim2.new(1,0,0,22),Parent=tab.content})

    New("TextLabel",{FontFace=Font.Medium,TextColor3=Theme.TextDark,Text=name,
        TextXAlignment=Enum.TextXAlignment.Left,BackgroundTransparency=1,
        Position=UDim2.new(0,0,0,0),TextSize=TS.Small,
        Size=UDim2.new(0.5,0,1,0),Parent=frame})

    local valLbl=New("TextLabel",{FontFace=Font.Regular,TextColor3=Theme.Text,
        Text=tostring(val),TextXAlignment=Enum.TextXAlignment.Right,
        BackgroundTransparency=1,TextSize=TS.Small,
        Position=UDim2.new(0.5,0,0,0),Size=UDim2.new(0.5,0,1,0),Parent=frame})

    local methods=WrapElement(frame,{
        SetValue=function(_,v) valLbl.Text=tostring(v); return _ end,
        GetValue=function() return valLbl.Text end,
    })
    return methods
end

-- // ─── Paragraph ────────────────────────────────────────────────────────────
function Library._CreateParagraph(tab, cfg)
    local frame=New("Frame",{Name="Para",BackgroundColor3=Theme.Secondary,
        BackgroundTransparency=0.4,BorderSizePixel=0,
        AutomaticSize=Enum.AutomaticSize.Y,Size=UDim2.new(1,0,0,0),Parent=tab.content})
    Corner(frame); Stroke(frame); Padding(frame,10,10,12,12); List(frame,4)
    New("TextLabel",{FontFace=Font.Medium,TextColor3=Theme.Text,Text=cfg.Title or "",
        TextXAlignment=Enum.TextXAlignment.Left,BackgroundTransparency=1,TextWrapped=true,
        TextSize=TS.Normal,AutomaticSize=Enum.AutomaticSize.Y,Size=UDim2.new(1,0,0,0),Parent=frame})
    New("TextLabel",{FontFace=Font.Regular,TextColor3=Theme.TextDark,Text=cfg.Content or "",
        TextXAlignment=Enum.TextXAlignment.Left,BackgroundTransparency=1,TextWrapped=true,
        TextSize=TS.Small,AutomaticSize=Enum.AutomaticSize.Y,Size=UDim2.new(1,0,0,0),Parent=frame})
    return WrapElement(frame)
end

-- // ─── Button ───────────────────────────────────────────────────────────────
function Library._CreateButton(tab, cfg)
    Require(cfg,"Name","CreateButton")
    local name=cfg.Name or "Button"
    local cb=cfg.Callback or function() end

    local frame=New("Frame",{Name="BTN_"..name,BackgroundColor3=Theme.Secondary,
        BackgroundTransparency=0.4,BorderSizePixel=0,
        Size=UDim2.new(1,0,0,38),Parent=tab.content})
    Corner(frame); Stroke(frame)
    New("TextLabel",{FontFace=Font.Medium,TextColor3=Theme.Text,Text=name,
        TextXAlignment=Enum.TextXAlignment.Left,BackgroundTransparency=1,
        Position=UDim2.new(0,10,0.5,-9),TextSize=TS.Normal,
        Size=UDim2.new(1,-60,0,18),Parent=frame})

    local btn=New("TextButton",{FontFace=Font.Medium,TextColor3=Theme.Accent,
        Text="Run",BackgroundColor3=Theme.Tertiary,BackgroundTransparency=0.3,
        BorderSizePixel=0,AnchorPoint=Vector2.new(1,0.5),
        Position=UDim2.new(1,-10,0.5,0),Size=UDim2.new(0,44,0,24),
        TextSize=TS.Small,Parent=frame})
    Corner(btn,5); Stroke(btn,Theme.Accent,1,0.6)

    btn.MouseEnter:Connect(function() Tween(btn,{BackgroundTransparency=0,TextColor3=Theme.Text},Anim.Fast) end)
    btn.MouseLeave:Connect(function() Tween(btn,{BackgroundTransparency=0.3,TextColor3=Theme.Accent},Anim.Fast) end)
    btn.MouseButton1Click:Connect(function()
        Tween(btn,{BackgroundTransparency=0.6},Anim.Fast)
        task.delay(0.1,function() Tween(btn,{BackgroundTransparency=0.3},Anim.Fast) end)
        pcall(cb)
    end)

    local sGui=frame:FindFirstAncestorOfClass("ScreenGui")
    if cfg.Tooltip and sGui then MakeTooltip(frame,cfg.Tooltip,sGui) end

    return WrapElement(frame,{ Click=function() pcall(cb) end })
end

-- // ─── Toggle ───────────────────────────────────────────────────────────────
function Library._CreateToggle(tab, cfg)
    Require(cfg,"Name","CreateToggle")
    local lib=tab._library
    local name=cfg.Name or "Toggle"
    local cb=cfg.Callback or function() end
    local state=cfg.Default or false

    local frame=New("Frame",{Name="TG_"..name,BackgroundColor3=Theme.Secondary,
        BackgroundTransparency=0.4,BorderSizePixel=0,
        Size=UDim2.new(1,0,0,38),Parent=tab.content})
    Corner(frame); Stroke(frame)
    New("TextLabel",{FontFace=Font.Medium,TextColor3=Theme.Text,Text=name,
        TextXAlignment=Enum.TextXAlignment.Left,BackgroundTransparency=1,
        Position=UDim2.new(0,10,0.5,-9),TextSize=TS.Normal,
        Size=UDim2.new(1,-60,0,18),Parent=frame})

    local track=New("Frame",{BackgroundColor3=state and Theme.Toggle.Enabled or Theme.Toggle.Disabled,
        AnchorPoint=Vector2.new(1,0.5),Position=UDim2.new(1,-10,0.5,0),
        BorderSizePixel=0,Size=UDim2.new(0,38,0,21),Parent=frame})
    Corner(track,100)
    local circle=New("Frame",{BackgroundColor3=Theme.Toggle.Circle,BorderSizePixel=0,
        AnchorPoint=Vector2.new(0,0.5),
        Position=UDim2.new(0,state and 21 or 4,0.5,0),
        Size=UDim2.new(0,13,0,13),Parent=track})
    Corner(circle,100)

    New("TextButton",{Text="",BackgroundTransparency=1,Size=UDim2.new(1,0,1,0),Parent=frame})
        .MouseButton1Click:Connect(function()
        state=not state
        Tween(track,{BackgroundColor3=state and Theme.Toggle.Enabled or Theme.Toggle.Disabled},Anim.Normal)
        Tween(circle,{Position=UDim2.new(0,state and 21 or 4,0.5,0)},Anim.Normal)
        if lib then lib:_SetFlagInternal(cfg.Flag,state) end
        pcall(cb,state)
    end)

    local sGui=frame:FindFirstAncestorOfClass("ScreenGui")
    if cfg.Tooltip and sGui then MakeTooltip(frame,cfg.Tooltip,sGui) end

    local function SetState(s)
        state=s
        Tween(track,{BackgroundColor3=s and Theme.Toggle.Enabled or Theme.Toggle.Disabled},Anim.Normal)
        Tween(circle,{Position=UDim2.new(0,s and 21 or 4,0.5,0)},Anim.Normal)
        if lib then lib:_SetFlagInternal(cfg.Flag,s) end
        pcall(cb,s)
    end

    if cfg.Flag and lib then
        lib:_RegisterConfig(cfg.Flag,function() return state end,SetState)
        lib:_SetFlagInternal(cfg.Flag,state)
    end

    return WrapElement(frame,{
        SetState =function(_,s) SetState(s); return _ end,
        GetState =function() return state end,
    })
end

-- // ─── Slider (with Step support + realtime popup) ─────────────────────────
function Library._CreateSlider(tab, cfg)
    Require(cfg,"Name","CreateSlider")
    local lib=tab._library
    local name=cfg.Name or "Slider"
    local min =cfg.Min or 0
    local max =cfg.Max or 100
    local step=cfg.Step or 1
    local suf =cfg.Suffix or ""
    local cb  =cfg.Callback or function() end
    local curVal=math.clamp(cfg.Default or min, min, max)
    -- FIX Bug 5: guard against division by zero when min == max
    local range = (max - min) ~= 0 and (max - min) or 1

    local frame=New("Frame",{Name="SL_"..name,BackgroundColor3=Theme.Secondary,
        BackgroundTransparency=0.4,BorderSizePixel=0,
        Size=UDim2.new(1,0,0,52),Parent=tab.content})
    Corner(frame); Stroke(frame)

    New("TextLabel",{FontFace=Font.Medium,TextColor3=Theme.Text,Text=name,
        TextXAlignment=Enum.TextXAlignment.Left,BackgroundTransparency=1,
        Position=UDim2.new(0,10,0,6),TextSize=TS.Normal,
        Size=UDim2.new(0.6,0,0,18),Parent=frame})

    local valLbl=New("TextLabel",{FontFace=Font.Regular,TextColor3=Theme.TextDark,
        Text=tostring(curVal)..suf,TextXAlignment=Enum.TextXAlignment.Right,
        BackgroundTransparency=1,Position=UDim2.new(0.6,0,0,6),
        TextSize=TS.Small,Size=UDim2.new(0.4,-10,0,18),Parent=frame})

    local track=New("Frame",{BackgroundColor3=Theme.Tertiary,BorderSizePixel=0,
        Position=UDim2.new(0,10,0,30),Size=UDim2.new(1,-20,0,6),Parent=frame})
    Corner(track,100)

    local fill=New("Frame",{BackgroundColor3=Theme.Accent,BorderSizePixel=0,
        Size=UDim2.new((curVal-min)/range,0,1,0),Parent=track})
    Corner(fill,100)
    New("UIGradient",{Color=ColorSequence.new({
        ColorSequenceKeypoint.new(0,Theme.AccentDark or Color3.fromRGB(80,65,180)),
        ColorSequenceKeypoint.new(1,Theme.Accent)}),Parent=fill})

    local thumb=New("Frame",{BackgroundColor3=Theme.Toggle.Circle,
        AnchorPoint=Vector2.new(0.5,0.5),
        Position=UDim2.new((curVal-min)/range,0,0.5,0),
        Size=UDim2.new(0,12,0,12),BorderSizePixel=0,ZIndex=2,Parent=track})
    Corner(thumb,100); Stroke(thumb,Theme.Accent,1)

    -- Popup bubble
    local popup=New("Frame",{BackgroundColor3=Color3.fromRGB(18,18,24),
        AnchorPoint=Vector2.new(0.5,1),
        Position=UDim2.new((curVal-min)/range,0,-0.5,0),
        Size=UDim2.new(0,38,0,20),Visible=false,ZIndex=50,BorderSizePixel=0,Parent=track})
    Corner(popup,4); Stroke(popup,Theme.BorderLight,1)
    local popLbl=New("TextLabel",{FontFace=Font.Bold,TextColor3=Theme.Accent,
        Text=tostring(curVal),BackgroundTransparency=1,
        TextSize=TS.Tiny,Size=UDim2.new(1,0,1,0),ZIndex=51,Parent=popup})

    New("TextButton",{Text="",BackgroundTransparency=1,
        Size=UDim2.new(1,0,1,0),ZIndex=3,Parent=frame})

    local dragging=false
    local function Snap(raw)
        local stepped=math.round((raw-min)/step)*step+min
        return math.clamp(stepped,min,max)
    end
    local function SetValue(v)
        v=Snap(v)
        curVal=v
        local t=(v-min)/range  -- FIX Bug 5: use pre-computed `range` (no div/0)
        fill.Size         =UDim2.new(t,0,1,0)
        thumb.Position    =UDim2.new(t,0,0.5,0)
        popup.Position    =UDim2.new(t,0,-0.5,0)
        valLbl.Text       =tostring(v)..suf
        popLbl.Text       =tostring(v)
        if lib then lib:_SetFlagInternal(cfg.Flag,v) end
        pcall(cb,v)
    end
    local function HandleDrag(input)
        local tp=track.AbsolutePosition; local ts3=track.AbsoluteSize
        local rel=(input.Position.X-tp.X)/ts3.X
        SetValue(min+range*math.clamp(rel,0,1))
    end

    local frameBtn=frame:FindFirstChildWhichIsA("TextButton")
    if frameBtn then
        frameBtn.InputBegan:Connect(function(i)
            if i.UserInputType==Enum.UserInputType.MouseButton1
            or i.UserInputType==Enum.UserInputType.Touch then
                dragging=true; popup.Visible=true
                Tween(thumb,{Size=UDim2.new(0,16,0,16)},Anim.Fast); HandleDrag(i)
            end
        end)
    end
    ui.InputChanged:Connect(function(i)
        if dragging and (i.UserInputType==Enum.UserInputType.MouseMovement
        or i.UserInputType==Enum.UserInputType.Touch) then HandleDrag(i) end
    end)
    ui.InputEnded:Connect(function(i)
        if i.UserInputType==Enum.UserInputType.MouseButton1
        or i.UserInputType==Enum.UserInputType.Touch then
            dragging=false; popup.Visible=false
            Tween(thumb,{Size=UDim2.new(0,12,0,12)},Anim.Fast)
        end
    end)

    local sGui=frame:FindFirstAncestorOfClass("ScreenGui")
    if cfg.Tooltip and sGui then MakeTooltip(frame,cfg.Tooltip,sGui) end

    if cfg.Flag and lib then
        lib:_RegisterConfig(cfg.Flag,function() return curVal end,SetValue)
        lib:_SetFlagInternal(cfg.Flag,curVal)
    end

    return WrapElement(frame,{
        SetValue=function(_,v) SetValue(v); return _ end,
        GetValue=function() return curVal end,
    })
end

-- // ─── Progress Bar ─────────────────────────────────────────────────────────
function Library._CreateProgressBar(tab, cfg)
    local name =cfg.Name   or "Progress"
    local min  =cfg.Min    or 0
    local max  =cfg.Max    or 100
    local suf  =cfg.Suffix or "%"
    local color=cfg.Color  or Theme.Accent
    local curVal=math.clamp(cfg.Default or 0,min,max)

    local frame=New("Frame",{Name="PB_"..name,BackgroundColor3=Theme.Secondary,
        BackgroundTransparency=0.4,BorderSizePixel=0,
        Size=UDim2.new(1,0,0,44),Parent=tab.content})
    Corner(frame); Stroke(frame)

    New("TextLabel",{FontFace=Font.Medium,TextColor3=Theme.Text,Text=name,
        TextXAlignment=Enum.TextXAlignment.Left,BackgroundTransparency=1,
        Position=UDim2.new(0,10,0,5),TextSize=TS.Normal,
        Size=UDim2.new(0.7,0,0,18),Parent=frame})
    local valLbl=New("TextLabel",{FontFace=Font.Regular,TextColor3=color,
        Text=tostring(math.floor(curVal))..suf,TextXAlignment=Enum.TextXAlignment.Right,
        BackgroundTransparency=1,Position=UDim2.new(0.7,0,0,5),
        TextSize=TS.Small,Size=UDim2.new(0.3,-10,0,18),Parent=frame})

    local track=New("Frame",{BackgroundColor3=Theme.Tertiary,BorderSizePixel=0,
        Position=UDim2.new(0,10,0,28),Size=UDim2.new(1,-20,0,6),Parent=frame})
    Corner(track,100)
    local fill=New("Frame",{BackgroundColor3=color,BorderSizePixel=0,
        Size=UDim2.new((curVal-min)/(max-min),0,1,0),Parent=track})
    Corner(fill,100)

    local function SetValue(v)
        v=math.clamp(v,min,max); curVal=v
        local t=(v-min)/(max-min)
        Tween(fill,{Size=UDim2.new(t,0,1,0)},Anim.Normal)
        valLbl.Text=tostring(math.floor(v))..suf
    end

    return WrapElement(frame,{
        SetValue =function(_,v) SetValue(v); return _ end,
        GetValue =function() return curVal end,
        AnimateTo=function(_,v,dur)
            local steps=40; local diff=v-curVal
            for i=1,steps do
                task.wait((dur or 1)/steps); SetValue(curVal+diff/steps)
            end
            return _
        end,
    })
end

-- // ─── Dropdown ─────────────────────────────────────────────────────────────
function Library._CreateDropdown(tab, cfg)
    Require(cfg,"Name","CreateDropdown")
    local lib=tab._library
    local name    =cfg.Name        or "Dropdown"
    local options =cfg.Options     or {}
    local multiSel=cfg.MultiSelect or false
    local maxVis  =cfg.MaxVisible  or 5
    local cb      =cfg.Callback    or function() end
    local expanded=false

    -- selected: string (single) or table of strings (multi)
    local selected
    if multiSel then
        selected = type(cfg.Default)=="table" and cfg.Default or {}
    else
        selected = cfg.Default or (options[1] or "")
    end

    -- ── Outer frame ──────────────────────────────────────────────────────────
    local frameH = multiSel and 48 or 38   -- taller when multi to show pills
    local frame=New("Frame",{Name="DD_"..name,BackgroundColor3=Theme.Secondary,
        BackgroundTransparency=0.4,BorderSizePixel=0,
        Size=UDim2.new(1,0,0,frameH),ZIndex=1,Parent=tab.content})
    Corner(frame); Stroke(frame)

    New("TextLabel",{FontFace=Font.Medium,TextColor3=Theme.Text,Text=name,
        TextXAlignment=Enum.TextXAlignment.Left,BackgroundTransparency=1,
        Position=UDim2.new(0,10,0,0),Size=UDim2.new(0.45,0,0,frameH),
        TextSize=TS.Normal,Parent=frame})

    -- ── Selection display box ─────────────────────────────────────────────────
    local selDisp=New("Frame",{BackgroundColor3=Theme.Tertiary,BackgroundTransparency=0.1,
        AnchorPoint=Vector2.new(1,0.5),Position=UDim2.new(1,-10,0.5,0),
        BorderSizePixel=0,Size=UDim2.new(0,138,0,multiSel and 36 or 24),ZIndex=2,Parent=frame})
    Corner(selDisp,5); Stroke(selDisp)

    -- Single mode: plain text label
    local selLbl = nil
    -- Multi mode: scrolling pills row + count badge
    local pillsScroll, countBadge = nil, nil

    if not multiSel then
        selLbl=New("TextLabel",{FontFace=Font.Regular,TextColor3=Theme.Text,
            Text=tostring(selected),TextXAlignment=Enum.TextXAlignment.Left,
            BackgroundTransparency=1,TextSize=TS.Small,
            TextTruncate=Enum.TextTruncate.AtEnd,
            Position=UDim2.new(0,6,0,0),Size=UDim2.new(1,-20,1,0),
            ZIndex=2,Parent=selDisp})
    else
        -- Pills container (horizontal scroll)
        pillsScroll=New("ScrollingFrame",{
            BackgroundTransparency=1,BorderSizePixel=0,
            Position=UDim2.new(0,4,0,4),
            Size=UDim2.new(1,-24,1,-8),
            CanvasSize=UDim2.new(0,0,0,0),
            AutomaticCanvasSize=Enum.AutomaticSize.X,
            ScrollBarThickness=0,
            ScrollingDirection=Enum.ScrollingDirection.X,
            ZIndex=2,Parent=selDisp})
        New("UIListLayout",{
            FillDirection=Enum.FillDirection.Horizontal,
            Padding=UDim.new(0,3),
            SortOrder=Enum.SortOrder.LayoutOrder,
            VerticalAlignment=Enum.VerticalAlignment.Center,
            Parent=pillsScroll})
        -- Count badge (shown when pills overflow)
        countBadge=New("TextLabel",{FontFace=Font.Bold,TextColor3=Theme.Accent,
            Text="",BackgroundTransparency=1,TextSize=TS.Tiny,
            AnchorPoint=Vector2.new(1,0.5),
            Position=UDim2.new(1,-2,0.5,0),
            Size=UDim2.new(0,18,0,18),
            ZIndex=3,Parent=selDisp})
    end

    local arrow=New("ImageLabel",{BackgroundTransparency=1,
        Image="rbxassetid://105558791071013",ImageColor3=Theme.TextDark,Rotation=0,
        AnchorPoint=Vector2.new(1,0.5),Position=UDim2.new(1,-4,0.5,0),
        Size=UDim2.new(0,10,0,10),ZIndex=3,Parent=selDisp})

    -- ── Rebuild pills (multi only) ────────────────────────────────────────────
    local function RebuildPills()
        if not multiSel or not pillsScroll then return end
        for _,c in ipairs(pillsScroll:GetChildren()) do
            if not c:IsA("UIListLayout") then c:Destroy() end
        end
        if #selected == 0 then
            local ph=New("TextLabel",{FontFace=Font.Regular,TextColor3=Theme.TextDark,
                Text="None",BackgroundTransparency=1,TextSize=TS.Small,
                Size=UDim2.new(0,30,1,0),ZIndex=2,Parent=pillsScroll})
        else
            for _,item in ipairs(selected) do
                local pill=New("Frame",{BackgroundColor3=Theme.Accent,
                    BackgroundTransparency=0.7,BorderSizePixel=0,
                    AutomaticSize=Enum.AutomaticSize.X,
                    Size=UDim2.new(0,0,0,18),ZIndex=2,Parent=pillsScroll})
                Corner(pill,4); Padding(pill,0,0,5,5)
                New("TextLabel",{FontFace=Font.Medium,TextColor3=Theme.Text,
                    Text=item,BackgroundTransparency=1,TextSize=9,
                    AutomaticSize=Enum.AutomaticSize.X,
                    Size=UDim2.new(0,0,1,0),ZIndex=3,Parent=pill})
            end
        end
        -- FIX Bug 3: countBadge is only created in multiSel mode; guard nil access
        if countBadge then
            countBadge.Text = #selected > 0 and tostring(#selected) or ""
        end
    end

    -- ── Options dropdown panel ────────────────────────────────────────────────
    local optRowH = multiSel and 28 or 30
    local headerH = multiSel and 28 or 0   -- "Select All / Clear" header
    local opH = math.min(#options, maxVis) * optRowH + headerH

    local optsCont=New("Frame",{BackgroundColor3=Theme.Secondary,BorderSizePixel=0,
        AnchorPoint=Vector2.new(1,0),Position=UDim2.new(1,-10,1,4),
        Size=UDim2.new(0,138,0,opH),Visible=false,ZIndex=100,
        ClipsDescendants=true,Parent=frame})
    Corner(optsCont,6); Stroke(optsCont)

    -- Multi: Select All / Clear header bar
    local optBodyOffset = 0
    if multiSel then
        optBodyOffset = headerH
        local hdr=New("Frame",{BackgroundColor3=Theme.Tertiary,BackgroundTransparency=0.5,
            BorderSizePixel=0,Size=UDim2.new(1,0,0,headerH),ZIndex=101,Parent=optsCont})

        local allBtn=New("TextButton",{FontFace=Font.Medium,Text="All",
            TextColor3=Theme.Accent,BackgroundTransparency=1,BorderSizePixel=0,
            TextSize=TS.Tiny,Size=UDim2.new(0.5,0,1,0),ZIndex=102,Parent=hdr})
        local clrBtn=New("TextButton",{FontFace=Font.Medium,Text="Clear",
            TextColor3=Theme.TextDark,BackgroundTransparency=1,BorderSizePixel=0,
            TextSize=TS.Tiny,Position=UDim2.new(0.5,0,0,0),
            Size=UDim2.new(0.5,0,1,0),ZIndex=102,Parent=hdr})

        New("Frame",{BackgroundColor3=Theme.Border,BorderSizePixel=0,
            Position=UDim2.new(0.5,0,0.1,0),Size=UDim2.new(0,1,0.8,0),
            ZIndex=102,Parent=hdr})

        allBtn.MouseButton1Click:Connect(function()
            selected={}
            for _,o in ipairs(options) do table.insert(selected,o) end
            RebuildPills()
            -- refresh checkboxes
            for _,c in ipairs(optsCont:GetChildren()) do
                if c.Name=="OptRow" then
                    local chk=c:FindFirstChild("Chk")
                    if chk then chk.BackgroundColor3=Theme.Accent; chk.BackgroundTransparency=0 end
                    local chkMark=chk and chk:FindFirstChild("Mark")
                    if chkMark then chkMark.Visible=true end
                end
            end
            if lib then lib:_SetFlagInternal(cfg.Flag,selected) end; cb(selected)
        end)
        clrBtn.MouseButton1Click:Connect(function()
            selected={}
            RebuildPills()
            for _,c in ipairs(optsCont:GetChildren()) do
                if c.Name=="OptRow" then
                    local chk=c:FindFirstChild("Chk")
                    if chk then chk.BackgroundColor3=Theme.Tertiary; chk.BackgroundTransparency=0.1 end
                    local chkMark=chk and chk:FindFirstChild("Mark")
                    if chkMark then chkMark.Visible=false end
                end
            end
            if lib then lib:_SetFlagInternal(cfg.Flag,selected) end; cb(selected)
        end)

        -- divider under header
        New("Frame",{BackgroundColor3=Theme.Border,BorderSizePixel=0,
            Position=UDim2.new(0,0,0,headerH-1),Size=UDim2.new(1,0,0,1),
            ZIndex=101,Parent=optsCont})
    end

    local optsScroll=New("ScrollingFrame",{BackgroundTransparency=1,BorderSizePixel=0,
        Position=UDim2.new(0,0,0,optBodyOffset),
        Size=UDim2.new(1,0,1,-optBodyOffset),
        CanvasSize=UDim2.new(0,0,0,#options*optRowH),
        ScrollBarThickness=3,ScrollBarImageColor3=Color3.fromRGB(60,60,72),
        ZIndex=100,Parent=optsCont})
    List(optsScroll,0)

    -- ── Build option rows ─────────────────────────────────────────────────────
    local optRows = {}  -- {row, chk, chkMark} per option for refresh

    local function IsSelected(opt)
        if multiSel then return table.find(selected,opt)~=nil
        else return selected==opt end
    end

    local function MakeOpt(opt)
        local ob=New("Frame",{Name="OptRow",BackgroundTransparency=1,BorderSizePixel=0,
            Size=UDim2.new(1,0,0,optRowH),ZIndex=100,Parent=optsScroll})

        local btn=New("TextButton",{Text="",BackgroundTransparency=1,BorderSizePixel=0,
            Size=UDim2.new(1,0,1,0),ZIndex=101,Parent=ob})

        -- Checkbox (multi only)
        local chk, chkMark = nil, nil
        if multiSel then
            local isSel = IsSelected(opt)
            chk=New("Frame",{Name="Chk",
                BackgroundColor3=isSel and Theme.Accent or Theme.Tertiary,
                BackgroundTransparency=isSel and 0 or 0.1,
                BorderSizePixel=0,
                AnchorPoint=Vector2.new(0,0.5),
                Position=UDim2.new(0,8,0.5,0),
                Size=UDim2.new(0,12,0,12),ZIndex=102,Parent=ob})
            Corner(chk,3)
            Stroke(chk, isSel and Theme.Accent or Theme.Border, 1)
            chkMark=New("TextLabel",{Text="✓",FontFace=Font.Bold,
                TextColor3=Color3.new(1,1,1),BackgroundTransparency=1,
                TextSize=9,Size=UDim2.new(1,0,1,0),Visible=isSel,
                ZIndex=103,Parent=chk})
        end

        -- Label
        local xOff = multiSel and 26 or 8
        local lbl=New("TextLabel",{FontFace=Font.Regular,
            TextColor3=IsSelected(opt) and Theme.Accent or Theme.Text,
            Text=opt,BackgroundTransparency=1,BorderSizePixel=0,
            TextXAlignment=Enum.TextXAlignment.Left,TextSize=TS.Small,
            Position=UDim2.new(0,xOff,0,0),Size=UDim2.new(1,-(xOff+4),1,0),
            TextTruncate=Enum.TextTruncate.AtEnd,
            ZIndex=102,Parent=ob})

        -- Hover
        btn.MouseEnter:Connect(function()
            Tween(ob,{BackgroundTransparency=0.7},Anim.Fast)
            ob.BackgroundColor3=Theme.Border
        end)
        btn.MouseLeave:Connect(function()
            Tween(ob,{BackgroundTransparency=1},Anim.Fast)
        end)

        btn.MouseButton1Click:Connect(function()
            if multiSel then
                local idx=table.find(selected,opt)
                if idx then
                    table.remove(selected,idx)
                    if chk then
                        Tween(chk,{BackgroundColor3=Theme.Tertiary,BackgroundTransparency=0.1},Anim.Fast)
                        Stroke(chk,Theme.Border,1)
                        if chkMark then chkMark.Visible=false end
                    end
                    Tween(lbl,{TextColor3=Theme.Text},Anim.Fast)
                else
                    table.insert(selected,opt)
                    if chk then
                        Tween(chk,{BackgroundColor3=Theme.Accent,BackgroundTransparency=0},Anim.Fast)
                        Stroke(chk,Theme.Accent,1)
                        if chkMark then chkMark.Visible=true end
                    end
                    Tween(lbl,{TextColor3=Theme.Accent},Anim.Fast)
                end
                RebuildPills()
                if lib then lib:_SetFlagInternal(cfg.Flag,selected) end; cb(selected)
            else
                -- deselect old
                for _,r in ipairs(optRows) do
                    if r.lbl then Tween(r.lbl,{TextColor3=Theme.Text},Anim.Fast) end
                    if r.row then Tween(r.row,{BackgroundTransparency=1},Anim.Fast) end
                end
                selected=opt
                Tween(lbl,{TextColor3=Theme.Accent},Anim.Fast)
                if selLbl then selLbl.Text=opt end
                expanded=false; optsCont.Visible=false
                Tween(arrow,{Rotation=0},Anim.Normal); frame.ZIndex=1
                if lib then lib:_SetFlagInternal(cfg.Flag,selected) end; cb(selected)
            end
        end)

        table.insert(optRows,{row=ob, lbl=lbl, chk=chk, chkMark=chkMark, opt=opt})
    end

    for _,o in ipairs(options) do MakeOpt(o) end
    if multiSel then RebuildPills() end

    -- ── Toggle open/close ─────────────────────────────────────────────────────
    New("TextButton",{Text="",BackgroundTransparency=1,
        Size=UDim2.new(1,0,1,0),ZIndex=3,Parent=selDisp})
        .MouseButton1Click:Connect(function()
        expanded=not expanded; optsCont.Visible=expanded
        Tween(arrow,{Rotation=expanded and 180 or 0},Anim.Normal)
        frame.ZIndex=expanded and 10 or 1
    end)

    local sGui=frame:FindFirstAncestorOfClass("ScreenGui")
    if cfg.Tooltip and sGui then MakeTooltip(frame,cfg.Tooltip,sGui) end

    -- ── SetValue ──────────────────────────────────────────────────────────────
    local function SetValue(v)
        if multiSel and type(v)=="table" then
            selected=v
            -- sync checkboxes
            for _,r in ipairs(optRows) do
                local isSel=table.find(selected,r.opt)~=nil
                if r.chk then
                    r.chk.BackgroundColor3=isSel and Theme.Accent or Theme.Tertiary
                    r.chk.BackgroundTransparency=isSel and 0 or 0.1
                end
                if r.chkMark then r.chkMark.Visible=isSel end
                if r.lbl then r.lbl.TextColor3=isSel and Theme.Accent or Theme.Text end
            end
            RebuildPills()
        elseif not multiSel then
            selected=v
            if selLbl then selLbl.Text=tostring(v) end
            for _,r in ipairs(optRows) do
                if r.lbl then r.lbl.TextColor3=(r.opt==v and Theme.Accent or Theme.Text) end
            end
        end
        if lib then lib:_SetFlagInternal(cfg.Flag,selected) end
        cb(selected)
    end

    if cfg.Flag and lib then
        lib:_RegisterConfig(cfg.Flag,function() return selected end,SetValue)
        lib:_SetFlagInternal(cfg.Flag,selected)
    end

    return WrapElement(frame,{
        SetValue=function(_,v) SetValue(v); return _ end,
        GetValue=function() return selected end,
        Refresh =function(_,newOpts)
            options=newOpts; optRows={}
            for _,c in ipairs(optsScroll:GetChildren()) do
                if c:IsA("Frame") then c:Destroy() end
            end
            for _,o in ipairs(options) do MakeOpt(o) end
            optsScroll.CanvasSize=UDim2.new(0,0,0,#options*optRowH)
            local nH=math.min(#options,maxVis)*optRowH+headerH
            optsCont.Size=UDim2.new(0,138,0,nH)
            if multiSel then RebuildPills() end
            return _
        end,
    })
end

-- // ─── Keybind ──────────────────────────────────────────────────────────────
function Library._CreateKeybind(tab, cfg, lib)
    Require(cfg,"Name","CreateKeybind")
    local name=cfg.Name or "Keybind"
    local cb  =cfg.Callback or function() end
    local curKey=cfg.Default or Enum.KeyCode.F
    local listening=false
    local kbId=name.."_"..tostring(tick())

    local frame=New("Frame",{Name="KB_"..name,BackgroundColor3=Theme.Secondary,
        BackgroundTransparency=0.4,BorderSizePixel=0,
        Size=UDim2.new(1,0,0,38),Parent=tab.content})
    Corner(frame); Stroke(frame)
    New("TextLabel",{FontFace=Font.Medium,TextColor3=Theme.Text,Text=name,
        TextXAlignment=Enum.TextXAlignment.Left,BackgroundTransparency=1,
        Position=UDim2.new(0,10,0.5,-9),TextSize=TS.Normal,
        Size=UDim2.new(0,200,0,18),Parent=frame})

    local kbBox=New("Frame",{BackgroundColor3=Theme.Tertiary,BackgroundTransparency=0.1,
        AnchorPoint=Vector2.new(1,0.5),Position=UDim2.new(1,-10,0.5,0),
        BorderSizePixel=0,Size=UDim2.new(0,54,0,22),Parent=frame})
    Corner(kbBox,5); Stroke(kbBox)
    New("ImageLabel",{BackgroundTransparency=1,Image="rbxassetid://10734896603",
        ImageColor3=Theme.TextDark,AnchorPoint=Vector2.new(0,0.5),
        Position=UDim2.new(0,4,0.5,0),Size=UDim2.new(0,12,0,12),Parent=kbBox})
    local keyLbl=New("TextLabel",{FontFace=Font.Regular,TextColor3=Theme.Text,
        Text=curKey.Name,BackgroundTransparency=1,TextSize=TS.Tiny,
        Position=UDim2.new(0,18,0,0),Size=UDim2.new(1,-22,1,0),
        TextXAlignment=Enum.TextXAlignment.Left,TextTruncate=Enum.TextTruncate.AtEnd,Parent=kbBox})

    if lib then lib._keybinds[kbId]={key=curKey,callback=cb} end

    local function UpdateDisplay()
        if listening then
            keyLbl.Text="…"
            Tween(kbBox,{BackgroundColor3=Theme.AccentDark or Color3.fromRGB(80,65,180)},Anim.Fast)
            Tween(keyLbl,{TextColor3=Theme.Accent},Anim.Fast)
        else
            local dn=curKey.Name
            if #dn>6 then dn=dn:sub(1,5)..".." end
            keyLbl.Text=dn
            Tween(kbBox,{BackgroundColor3=Theme.Tertiary},Anim.Fast)
            Tween(keyLbl,{TextColor3=Theme.Text},Anim.Fast)
        end
    end

    New("TextButton",{Text="",BackgroundTransparency=1,Size=UDim2.new(1,0,1,0),Parent=kbBox})
        .MouseButton1Click:Connect(function() listening=true; UpdateDisplay() end)

    local c=ui.InputBegan:Connect(function(i,gp)
        if listening and not gp and i.UserInputType==Enum.UserInputType.Keyboard then
            curKey=i.KeyCode; listening=false
            if lib then lib._keybinds[kbId].key=curKey end
            if lib then lib:_SetFlagInternal(cfg.Flag,curKey) end
            UpdateDisplay()
        end
    end)
    table.insert(Connections,c)
    UpdateDisplay()

    local sGui=frame:FindFirstAncestorOfClass("ScreenGui")
    if cfg.Tooltip and sGui then MakeTooltip(kbBox,cfg.Tooltip,sGui) end

    if cfg.Flag and lib then
        lib:_RegisterConfig(cfg.Flag,function() return curKey end,function(v)
            curKey=v; if lib then lib._keybinds[kbId].key=v end; UpdateDisplay()
        end)
        lib:_SetFlagInternal(cfg.Flag,curKey)
    end

    return WrapElement(frame,{
        SetKey=function(_,kc)
            curKey=kc
            if lib then lib._keybinds[kbId].key=kc end
            UpdateDisplay(); return _
        end,
        GetKey=function() return curKey end,
    })
end

-- // ─── Color Picker ─────────────────────────────────────────────────────────
function Library._CreateColorPicker(tab, cfg)
    local lib=tab._library
    local name=cfg.Name or "Color"
    local cb  =cfg.Callback or function() end
    local cur =cfg.Default or Color3.fromRGB(124,106,252)
    local h,s,v=cur:ToHSV()
    local expanded=false

    local frame=New("Frame",{Name="CP_"..name,BackgroundColor3=Theme.Secondary,
        BackgroundTransparency=0.4,BorderSizePixel=0,
        Size=UDim2.new(1,0,0,38),Parent=tab.content})
    Corner(frame); Stroke(frame)
    New("TextLabel",{FontFace=Font.Medium,TextColor3=Theme.Text,Text=name,
        TextXAlignment=Enum.TextXAlignment.Left,BackgroundTransparency=1,
        Position=UDim2.new(0,10,0,0),TextSize=TS.Normal,
        Size=UDim2.new(1,-50,1,0),Parent=frame})
    local preview=New("Frame",{BackgroundColor3=cur,Position=UDim2.new(1,-44,0.5,-8),
        Size=UDim2.new(0,34,0,16),ZIndex=2,Parent=frame})
    Corner(preview,4); Stroke(preview)
    local prevBtn=New("TextButton",{Text="",BackgroundTransparency=1,
        Size=UDim2.new(1,0,1,0),ZIndex=3,Parent=preview})

    local sGui=frame:FindFirstAncestorOfClass("ScreenGui")
    local picker=New("Frame",{BackgroundColor3=Color3.fromRGB(18,18,22),BorderSizePixel=0,
        Size=UDim2.new(0,164,0,120),Visible=false,ZIndex=3000,
        Parent=sGui or tab.content})
    Corner(picker,8); Stroke(picker,Theme.Border,1)

    local svPick=New("Frame",{BackgroundColor3=Color3.fromHSV(h,1,1),
        Position=UDim2.new(0,8,0,8),Size=UDim2.new(1,-16,0,88),ZIndex=3001,Parent=picker})
    Corner(svPick,5)
    local wL=New("Frame",{BackgroundColor3=Color3.new(1,1,1),Size=UDim2.new(1,0,1,0),ZIndex=3002,Parent=svPick})
    Corner(wL,5)
    New("UIGradient",{Color=ColorSequence.new(Color3.new(1,1,1)),
        Transparency=NumberSequence.new({NumberSequenceKeypoint.new(0,0),NumberSequenceKeypoint.new(1,1)}),Parent=wL})
    local bL=New("Frame",{BackgroundColor3=Color3.new(0,0,0),Size=UDim2.new(1,0,1,0),ZIndex=3003,Parent=svPick})
    Corner(bL,5)
    New("UIGradient",{Color=ColorSequence.new(Color3.new(0,0,0)),Rotation=90,
        Transparency=NumberSequence.new({NumberSequenceKeypoint.new(0,1),NumberSequenceKeypoint.new(1,0)}),Parent=bL})

    local svC=New("Frame",{BackgroundTransparency=1,AnchorPoint=Vector2.new(0.5,0.5),
        Position=UDim2.new(s,0,1-v,0),Size=UDim2.new(0,10,0,10),ZIndex=3005,Parent=svPick})
    Corner(svC,100); New("UIStroke",{Thickness=1.5,Color=Color3.new(1,1,1),Parent=svC})

    local hueBar=New("Frame",{Position=UDim2.new(0,8,0,102),Size=UDim2.new(1,-16,0,8),ZIndex=3001,Parent=picker})
    Corner(hueBar,100)
    New("UIGradient",{Color=ColorSequence.new({
        ColorSequenceKeypoint.new(0,    Color3.fromHSV(0,1,1)),
        ColorSequenceKeypoint.new(0.167,Color3.fromHSV(0.167,1,1)),
        ColorSequenceKeypoint.new(0.333,Color3.fromHSV(0.333,1,1)),
        ColorSequenceKeypoint.new(0.5,  Color3.fromHSV(0.5,1,1)),
        ColorSequenceKeypoint.new(0.667,Color3.fromHSV(0.667,1,1)),
        ColorSequenceKeypoint.new(0.833,Color3.fromHSV(0.833,1,1)),
        ColorSequenceKeypoint.new(1,    Color3.fromHSV(1,1,1)),
    }),Parent=hueBar})
    local hC=New("Frame",{BackgroundColor3=Color3.new(1,1,1),
        AnchorPoint=Vector2.new(0.5,0.5),Position=UDim2.new(h,0,0.5,0),
        Size=UDim2.new(0,10,0,10),ZIndex=3005,Parent=hueBar})
    Corner(hC,100); New("UIStroke",{Thickness=1,Color=Color3.fromRGB(20,20,28),Parent=hC})

    local function UpdColor()
        cur=Color3.fromHSV(h,s,v)
        preview.BackgroundColor3=cur
        svPick.BackgroundColor3=Color3.fromHSV(h,1,1)
        svC.Position=UDim2.new(s,0,1-v,0)
        hC.Position=UDim2.new(h,0,0.5,0)
        if lib then lib:_SetFlagInternal(cfg.Flag,cur) end
        pcall(cb,cur)
    end

    local svDrag,hDrag=false,false
    local function Handle(i)
        if not picker.Visible then return end
        if svDrag then
            local sz=svPick.AbsoluteSize; local pos=svPick.AbsolutePosition
            s=math.clamp((i.Position.X-pos.X)/sz.X,0,1)
            v=1-math.clamp((i.Position.Y-pos.Y)/sz.Y,0,1)
            UpdColor()
        elseif hDrag then
            local sz=hueBar.AbsoluteSize; local pos=hueBar.AbsolutePosition
            h=math.clamp((i.Position.X-pos.X)/sz.X,0,1); UpdColor()
        end
    end
    svPick.InputBegan:Connect(function(i)
        if i.UserInputType==Enum.UserInputType.MouseButton1 then svDrag=true; Handle(i) end
    end)
    hueBar.InputBegan:Connect(function(i)
        if i.UserInputType==Enum.UserInputType.MouseButton1 then hDrag=true; Handle(i) end
    end)
    ui.InputChanged:Connect(function(i)
        if i.UserInputType==Enum.UserInputType.MouseMovement then Handle(i) end
    end)
    ui.InputEnded:Connect(function(i)
        if i.UserInputType==Enum.UserInputType.MouseButton1 then svDrag=false; hDrag=false end
    end)

    local function Close()
        picker.Visible=false; expanded=false
        if Library.ActivePicker==Close then Library.ActivePicker=nil end
    end
    prevBtn.MouseButton1Click:Connect(function()
        if expanded then Close(); return end
        if Library.ActivePicker then Library.ActivePicker() end
        Library.ActivePicker=Close
        local bp=preview.AbsolutePosition
        local vp2=workspace.CurrentCamera.ViewportSize
        picker.Position=UDim2.new(0,math.max(0,bp.X-174),0,math.clamp(bp.Y,0,vp2.Y-130))
        picker.Visible=true; expanded=true
    end)

    if cfg.Flag and lib then
        lib:_RegisterConfig(cfg.Flag,function() return cur end,function(col)
            cur=col; h,s,v=col:ToHSV(); UpdColor()
        end)
        lib:_SetFlagInternal(cfg.Flag,cur)
    end

    return WrapElement(frame,{
        SetColor=function(_,col) cur=col; h,s,v=col:ToHSV(); UpdColor(); return _ end,
        GetColor=function() return cur end,
    })
end

-- // ─── TextBox ──────────────────────────────────────────────────────────────
function Library._CreateTextBox(tab, cfg)
    local lib=tab._library
    local name=cfg.Name or "TextBox"
    local cb  =cfg.Callback or function() end
    local curText=cfg.Default or ""

    local frame=New("Frame",{Name="TB_"..name,BackgroundColor3=Theme.Secondary,
        BackgroundTransparency=0.4,BorderSizePixel=0,
        Size=UDim2.new(1,0,0,38),Parent=tab.content})
    Corner(frame); Stroke(frame)
    New("TextLabel",{FontFace=Font.Medium,TextColor3=Theme.Text,Text=name,
        TextXAlignment=Enum.TextXAlignment.Left,BackgroundTransparency=1,
        Position=UDim2.new(0,10,0.5,-9),TextSize=TS.Normal,
        Size=UDim2.new(0,150,0,18),Parent=frame})

    local tbC=New("Frame",{BackgroundColor3=Theme.Tertiary,BackgroundTransparency=0.1,
        AnchorPoint=Vector2.new(1,0.5),Position=UDim2.new(1,-10,0.5,0),
        BorderSizePixel=0,Size=UDim2.new(0,155,0,24),Parent=frame})
    Corner(tbC,5)
    local tbS=Stroke(tbC)
    local textBox=New("TextBox",{FontFace=Font.Regular,TextColor3=Theme.Text,
        PlaceholderText=cfg.Placeholder or "...",PlaceholderColor3=Theme.TextDark,
        Text=curText,TextXAlignment=Enum.TextXAlignment.Left,
        TextTruncate=Enum.TextTruncate.AtEnd,BackgroundTransparency=1,
        TextSize=TS.Small,Size=UDim2.new(1,-14,1,0),
        Position=UDim2.new(0,7,0,0),ClearTextOnFocus=cfg.ClearOnFocus or false,Parent=tbC})

    textBox.Focused:Connect(function()
        Tween(tbC,{BackgroundTransparency=0},Anim.Fast)
        Tween(tbS,{Color=Theme.Accent},Anim.Fast)
    end)
    textBox.FocusLost:Connect(function(enter)
        Tween(tbC,{BackgroundTransparency=0.1},Anim.Fast)
        Tween(tbS,{Color=Theme.Border},Anim.Fast)
        if cfg.NumbersOnly then
            local n=tonumber(textBox.Text)
            textBox.Text=n and tostring(n) or curText
        end
        curText=textBox.Text
        if lib then lib:_SetFlagInternal(cfg.Flag,curText) end
        pcall(cb,curText,enter)
    end)
    if cfg.NumbersOnly then
        textBox:GetPropertyChangedSignal("Text"):Connect(function()
            local t=textBox.Text
            local f=t:gsub("[^%d%.%-]","")
            if t~=f then textBox.Text=f end
        end)
    end

    local sGui=frame:FindFirstAncestorOfClass("ScreenGui")
    if cfg.Tooltip and sGui then MakeTooltip(frame,cfg.Tooltip,sGui) end

    if cfg.Flag and lib then
        lib:_RegisterConfig(cfg.Flag,function() return curText end,function(v)
            curText=tostring(v); textBox.Text=curText
        end)
        lib:_SetFlagInternal(cfg.Flag,curText)
    end

    return WrapElement(frame,{
        SetText       =function(_,t) curText=tostring(t); textBox.Text=curText; return _ end,
        GetText       =function() return curText end,
        SetPlaceholder=function(_,p) textBox.PlaceholderText=p; return _ end,
        Focus         =function(_) textBox:CaptureFocus(); return _ end,
    })
end

-- // ─── Config Section ───────────────────────────────────────────────────────
function Library._CreateConfigSection(tab)
    local lib=tab._library

    -- ── Configuration ────────────────────────────────────────────────────────
    Library._CreateContentSection(tab, L("Configuration"))

    local nameBox=Library._CreateTextBox(tab,{Name=L("ConfigName"),Default="default",
        Placeholder="config name…",Callback=function(t) lib._currentConfig=t end})
    local drop; drop=Library._CreateDropdown(tab,{Name=L("SelectConfig"),
        Options=lib:GetConfigs(),Default="default",
        Callback=function(sel) nameBox:SetText(sel); lib._currentConfig=sel end})
    Library._CreateButton(tab,{Name=L("Save"),Callback=function()
        local n=nameBox:GetText()
        if n~="" then lib:SaveConfig(n); drop:Refresh(lib:GetConfigs()) end
    end})
    Library._CreateButton(tab,{Name=L("Load"),Callback=function()
        local n=nameBox:GetText(); if n~="" then lib:LoadConfig(n) end
    end})
    Library._CreateButton(tab,{Name=L("Delete"),Tooltip=L("ConfirmDeleteDesc"),
        Callback=function()
            local n=nameBox:GetText()
            if n~="" then
                lib:Confirm({
                    Title=L("ConfirmDelete").." '"..n.."'?",
                    Description=L("ConfirmDeleteDesc"),
                    YesLabel=L("ConfirmDelete"),YesType="Error",
                    OnYes=function()
                        lib:DeleteConfig(n); drop:Refresh(lib:GetConfigs())
                    end,
                })
            end
        end})
    Library._CreateButton(tab,{Name=L("Refresh"),Callback=function()
        drop:Refresh(lib:GetConfigs())
        lib:Notify({Title=L("Refreshed"),Description=L("ConfigListUpdated"),Duration=2,Type="Success"})
    end})
    Library._CreateToggle(tab,{Name=L("AutoSave"),Default=false,
        Tooltip="Saves current config every 30 seconds",
        Callback=function(en) lib:SetAutoSave(en) end})

    -- ── Theme / Accent ────────────────────────────────────────────────────────
    Library._CreateDivider(tab)
    Library._CreateContentSection(tab, L("Theme"))

    local presets={
        {name="Purple", color=Color3.fromRGB(124,106,252)},
        {name="Cyan",   color=Color3.fromRGB(80,210,230)},
        {name="Green",  color=Color3.fromRGB(80,200,120)},
        {name="Red",    color=Color3.fromRGB(240,80,80)},
        {name="Orange", color=Color3.fromRGB(240,160,60)},
        {name="Pink",   color=Color3.fromRGB(240,100,180)},
    }
    local pNames={}; for _,p in ipairs(presets) do table.insert(pNames,p.name) end
    Library._CreateDropdown(tab,{Name=L("AccentPreset"),Options=pNames,Default="Purple",
        Tooltip="Changes the global accent color",
        Callback=function(sel)
            for _,p in ipairs(presets) do
                if p.name==sel then lib:SetAccentColor(p.color); break end
            end
        end})

    -- ── Background Image / GIF ────────────────────────────────────────────────
    Library._CreateDivider(tab)
    Library._CreateContentSection(tab, L("Background"))

    -- Transparency slider (shown above URL box so user sets it before applying)
    local bgTransSlider = Library._CreateSlider(tab,{
        Name="Transparency", Min=0, Max=90, Default=15, Step=5, Suffix="%",
        Tooltip="0 = fully opaque, 90 = nearly invisible",
    })

    local bgUrlBox = Library._CreateTextBox(tab,{
        Name=L("Background"),
        Placeholder="https://... or rbxassetid://...",
        Default="",
        Tooltip="Paste a direct image or GIF URL",
    })

    Library._CreateButton(tab,{Name=L("BgApply"), Callback=function()
        local url  = bgUrlBox:GetText()
        local transp = bgTransSlider:GetValue() / 100
        if url ~= "" then
            lib:SetBackground(url, transp)
            lib:Notify({Title=L("BgApply"), Description="Background applied~", Duration=2, Type="Success"})
        else
            lib:Notify({Title="Error", Description="URL trống!", Duration=2, Type="Error"})
        end
    end})

    Library._CreateButton(tab,{Name=L("BgClear"), Callback=function()
        lib:ClearBackground()
        bgUrlBox:SetText("")
        lib:Notify({Title=L("BgClear"), Description="Background removed :3", Duration=2, Type="Info"})
    end})

    -- ── Font ──────────────────────────────────────────────────────────────────
    Library._CreateDivider(tab)
    Library._CreateContentSection(tab, L("Font"))

    local fontNames={}; for _,f in ipairs(FontRegistry) do table.insert(fontNames,f.name) end
    Library._CreateDropdown(tab,{Name=L("Font"), Options=fontNames, Default=fontNames[1],
        Tooltip="Changes the UI font globally",
        Callback=function(sel) lib:SetFont(sel) end})

    -- ── Language ──────────────────────────────────────────────────────────────
    Library._CreateDivider(tab)
    Library._CreateContentSection(tab, L("Language"))

    local langNames={}; for k in pairs(Languages) do table.insert(langNames,k) end
    table.sort(langNames)
    Library._CreateDropdown(tab,{Name=L("Language"), Options=langNames, Default=CurrentLang,
        Tooltip="Changes UI language",
        Callback=function(sel) lib:SetLanguage(sel) end})

    -- ── Device Info ───────────────────────────────────────────────────────────
    Library._CreateDivider(tab)
    Library._CreateContentSection(tab, L("Device"))
    Library._CreateLabel(tab,{Name="Type",  Value=Device.Detect()})
    Library._CreateLabel(tab,{Name="Size",  Value=tostring(math.floor(workspace.CurrentCamera.ViewportSize.X)).."x"..tostring(math.floor(workspace.CurrentCamera.ViewportSize.Y))})
    Library._CreateLabel(tab,{Name=L("Version"), Value="Zenith Ui v"..Library.Version})

    return {RefreshConfigs=function() drop:Refresh(lib:GetConfigs()) end}
end

return Library
