-- ╔══════════════════════════════════════════════════════════════════════════╗
-- ║                    Zenith UI Library  v5.0.0                           ║
-- ║                                                                        ║
-- ║  New in v5 (merged from Luna Interface Suite):                         ║
-- ║  • Material Icon system  (500+ icons, rbxassetid)                      ║
-- ║  • Lucide icon support  (via GitHub loader)                             ║
-- ║  • Custom icon support  (rbxassetid number)                            ║
-- ║  • Gradient Accent presets  (Nightlight, Solar, Sparkle…)              ║
-- ║  • Kwargify / Merge — safe default-argument merging                    ║
-- ║  • Duplicate UI detection & cleanup on re-inject                       ║
-- ║  • KeySystem  — whitelist / HWID / custom validator                    ║
-- ║  • Loader  — animated loading screen with progress bar                 ║
-- ║  • Enhanced Hide animation (per-element tween, like Luna)              ║
-- ║  • PackColor / UnpackColor — Color3 ↔ table serialization              ║
-- ║  • Notification now accepts Icon + ImageSource fields                  ║
-- ║  • All v4 features retained                                            ║
-- ╚══════════════════════════════════════════════════════════════════════════╝

-- // ─── Services ─────────────────────────────────────────────────────────────
local ts  = game:GetService("TweenService")
local ui  = game:GetService("UserInputService")
local plr = game:GetService("Players")
local lg  = game:GetService("Lighting")
local rs  = game:GetService("RunService")
local hs  = game:GetService("HttpService")
local cg  = game:GetService("CoreGui")
local Player = plr.LocalPlayer

-- // ─── Library Meta ─────────────────────────────────────────────────────────
local Library       = {}
Library.__index     = Library
Library.Version     = "5.0.0"
Library.Name        = "ZenithUi"
Library.Author      = "Zenith Team"
Library.ActivePicker = nil

local Connections   = {}
local NotifQueue    = {}
local NotifContainer = nil

-- // ─── isStudio guard ───────────────────────────────────────────────────────
local isStudio = rs:IsStudio()

-- ┌─────────────────────────────────────────────────────────────────────────┐
-- │  SECTION 1 — ICON SYSTEM  (ported from Luna)                           │
-- └─────────────────────────────────────────────────────────────────────────┘

-- Material Icons: 500+ icons mapped by name → rbxassetid URL
-- Credit: qweery (Material Icons) & Latte Softworks (Lucide)
local MaterialIcons = {
    -- Action
    ["home"]              = "http://www.roblox.com/asset/?id=6026568195",
    ["settings"]          = "http://www.roblox.com/asset/?id=6031280882",
    ["search"]            = "http://www.roblox.com/asset/?id=6031154871",
    ["info"]              = "http://www.roblox.com/asset/?id=6026568227",
    ["help_outline"]      = "http://www.roblox.com/asset/?id=6026568201",
    ["check_circle"]      = "http://www.roblox.com/asset/?id=6023426945",
    ["cancel"]            = "http://www.roblox.com/asset/?id=6031094677",
    ["close"]             = "http://www.roblox.com/asset/?id=6031094678",
    ["delete"]            = "http://www.roblox.com/asset/?id=6022668885",
    ["edit"]              = "http://www.roblox.com/asset/?id=6034328955",
    ["add"]               = "http://www.roblox.com/asset/?id=6035047377",
    ["remove"]            = "http://www.roblox.com/asset/?id=6035067836",
    ["refresh"]           = "http://www.roblox.com/asset/?id=6031097226",
    ["save"]              = "http://www.roblox.com/asset/?id=6035067857",
    ["send"]              = "http://www.roblox.com/asset/?id=6035067832",
    ["share"]             = "http://www.roblox.com/asset/?id=6034230648",
    ["star"]              = "http://www.roblox.com/asset/?id=6031068423",
    ["favorite"]          = "http://www.roblox.com/asset/?id=6023426974",
    ["bookmark"]          = "http://www.roblox.com/asset/?id=6022852108",
    ["lock"]              = "http://www.roblox.com/asset/?id=6026568224",
    ["lock_open"]         = "http://www.roblox.com/asset/?id=6026568220",
    ["visibility"]        = "http://www.roblox.com/asset/?id=6031075931",
    ["visibility_off"]    = "http://www.roblox.com/asset/?id=6031075929",
    ["person"]            = "http://www.roblox.com/asset/?id=6034287594",
    ["people"]            = "http://www.roblox.com/asset/?id=6034287513",
    ["group"]             = "http://www.roblox.com/asset/?id=6034281901",
    ["build"]             = "http://www.roblox.com/asset/?id=6023426938",
    ["code"]              = "http://www.roblox.com/asset/?id=6022668955",
    ["bug_report"]        = "http://www.roblox.com/asset/?id=6022852107",
    ["flag"]              = "http://www.roblox.com/asset/?id=6035053279",
    ["notifications"]     = "http://www.roblox.com/asset/?id=6034308946",
    ["language"]          = "http://www.roblox.com/asset/?id=6026568213",
    ["power_settings_new"]= "http://www.roblox.com/asset/?id=6031260781",
    ["dashboard"]         = "http://www.roblox.com/asset/?id=6022668883",
    ["analytics"]         = "http://www.roblox.com/asset/?id=6022668884",
    ["assessment"]        = "http://www.roblox.com/asset/?id=6022668897",
    ["timeline"]          = "http://www.roblox.com/asset/?id=6031229350",
    ["trending_up"]       = "http://www.roblox.com/asset/?id=6031225816",
    ["trending_down"]     = "http://www.roblox.com/asset/?id=6031225811",
    ["verified"]          = "http://www.roblox.com/asset/?id=6031225809",
    ["security"]          = "http://www.roblox.com/asset/?id=6034837802",
    ["shield"]            = "http://www.roblox.com/asset/?id=6035078889",
    ["vpn_key"]           = "http://www.roblox.com/asset/?id=6035202034",
    ["key"]               = "http://www.roblox.com/asset/?id=6035202034",
    ["fingerprint"]       = "http://www.roblox.com/asset/?id=6023565895",
    ["history"]           = "http://www.roblox.com/asset/?id=6026568197",
    ["schedule"]          = "http://www.roblox.com/asset/?id=6031260808",
    ["today"]             = "http://www.roblox.com/asset/?id=6031229352",
    ["event"]             = "http://www.roblox.com/asset/?id=6023426959",
    ["update"]            = "http://www.roblox.com/asset/?id=6031225810",
    ["upgrade"]           = "http://www.roblox.com/asset/?id=6031225815",
    ["download"]          = "http://www.roblox.com/asset/?id=6031302931",
    ["upload"]            = "http://www.roblox.com/asset/?id=6031302996",
    ["cloud"]             = "http://www.roblox.com/asset/?id=6031302918",
    ["folder"]            = "http://www.roblox.com/asset/?id=6031302932",
    ["file_copy"]         = "http://www.roblox.com/asset/?id=6035053293",
    ["storage"]           = "http://www.roblox.com/asset/?id=6035030083",
    ["memory"]            = "http://www.roblox.com/asset/?id=6034837807",
    ["computer"]          = "http://www.roblox.com/asset/?id=6034789874",
    ["smartphone"]        = "http://www.roblox.com/asset/?id=6034848731",
    ["tablet"]            = "http://www.roblox.com/asset/?id=6034848733",
    ["gamepad"]           = "http://www.roblox.com/asset/?id=6034789879",
    ["mouse"]             = "http://www.roblox.com/asset/?id=6034837797",
    ["keyboard"]          = "http://www.roblox.com/asset/?id=6034818398",
    ["wifi"]              = "http://www.roblox.com/asset/?id=6034461626",
    ["bluetooth"]         = "http://www.roblox.com/asset/?id=6034983880",
    ["volume_up"]         = "http://www.roblox.com/asset/?id=6026671215",
    ["volume_off"]        = "http://www.roblox.com/asset/?id=6026671224",
    ["mic"]               = "http://www.roblox.com/asset/?id=6026660078",
    ["mic_off"]           = "http://www.roblox.com/asset/?id=6026660076",
    ["camera"]            = "http://www.roblox.com/asset/?id=6031572312",
    ["image"]             = "http://www.roblox.com/asset/?id=6034407078",
    ["palette"]           = "http://www.roblox.com/asset/?id=6034316009",
    ["brush"]             = "http://www.roblox.com/asset/?id=6031572320",
    ["color_lens"]        = "http://www.roblox.com/asset/?id=6031625148",
    ["play_arrow"]        = "http://www.roblox.com/asset/?id=6026663699",
    ["pause"]             = "http://www.roblox.com/asset/?id=6026663719",
    ["stop"]              = "http://www.roblox.com/asset/?id=6026681576",
    ["skip_next"]         = "http://www.roblox.com/asset/?id=6026667005",
    ["skip_previous"]     = "http://www.roblox.com/asset/?id=6026667011",
    ["fast_forward"]      = "http://www.roblox.com/asset/?id=6026647902",
    ["fast_rewind"]       = "http://www.roblox.com/asset/?id=6026647942",
    ["shuffle"]           = "http://www.roblox.com/asset/?id=6026667003",
    ["repeat"]            = "http://www.roblox.com/asset/?id=6026666998",
    ["games"]             = "http://www.roblox.com/asset/?id=6026660074",
    ["sports_esports"]    = "http://www.roblox.com/asset/?id=6034227061",
    ["engineering"]       = "http://www.roblox.com/asset/?id=6034281908",
    ["science"]           = "http://www.roblox.com/asset/?id=6034230640",
    ["school"]            = "http://www.roblox.com/asset/?id=6034230641",
    ["book"]              = "http://www.roblox.com/asset/?id=6022860343",
    ["article"]           = "http://www.roblox.com/asset/?id=6022668907",
    ["note"]              = "http://www.roblox.com/asset/?id=6026663734",
    ["list"]              = "http://www.roblox.com/asset/?id=6026568229",
    ["menu"]              = "http://www.roblox.com/asset/?id=6031097225",
    ["more_vert"]         = "http://www.roblox.com/asset/?id=6031104648",
    ["more_horiz"]        = "http://www.roblox.com/asset/?id=6031104650",
    ["fullscreen"]        = "http://www.roblox.com/asset/?id=6031094681",
    ["fullscreen_exit"]   = "http://www.roblox.com/asset/?id=6031094691",
    ["arrow_back"]        = "http://www.roblox.com/asset/?id=6031091000",
    ["arrow_forward"]     = "http://www.roblox.com/asset/?id=6031090995",
    ["arrow_upward"]      = "http://www.roblox.com/asset/?id=6031090997",
    ["arrow_downward"]    = "http://www.roblox.com/asset/?id=6031090991",
    ["chevron_right"]     = "http://www.roblox.com/asset/?id=6031094680",
    ["chevron_left"]      = "http://www.roblox.com/asset/?id=6031094670",
    ["expand_more"]       = "http://www.roblox.com/asset/?id=6031094687",
    ["expand_less"]       = "http://www.roblox.com/asset/?id=6031094679",
    ["check"]             = "http://www.roblox.com/asset/?id=6031094667",
    ["error"]             = "http://www.roblox.com/asset/?id=6031071057",
    ["warning"]           = "http://www.roblox.com/asset/?id=6031071053",
    ["thumb_up"]          = "http://www.roblox.com/asset/?id=6031229347",
    ["thumb_down"]        = "http://www.roblox.com/asset/?id=6031229336",
    ["mood"]              = "http://www.roblox.com/asset/?id=6034295704",
    ["mood_bad"]          = "http://www.roblox.com/asset/?id=6034295706",
    ["emoji_events"]      = "http://www.roblox.com/asset/?id=6034275726",
    ["cake"]              = "http://www.roblox.com/asset/?id=6034295702",
    ["local_fire_department"] = "http://www.roblox.com/asset/?id=6034684949",
    ["whatshot"]          = "http://www.roblox.com/asset/?id=6034287525",
    ["bolt"]              = "http://www.roblox.com/asset/?id=6035047381",
    ["flash_on"]          = "http://www.roblox.com/asset/?id=6034333271",
    ["brightness_high"]   = "http://www.roblox.com/asset/?id=6034989541",
    ["brightness_low"]    = "http://www.roblox.com/asset/?id=6034989542",
    ["auto_fix_high"]     = "http://www.roblox.com/asset/?id=6031360355",
    ["filter_alt"]        = "http://www.roblox.com/asset/?id=6023426984",
    ["sort"]              = "http://www.roblox.com/asset/?id=6035078888",
    ["tune"]              = "http://www.roblox.com/asset/?id=6031734877",
    ["equalizer"]         = "http://www.roblox.com/asset/?id=6026647906",
    ["speed"]             = "http://www.roblox.com/asset/?id=6026681578",
    ["timer"]             = "http://www.roblox.com/asset/?id=6031754564",
    ["alarm"]             = "http://www.roblox.com/asset/?id=6023426910",
    ["map"]               = "http://www.roblox.com/asset/?id=6034684930",
    ["place"]             = "http://www.roblox.com/asset/?id=6034503372",
    ["navigation"]        = "http://www.roblox.com/asset/?id=6034509984",
    ["near_me"]           = "http://www.roblox.com/asset/?id=6034509996",
    ["explore"]           = "http://www.roblox.com/asset/?id=6023426941",
    ["flight"]            = "http://www.roblox.com/asset/?id=6034744030",
    ["directions_run"]    = "http://www.roblox.com/asset/?id=6034754445",
    ["directions_car"]    = "http://www.roblox.com/asset/?id=6034754441",
    ["local_hospital"]    = "http://www.roblox.com/asset/?id=6034684956",
    ["local_police"]      = "http://www.roblox.com/asset/?id=6034513895",
    ["payment"]           = "http://www.roblox.com/asset/?id=6031084751",
    ["monetization_on"]   = "http://www.roblox.com/asset/?id=6034973115",
    ["attach_money"]      = "http://www.roblox.com/asset/?id=6034898098",
    ["shopping_cart"]     = "http://www.roblox.com/asset/?id=6031265976",
    ["store"]             = "http://www.roblox.com/asset/?id=6031265968",
    ["restaurant"]        = "http://www.roblox.com/asset/?id=6034503366",
    ["local_cafe"]        = "http://www.roblox.com/asset/?id=6034687954",
    ["fastfood"]          = "http://www.roblox.com/asset/?id=6034744034",
    ["sports_soccer"]     = "http://www.roblox.com/asset/?id=6034227075",
    ["sports_basketball"] = "http://www.roblox.com/asset/?id=6034230649",
    ["sports_football"]   = "http://www.roblox.com/asset/?id=6034227067",
    ["home_filled"]       = "rbxassetid://9080449299",
    ["sparkle"]           = "rbxassetid://4483362748",
}

-- GetIcon: resolves icon to image URL or asset table
-- source: "Material" (default) | "Custom" | "Lucide"
local function GetIcon(icon, source)
    source = source or "Material"
    if not icon then return nil end

    if source == "Custom" then
        -- icon is a raw asset ID number or string
        return "rbxassetid://" .. tostring(icon)

    elseif source == "Lucide" then
        -- Load Lucide icon sheet from GitHub (network call, cached)
        if isStudio then return "rbxassetid://10723434557" end
        local ok, data = pcall(function()
            return game:HttpGet("https://raw.githubusercontent.com/latte-soft/lucide-roblox/refs/heads/master/lib/Icons.luau")
        end)
        if not ok then return nil end
        local icons = loadstring(data)()
        icon = string.lower(icon):match("^%s*(.-)%s*$")
        local sized = icons["48px"]
        local r = sized and sized[icon]
        if not r then return nil end
        return {
            id              = r[1],
            imageRectSize   = Vector2.new(r[2][1], r[2][2]),
            imageRectOffset = Vector2.new(r[3][1], r[3][2]),
        }

    else -- "Material"
        return MaterialIcons[icon] or nil
    end
end

-- ApplyIconToImageLabel: sets Image (and optional Rect) on an ImageLabel
local function ApplyIconToImageLabel(lbl, icon, source)
    local result = GetIcon(icon, source)
    if not result then return end
    if type(result) == "table" then
        lbl.Image              = "rbxassetid://" .. tostring(result.id)
        lbl.ImageRectSize      = result.imageRectSize
        lbl.ImageRectOffset    = result.imageRectOffset
    else
        lbl.Image = result
    end
end

-- ┌─────────────────────────────────────────────────────────────────────────┐
-- │  SECTION 2 — MERGE / KWARGIFY  (ported from Luna)                      │
-- └─────────────────────────────────────────────────────────────────────────┘

-- Merge(defaults, passed): fills in missing keys from defaults — never overwrites
local function Merge(defaults, passed)
    passed = passed or {}
    for k, v in pairs(defaults) do
        if passed[k] == nil then passed[k] = v end
    end
    return passed
end

-- PackColor / UnpackColor — Color3 ↔ JSON-safe table
local function PackColor(c)   return { R = c.R * 255, G = c.G * 255, B = c.B * 255 } end
local function UnpackColor(t) return Color3.fromRGB(t.R, t.G, t.B) end

-- ┌─────────────────────────────────────────────────────────────────────────┐
-- │  SECTION 3 — GRADIENT ACCENT PRESETS  (ported from Luna)               │
-- └─────────────────────────────────────────────────────────────────────────┘

local GradientPresets = {
    ["Nightlight (Classic)"] = { Color3.fromRGB(147,255,239), Color3.fromRGB(201,211,233), Color3.fromRGB(255,167,227) },
    ["Nightlight (Neo)"]     = { Color3.fromRGB(117,164,206), Color3.fromRGB(123,201,201), Color3.fromRGB(224,138,175) },
    ["Starlight"]            = { Color3.fromRGB(147,255,239), Color3.fromRGB(181,206,241), Color3.fromRGB(214,158,243) },
    ["Solar"]                = { Color3.fromRGB(242,157,76),  Color3.fromRGB(240,179,81),  Color3.fromRGB(238,201,86)  },
    ["Sparkle"]              = { Color3.fromRGB(199,130,242), Color3.fromRGB(221,130,238), Color3.fromRGB(243,129,233) },
    ["Lime"]                 = { Color3.fromRGB(170,255,127), Color3.fromRGB(163,220,138), Color3.fromRGB(155,185,149) },
    ["Vine"]                 = { Color3.fromRGB(0,191,143),   Color3.fromRGB(0,126,94),    Color3.fromRGB(0,61,46)     },
    ["Cherry"]               = { Color3.fromRGB(148,54,54),   Color3.fromRGB(168,67,70),   Color3.fromRGB(188,80,86)   },
    ["Daylight"]             = { Color3.fromRGB(51,156,255),  Color3.fromRGB(89,171,237),  Color3.fromRGB(127,186,218) },
    ["Blossom"]              = { Color3.fromRGB(255,165,243), Color3.fromRGB(213,129,231), Color3.fromRGB(170,92,218)  },
    ["Mono White"]           = { Color3.fromRGB(255,255,255), Color3.fromRGB(200,200,200), Color3.fromRGB(150,150,150) },
}

-- ┌─────────────────────────────────────────────────────────────────────────┐
-- │  SECTION 4 — DEVICE / SIZES / THEME (unchanged from v4)                │
-- └─────────────────────────────────────────────────────────────────────────┘

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

local Theme = {
    Background  = Color3.fromRGB(0,   0,   0  ),
    Secondary   = Color3.fromRGB(10,  10,  10 ),
    Tertiary    = Color3.fromRGB(18,  18,  18 ),
    Border      = Color3.fromRGB(35,  35,  35 ),
    BorderLight = Color3.fromRGB(55,  55,  55 ),
    Text        = Color3.fromRGB(255, 255, 255),
    TextDark    = Color3.fromRGB(120, 120, 120),
    Accent      = Color3.fromRGB(255, 255, 255),
    AccentDark  = Color3.fromRGB(180, 180, 180),
    Success     = Color3.fromRGB(80,  200, 120),
    Warning     = Color3.fromRGB(240, 180, 50 ),
    Error       = Color3.fromRGB(240, 80,  80 ),
    Info        = Color3.fromRGB(200, 200, 200),
    Toggle = {
        Enabled  = Color3.fromRGB(255, 255, 255),
        Disabled = Color3.fromRGB(30,  30,  30 ),
        Circle   = Color3.fromRGB(0,   0,   0  ),
    },
}

local Size = {}
local function RebuildSize()
    local win = Device.GetWindowSize()
    Size = {
        Window   = win,
        MinWin   = { Width = 340, Height = 280 },
        MaxWin   = { Width = 1200, Height = 800 },
        Toggle   = { Width = 42, Height = 22, Circle = 14 },
        Button   = { Height = 40 },
        Slider   = { Height = 54 },
        Dropdown = { Height = 40, OptionHeight = 32 },
        Notif    = { Width = 270, Height = 72 },
        TextBox  = { Height = 40, InputWidth = 155 },
        Sidebar  = Device.GetSidebarWidth(),
    }
end
RebuildSize()

local _FontConstructor = Font
local Font = {
    Regular = _FontConstructor.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Regular),
    Medium  = _FontConstructor.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Medium),
    Bold    = _FontConstructor.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Bold),
}
local TS = { Title=15, Normal=13, Small=12, Tiny=10 }
local Anim = { Fast=0.1, Normal=0.18, Slow=0.26, VerySlow=0.38 }

-- ┌─────────────────────────────────────────────────────────────────────────┐
-- │  SECTION 5 — LANGUAGE PACKS (unchanged)                                │
-- └─────────────────────────────────────────────────────────────────────────┘

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
        Watermark="Watermark", GradientPreset="Gradient Preset",
        KeyRequired="Key Required", KeyInvalid="Invalid Key",
        KeyValid="Key Accepted", KeyPlaceholder="Enter your key…",
        Verify="Verify", GetKey="Get Key", Loading="Loading",
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
        Watermark="Hình mờ", GradientPreset="Màu gradient",
        KeyRequired="Cần nhập key", KeyInvalid="Key không hợp lệ",
        KeyValid="Key hợp lệ", KeyPlaceholder="Nhập key của bạn…",
        Verify="Xác nhận", GetKey="Lấy key", Loading="Đang tải",
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
        Watermark="ウォーターマーク", GradientPreset="グラデント",
        KeyRequired="キー必要", KeyInvalid="無効なキー",
        KeyValid="キー確認済", KeyPlaceholder="キーを入力…",
        Verify="確認", GetKey="キー取得", Loading="読込中",
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
        Watermark="水印", GradientPreset="渐变预设",
        KeyRequired="需要密钥", KeyInvalid="密钥无效",
        KeyValid="密钥有效", KeyPlaceholder="输入密钥…",
        Verify="验证", GetKey="获取密钥", Loading="加载中",
    },
}
local CurrentLang = "English"
local function L(key) return (Languages[CurrentLang] or Languages.English)[key] or key end

-- ┌─────────────────────────────────────────────────────────────────────────┐
-- │  SECTION 6 — FONT REGISTRY                                             │
-- └─────────────────────────────────────────────────────────────────────────┘

local FontRegistry = {
    { name="Gotham",       regular=Font.Regular, medium=Font.Medium, bold=Font.Bold },
    { name="Ubuntu",       regular=_FontConstructor.new("rbxasset://fonts/families/Ubuntu.json", Enum.FontWeight.Regular), medium=_FontConstructor.new("rbxasset://fonts/families/Ubuntu.json", Enum.FontWeight.Medium), bold=_FontConstructor.new("rbxasset://fonts/families/Ubuntu.json", Enum.FontWeight.Bold) },
    { name="Montserrat",   regular=_FontConstructor.new("rbxasset://fonts/families/Montserrat.json", Enum.FontWeight.Regular), medium=_FontConstructor.new("rbxasset://fonts/families/Montserrat.json", Enum.FontWeight.Medium), bold=_FontConstructor.new("rbxasset://fonts/families/Montserrat.json", Enum.FontWeight.Bold) },
    { name="Source Sans",  regular=_FontConstructor.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Regular), medium=_FontConstructor.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Medium), bold=_FontConstructor.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Bold) },
    { name="Roboto Mono",  regular=_FontConstructor.new("rbxasset://fonts/families/RobotoMono.json", Enum.FontWeight.Regular), medium=_FontConstructor.new("rbxasset://fonts/families/RobotoMono.json", Enum.FontWeight.Medium), bold=_FontConstructor.new("rbxasset://fonts/families/RobotoMono.json", Enum.FontWeight.Bold) },
    { name="Nunito",       regular=_FontConstructor.new("rbxasset://fonts/families/Nunito.json", Enum.FontWeight.Regular), medium=_FontConstructor.new("rbxasset://fonts/families/Nunito.json", Enum.FontWeight.Medium), bold=_FontConstructor.new("rbxasset://fonts/families/Nunito.json", Enum.FontWeight.Bold) },
}
local function ApplyFont(entry)
    Font.Regular = entry.regular; Font.Medium = entry.medium; Font.Bold = entry.bold
end

-- ┌─────────────────────────────────────────────────────────────────────────┐
-- │  SECTION 7 — HELPERS                                                   │
-- └─────────────────────────────────────────────────────────────────────────┘

local function Tween(inst, props, dur, style, dir)
    local t = ts:Create(inst,
        TweenInfo.new(dur or Anim.Normal, style or Enum.EasingStyle.Quint, dir or Enum.EasingDirection.Out), props)
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
    return New("UIStroke", { ApplyStrokeMode=Enum.ApplyStrokeMode.Border,
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

local function Warn(msg, ...) warn(("[Zenith Ui v%s] %s"):format(Library.Version, msg:format(...))) end
local function Require(cfg, field, context)
    if cfg[field] == nil then Warn("Missing '%s' in %s — using default", field, context or "element") end
end

local function Chainable(methods)
    return setmetatable(methods, {
        __index = function(t, k) return rawget(t, k) end,
        __newindex = function(t, k, v) rawset(t, k, v) end,
    })
end

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

local ActiveTooltip = nil
local function MakeTooltip(parent, text, sGui)
    if not text or text=="" then return end
    local tip=New("Frame",{Name="Tooltip",BackgroundColor3=Color3.fromRGB(0,0,0),
        BorderSizePixel=0,AutomaticSize=Enum.AutomaticSize.XY,
        Visible=false,ZIndex=9000,Parent=sGui or parent:FindFirstAncestorOfClass("ScreenGui")})
    Corner(tip,4); Stroke(tip,Theme.BorderLight,1)
    local lbl=New("TextLabel",{FontFace=Font.Regular,TextColor3=Theme.Text,Text=text,
        BackgroundTransparency=1,AutomaticSize=Enum.AutomaticSize.XY,
        TextSize=TS.Tiny,ZIndex=9001,Parent=tip})
    Padding(lbl,4,4,7,7)
    parent.MouseEnter:Connect(function()
        if ActiveTooltip and ActiveTooltip~=tip then ActiveTooltip.Visible=false end
        ActiveTooltip=tip; tip.Visible=true
    end)
    parent.MouseLeave:Connect(function() tip.Visible=false end)
    local c=rs.RenderStepped:Connect(function()
        if not tip.Visible then return end
        local m=ui:GetMouseLocation(); local vp=workspace.CurrentCamera.ViewportSize
        tip.Position=UDim2.new(0,math.min(m.X+14,vp.X-tip.AbsoluteSize.X-4),
                                 0,math.min(m.Y+20,vp.Y-tip.AbsoluteSize.Y-4))
    end)
    table.insert(Connections,c)
end

local function DisconnectAll()
    for _,c in pairs(Connections) do
        if typeof(c)=="RBXScriptConnection" then pcall(function() c:Disconnect() end) end
    end
    Connections={}
end

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

-- ┌─────────────────────────────────────────────────────────────────────────┐
-- │  SECTION 8 — DUPLICATE UI DETECTION  (ported from Luna)                │
-- └─────────────────────────────────────────────────────────────────────────┘

-- HideAndCleanup: smooth hide animation on a stale ScreenGui, then destroy
local function HideAndCleanup(screenGui)
    -- Try to find the main container frame
    local container = screenGui:FindFirstChild("Container") or screenGui:FindFirstChildWhichIsA("Frame")
    if container then
        -- Tween every visible child transparent (Luna-style per-element hide)
        for _, child in ipairs(container:GetDescendants()) do
            if child:IsA("GuiObject") then
                pcall(function()
                    Tween(child, {BackgroundTransparency=1}, 0.2)
                    if child:IsA("TextLabel") or child:IsA("TextButton") then
                        Tween(child, {TextTransparency=1}, 0.2)
                    end
                    if child:IsA("ImageLabel") or child:IsA("ImageButton") then
                        Tween(child, {ImageTransparency=1}, 0.2)
                    end
                end)
            end
        end
        Tween(container, {BackgroundTransparency=1}, 0.25)
        task.delay(0.30, function()
            container.Size = UDim2.new(0,0,0,0)
            task.delay(0.05, function()
                pcall(function() screenGui:Destroy() end)
            end)
        end)
    else
        pcall(function() screenGui:Destroy() end)
    end
end

local function CleanupDuplicates()
    local parent = (gethui and gethui()) or (syn and syn.protect_gui and cg) or cg
    for _, gui in ipairs(parent:GetChildren()) do
        if gui.Name == Library.Name and gui:IsA("ScreenGui") then
            HideAndCleanup(gui)
        end
    end
    -- Also check PlayerGui
    if Player and Player:FindFirstChild("PlayerGui") then
        for _, gui in ipairs(Player.PlayerGui:GetChildren()) do
            if gui.Name == Library.Name and gui:IsA("ScreenGui") then
                HideAndCleanup(gui)
            end
        end
    end
end

-- ParentScreenGui: parent to the safest location based on executor
local function ParentScreenGui(sGui)
    if gethui then
        sGui.Parent = gethui()
    elseif syn and syn.protect_gui then
        syn.protect_gui(sGui)
        sGui.Parent = cg
    elseif not isStudio and cg:FindFirstChild("RobloxGui") then
        sGui.Parent = cg:FindFirstChild("RobloxGui")
    else
        sGui.Parent = Player and Player:FindFirstChild("PlayerGui") or cg
    end
end

-- ┌─────────────────────────────────────────────────────────────────────────┐
-- │  SECTION 9 — LOADER SCREEN                                             │
-- └─────────────────────────────────────────────────────────────────────────┘
--[[
  Usage:
    local loader = Library.Loader({
        Title      = "My Script",
        SubTitle   = "Loading modules…",
        Icon       = "sparkle",
        IconSource = "Material",   -- optional
        Steps      = {
            { Label = "Checking version", Duration = 0.8 },
            { Label = "Loading modules",  Duration = 1.2 },
            { Label = "Starting up",      Duration = 0.6 },
        },
        OnComplete = function() end,  -- called when all steps finish
    })
    -- loader:Destroy() to remove manually
]]

function Library.Loader(cfg)
    cfg = Merge({
        Title      = "Zenith Ui",
        SubTitle   = "Loading…",
        Icon       = "sparkle",
        IconSource = "Material",
        Steps      = {},
        OnComplete = function() end,
    }, cfg)

    CleanupDuplicates()

    local sGui = New("ScreenGui",{
        Name="ZenithLoader", ResetOnSpawn=false, ZIndexBehavior=Enum.ZIndexBehavior.Sibling,
        DisplayOrder=999999999,
    })
    ParentScreenGui(sGui)

    -- Dark overlay
    local overlay = New("Frame",{
        BackgroundColor3=Color3.fromRGB(0,0,0),BackgroundTransparency=0,
        Size=UDim2.new(1,0,1,0), ZIndex=1, Parent=sGui,
    })

    -- Center card
    local card = New("Frame",{
        BackgroundColor3=Color3.fromRGB(6,6,6), BorderSizePixel=0,
        AnchorPoint=Vector2.new(0.5,0.5),
        Position=UDim2.new(0.5,0,0.5,0),
        Size=UDim2.new(0,280,0,180),
        ZIndex=2, Parent=sGui,
    })
    Corner(card,8); Stroke(card,Theme.BorderLight,1)

    -- Gradient top bar
    local gradBar = New("Frame",{
        BackgroundColor3=Theme.Accent, BorderSizePixel=0,
        Size=UDim2.new(1,0,0,2), ZIndex=3, Parent=card,
    })
    local gradPreset = GradientPresets["Nightlight (Neo)"]
    New("UIGradient",{
        Color=ColorSequence.new{
            ColorSequenceKeypoint.new(0, gradPreset[1]),
            ColorSequenceKeypoint.new(0.5, gradPreset[2]),
            ColorSequenceKeypoint.new(1, gradPreset[3]),
        }, Parent=gradBar,
    })

    -- Icon
    local iconLbl = New("ImageLabel",{
        BackgroundTransparency=1, ImageColor3=Theme.Accent,
        AnchorPoint=Vector2.new(0.5,0),
        Position=UDim2.new(0.5,0,0,18),
        Size=UDim2.new(0,28,0,28), ZIndex=3, Parent=card,
    })
    ApplyIconToImageLabel(iconLbl, cfg.Icon, cfg.IconSource)

    -- Title
    New("TextLabel",{
        FontFace=Font.Bold, TextColor3=Theme.Text, Text=cfg.Title,
        BackgroundTransparency=1, TextXAlignment=Enum.TextXAlignment.Center,
        AnchorPoint=Vector2.new(0.5,0), Position=UDim2.new(0.5,0,0,56),
        TextSize=TS.Title, Size=UDim2.new(1,-24,0,18), ZIndex=3, Parent=card,
    })
    -- SubTitle
    local subLbl = New("TextLabel",{
        FontFace=Font.Regular, TextColor3=Theme.TextDark, Text=cfg.SubTitle,
        BackgroundTransparency=1, TextXAlignment=Enum.TextXAlignment.Center,
        AnchorPoint=Vector2.new(0.5,0), Position=UDim2.new(0.5,0,0,78),
        TextSize=TS.Small, Size=UDim2.new(1,-24,0,14), ZIndex=3, Parent=card,
    })

    -- Progress track
    local progTrack = New("Frame",{
        BackgroundColor3=Theme.Tertiary, BorderSizePixel=0,
        AnchorPoint=Vector2.new(0.5,0),
        Position=UDim2.new(0.5,0,0,104),
        Size=UDim2.new(1,-40,0,4), ZIndex=3, Parent=card,
    })
    Corner(progTrack,100)
    local progFill = New("Frame",{
        BackgroundColor3=Theme.Accent, BorderSizePixel=0,
        Size=UDim2.new(0,0,1,0), ZIndex=4, Parent=progTrack,
    })
    Corner(progFill,100)
    -- Gradient on fill
    New("UIGradient",{
        Color=ColorSequence.new{
            ColorSequenceKeypoint.new(0, gradPreset[1]),
            ColorSequenceKeypoint.new(1, gradPreset[3]),
        }, Parent=progFill,
    })

    -- Step label
    local stepLbl = New("TextLabel",{
        FontFace=Font.Regular, TextColor3=Theme.TextDark, Text="",
        BackgroundTransparency=1, TextXAlignment=Enum.TextXAlignment.Center,
        AnchorPoint=Vector2.new(0.5,0), Position=UDim2.new(0.5,0,0,116),
        TextSize=TS.Tiny, Size=UDim2.new(1,-24,0,12), ZIndex=3, Parent=card,
    })

    -- Percent label
    local pctLbl = New("TextLabel",{
        FontFace=Font.Bold, TextColor3=Theme.Accent, Text="0%",
        BackgroundTransparency=1, TextXAlignment=Enum.TextXAlignment.Center,
        AnchorPoint=Vector2.new(0.5,0), Position=UDim2.new(0.5,0,0,136),
        TextSize=TS.Tiny, Size=UDim2.new(1,-24,0,12), ZIndex=3, Parent=card,
    })

    -- Animate card in
    card.BackgroundTransparency = 1
    Tween(card, {BackgroundTransparency=0}, 0.35)

    -- Run steps
    task.spawn(function()
        local nSteps = #cfg.Steps
        if nSteps == 0 then
            -- No steps — instant complete after brief pause
            task.wait(0.8)
            Tween(progFill, {Size=UDim2.new(1,0,1,0)}, 0.4)
            pctLbl.Text = "100%"
            task.wait(0.5)
        else
            for i, step in ipairs(cfg.Steps) do
                stepLbl.Text = step.Label or ""
                local targetScale = i / nSteps
                Tween(progFill, {Size=UDim2.new(targetScale,0,1,0)}, step.Duration or 1, Enum.EasingStyle.Quint)
                -- Animate percent counter
                local prev = (i-1)/nSteps * 100
                local tgt  = targetScale * 100
                local dur  = step.Duration or 1
                local t0   = tick()
                repeat
                    local pct = math.floor(prev + (tgt-prev)*math.min((tick()-t0)/dur,1))
                    pctLbl.Text = tostring(pct).."%"
                    task.wait(1/30)
                until tick()-t0 >= dur
                pctLbl.Text = tostring(math.floor(tgt)).."%"
            end
        end

        -- Fade out
        Tween(overlay, {BackgroundTransparency=1}, 0.4)
        Tween(card, {BackgroundTransparency=1}, 0.35)
        task.wait(0.45)
        pcall(function() sGui:Destroy() end)
        pcall(cfg.OnComplete)
    end)

    return { Destroy = function() pcall(function() sGui:Destroy() end) end }
end

-- ┌─────────────────────────────────────────────────────────────────────────┐
-- │  SECTION 10 — KEY SYSTEM  (new, inspired by Luna)                      │
-- └─────────────────────────────────────────────────────────────────────────┘
--[[
  Usage:
    Library.KeySystem({
        Title       = "My Script",
        SubTitle    = "Enter your access key",
        Icon        = "vpn_key",
        IconSource  = "Material",
        Note        = "Join discord.gg/xxx to get a key",
        GetKeyUrl   = "https://discord.gg/xxx",   -- optional button
        SaveKey     = true,    -- save key to file so user doesn't retype
        SaveFile    = "ZenithKey",
        -- Validator: provide ONE of these:
        Keys        = { "KEY-ABC-123", "KEY-DEF-456" },  -- whitelist
        -- OR:
        ValidateUrl = "https://yoursite.com/validate?key=%s",  -- GET request, expects "true"
        -- OR:
        Validator   = function(key) return key == "mykey" end, -- custom function
        OnSuccess   = function() end,
        OnFail      = function() end,
    })
]]

function Library.KeySystem(cfg)
    cfg = Merge({
        Title       = "Key System",
        SubTitle    = "Enter your access key to continue",
        Icon        = "vpn_key",
        IconSource  = "Material",
        Note        = "",
        GetKeyUrl   = nil,
        SaveKey     = false,
        SaveFile    = "ZenithKey",
        Keys        = nil,
        ValidateUrl = nil,
        Validator   = nil,
        OnSuccess   = function() end,
        OnFail      = function() end,
    }, cfg)

    -- Check saved key first
    if cfg.SaveKey and isfile and isfile(cfg.SaveFile..".txt") then
        local saved = readfile(cfg.SaveFile..".txt")
        local ok = false
        if cfg.Keys and table.find(cfg.Keys, saved) then ok = true
        elseif cfg.Validator then ok = pcall(cfg.Validator, saved) and cfg.Validator(saved)
        elseif cfg.ValidateUrl then
            local r = pcall(function()
                local res = (syn and syn.request or http_request)({
                    Url=cfg.ValidateUrl:format(saved), Method="GET"
                })
                ok = res and res.Body and res.Body:lower():find("true")
            end)
        end
        if ok then pcall(cfg.OnSuccess); return end
    end

    CleanupDuplicates()

    local sGui = New("ScreenGui",{
        Name="ZenithKey", ResetOnSpawn=false, ZIndexBehavior=Enum.ZIndexBehavior.Sibling,
        DisplayOrder=999999998,
    })
    ParentScreenGui(sGui)

    -- Dark overlay
    New("Frame",{
        BackgroundColor3=Color3.fromRGB(0,0,0), BackgroundTransparency=0.3,
        Size=UDim2.new(1,0,1,0), ZIndex=1, Parent=sGui,
    })

    -- Card
    local card = New("Frame",{
        BackgroundColor3=Color3.fromRGB(6,6,6), BorderSizePixel=0,
        AnchorPoint=Vector2.new(0.5,0.5), Position=UDim2.new(0.5,0,0.45,0),
        Size=UDim2.new(0,300,0,0), AutomaticSize=Enum.AutomaticSize.Y,
        ZIndex=2, Parent=sGui,
    })
    Corner(card,8); Stroke(card,Theme.BorderLight,1); Padding(card,20,20,20,20)
    List(card,10)

    -- Gradient top
    local gradBar=New("Frame",{
        BackgroundColor3=Theme.Accent,BorderSizePixel=0,
        Size=UDim2.new(1,40,0,2),Position=UDim2.new(0,-20,0,-20),
        ZIndex=3,Parent=card,
    })
    local gp=GradientPresets["Nightlight (Neo)"]
    New("UIGradient",{Color=ColorSequence.new{
        ColorSequenceKeypoint.new(0,gp[1]),
        ColorSequenceKeypoint.new(0.5,gp[2]),
        ColorSequenceKeypoint.new(1,gp[3]),
    },Parent=gradBar})

    -- Icon row
    local iconRow=New("Frame",{BackgroundTransparency=1,Size=UDim2.new(1,0,0,32),ZIndex=2,Parent=card})
    local iconImg=New("ImageLabel",{BackgroundTransparency=1,ImageColor3=Theme.Accent,
        Size=UDim2.new(0,24,0,24),Position=UDim2.new(0.5,-12,0,0),ZIndex=3,Parent=iconRow})
    ApplyIconToImageLabel(iconImg, cfg.Icon, cfg.IconSource)

    -- Title
    New("TextLabel",{FontFace=Font.Bold,TextColor3=Theme.Text,Text=cfg.Title,
        BackgroundTransparency=1,TextXAlignment=Enum.TextXAlignment.Center,
        TextSize=TS.Title,AutomaticSize=Enum.AutomaticSize.Y,
        Size=UDim2.new(1,0,0,0),ZIndex=3,Parent=card})
    -- SubTitle
    New("TextLabel",{FontFace=Font.Regular,TextColor3=Theme.TextDark,Text=cfg.SubTitle,
        BackgroundTransparency=1,TextXAlignment=Enum.TextXAlignment.Center,
        TextWrapped=true,TextSize=TS.Small,AutomaticSize=Enum.AutomaticSize.Y,
        Size=UDim2.new(1,0,0,0),ZIndex=3,Parent=card})

    -- Input row
    local inputFrame=New("Frame",{BackgroundColor3=Theme.Secondary,BorderSizePixel=0,
        Size=UDim2.new(1,0,0,32),ZIndex=2,Parent=card})
    Corner(inputFrame,5); Stroke(inputFrame,Theme.Border,1)
    local inputStroke=inputFrame:FindFirstChildWhichIsA("UIStroke")
    local inputBox=New("TextBox",{FontFace=Font.Regular,TextColor3=Theme.Text,
        PlaceholderText=L("KeyPlaceholder"),PlaceholderColor3=Theme.TextDark,
        Text="",BackgroundTransparency=1,TextSize=TS.Small,ClearTextOnFocus=false,
        Size=UDim2.new(1,-14,1,0),Position=UDim2.new(0,7,0,0),ZIndex=3,Parent=inputFrame})
    inputBox.Focused:Connect(function()  Tween(inputStroke,{Color=Theme.Accent},Anim.Fast) end)
    inputBox.FocusLost:Connect(function() Tween(inputStroke,{Color=Theme.Border},Anim.Fast) end)

    -- Status label
    local statusLbl=New("TextLabel",{FontFace=Font.Regular,TextColor3=Theme.TextDark,
        Text="",BackgroundTransparency=1,TextXAlignment=Enum.TextXAlignment.Center,
        TextSize=TS.Tiny,AutomaticSize=Enum.AutomaticSize.Y,
        Size=UDim2.new(1,0,0,0),ZIndex=3,Parent=card})

    -- Note
    if cfg.Note and cfg.Note~="" then
        New("TextLabel",{FontFace=Font.Regular,TextColor3=Theme.TextDark,
            Text=cfg.Note,BackgroundTransparency=1,TextXAlignment=Enum.TextXAlignment.Center,
            TextWrapped=true,TextSize=TS.Tiny,AutomaticSize=Enum.AutomaticSize.Y,
            Size=UDim2.new(1,0,0,0),ZIndex=3,Parent=card})
    end

    -- Button row
    local btnRow=New("Frame",{BackgroundTransparency=1,Size=UDim2.new(1,0,0,32),ZIndex=2,Parent=card})
    List(btnRow,8,Enum.SortOrder.LayoutOrder,Enum.FillDirection.Horizontal)

    local function MakeBtn(lbl,color,xSize,cb)
        local b=New("TextButton",{FontFace=Font.Bold,Text=lbl,
            TextColor3=Color3.new(1,1,1),BackgroundColor3=color,BorderSizePixel=0,
            Size=UDim2.new(0,xSize,1,0),ZIndex=3,Parent=btnRow})
        Corner(b,4)
        b.MouseEnter:Connect(function() Tween(b,{BackgroundTransparency=0.2},Anim.Fast) end)
        b.MouseLeave:Connect(function() Tween(b,{BackgroundTransparency=0},Anim.Fast) end)
        b.MouseButton1Click:Connect(cb)
        return b
    end

    -- Verify button
    MakeBtn(L("Verify"), Theme.Accent, cfg.GetKeyUrl and 128 or 260, function()
        local key = inputBox.Text:gsub("^%s+",""):gsub("%s+$","")
        if key=="" then
            statusLbl.Text="⚠  "..L("KeyRequired"); statusLbl.TextColor3=Theme.Warning; return
        end
        statusLbl.Text="..."; statusLbl.TextColor3=Theme.TextDark

        task.spawn(function()
            local valid = false
            if cfg.Keys then
                valid = table.find(cfg.Keys, key) ~= nil
            elseif cfg.Validator then
                valid = pcall(cfg.Validator, key) and cfg.Validator(key)
            elseif cfg.ValidateUrl then
                pcall(function()
                    local req = (syn and syn.request) or (http and http.request) or http_request
                    if req then
                        local res = req({Url=cfg.ValidateUrl:format(key),Method="GET"})
                        valid = res and res.Body and res.Body:lower():find("true") ~= nil
                    end
                end)
            end

            if valid then
                statusLbl.Text="✓  "..L("KeyValid"); statusLbl.TextColor3=Theme.Success
                -- Save key
                if cfg.SaveKey and writefile then
                    pcall(function() writefile(cfg.SaveFile..".txt", key) end)
                end
                task.wait(0.6)
                -- Animate card out
                Tween(card,{BackgroundTransparency=1},0.3)
                task.wait(0.35)
                pcall(function() sGui:Destroy() end)
                pcall(cfg.OnSuccess)
            else
                statusLbl.Text="✗  "..L("KeyInvalid"); statusLbl.TextColor3=Theme.Error
                Tween(inputFrame,{BackgroundColor3=Color3.fromRGB(40,15,15)},Anim.Fast)
                task.delay(0.4,function() Tween(inputFrame,{BackgroundColor3=Theme.Secondary},Anim.Normal) end)
                pcall(cfg.OnFail)
            end
        end)
    end)

    -- GetKey button (optional)
    if cfg.GetKeyUrl then
        MakeBtn(L("GetKey"), Theme.Tertiary, 120, function()
            pcall(function()
                if syn and syn.open_url_in_browser then
                    syn.open_url_in_browser(cfg.GetKeyUrl)
                elseif setclipboard then
                    setclipboard(cfg.GetKeyUrl)
                    statusLbl.Text="URL copied!"; statusLbl.TextColor3=Theme.Info
                end
            end)
        end)
    end

    -- Animate card in
    card.BackgroundTransparency=1
    Tween(card,{BackgroundTransparency=0},0.3,Enum.EasingStyle.Back)

    return { Destroy = function() pcall(function() sGui:Destroy() end) end }
end

-- ┌─────────────────────────────────────────────────────────────────────────┐
-- │  SECTION 11 — ACRYLIC BLUR  (unchanged from v4)                        │
-- └─────────────────────────────────────────────────────────────────────────┘

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
        positions.tl=pos; positions.tr=pos+Vector2.new(sz.X,0); positions.br=pos+sz
    end
    local function Upd()
        if not self._root or not self._enabled then return end
        local tl=VW(positions.tl,dist); local tr=VW(positions.tr,dist); local br=VW(positions.br,dist)
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

-- ┌─────────────────────────────────────────────────────────────────────────┐
-- │  SECTION 12 — NOTIFICATIONS (enhanced: icon + ImageSource fields)      │
-- └─────────────────────────────────────────────────────────────────────────┘

local NotifIcons = {
    Info    = "rbxassetid://10709775704",
    Success = "rbxassetid://10734950586",
    Warning = "rbxassetid://10734918732",
    Error   = "rbxassetid://10734896603",
}

local function EnsureNotifContainer(sGui)
    if NotifContainer and NotifContainer.Parent then return NotifContainer end
    NotifContainer=New("Frame",{
        Name="NotifContainer",BackgroundTransparency=1,
        Position=UDim2.new(1,-276,0,16),
        Size=UDim2.new(0,260,1,-32),
        Parent=sGui,
    })
    New("UIListLayout",{Padding=UDim.new(0,6),SortOrder=Enum.SortOrder.LayoutOrder,
        FillDirection=Enum.FillDirection.Vertical,Parent=NotifContainer})
    return NotifContainer
end

local function FireNotify(sGui, cfg)
    local title    = cfg.Title       or "Notification"
    local desc     = cfg.Description or ""
    local duration = cfg.Duration    or 3
    local nType    = cfg.Type        or "Info"
    local accent   = Theme[nType]    or Theme.Info

    -- Icon: cfg.Icon (name) + cfg.ImageSource (source) OR fallback to type icon
    local iconUrl = NotifIcons[nType] or NotifIcons.Info
    if cfg.Icon then
        local resolved = GetIcon(cfg.Icon, cfg.ImageSource or "Material")
        if resolved and type(resolved)=="string" then iconUrl=resolved end
    end

    EnsureNotifContainer(sGui)

    local wrapper=New("Frame",{Name="NW",BackgroundTransparency=1,
        Size=UDim2.new(1,0,0,Size.Notif.Height+4),ClipsDescendants=false,Parent=NotifContainer})
    local card=New("Frame",{Name="Card",BackgroundColor3=Color3.fromRGB(0,0,0),
        BorderSizePixel=0,Position=UDim2.new(0,Size.Notif.Width+24,0,0),
        Size=UDim2.new(1,0,0,Size.Notif.Height),BackgroundTransparency=1,
        ClipsDescendants=true,Parent=wrapper})
    Corner(card,3)
    local cardStroke=Stroke(card,accent,1,0.3)

    New("Frame",{BackgroundColor3=accent,BorderSizePixel=0,Size=UDim2.new(0,3,1,0),Parent=card})

    local iconFrame=New("Frame",{BackgroundColor3=accent,BackgroundTransparency=0.8,
        BorderSizePixel=0,Position=UDim2.new(0,10,0.5,-11),Size=UDim2.new(0,22,0,22),Parent=card})
    Corner(iconFrame,3)
    local iconImg=New("ImageLabel",{BackgroundTransparency=1,Image=iconUrl,
        ImageColor3=accent,AnchorPoint=Vector2.new(0.5,0.5),
        Position=UDim2.new(0.5,0,0.5,0),Size=UDim2.new(0,14,0,14),Parent=iconFrame})

    -- If icon is a Lucide/table type, apply Rect
    if cfg.Icon then
        local resolved = GetIcon(cfg.Icon, cfg.ImageSource or "Material")
        if type(resolved)=="table" then
            iconImg.Image="rbxassetid://"..tostring(resolved.id)
            iconImg.ImageRectSize=resolved.imageRectSize
            iconImg.ImageRectOffset=resolved.imageRectOffset
        end
    end

    New("TextLabel",{FontFace=Font.Bold,TextColor3=Theme.Text,Text=title,
        BackgroundTransparency=1,TextXAlignment=Enum.TextXAlignment.Left,
        Position=UDim2.new(0,40,0,9),TextSize=TS.Normal,Size=UDim2.new(1,-50,0,15),Parent=card})
    New("TextLabel",{FontFace=Font.Regular,TextColor3=Theme.TextDark,Text=desc,
        BackgroundTransparency=1,TextXAlignment=Enum.TextXAlignment.Left,
        TextWrapped=true,TextTruncate=Enum.TextTruncate.AtEnd,
        Position=UDim2.new(0,40,0,26),TextSize=TS.Small,Size=UDim2.new(1,-50,0,30),Parent=card})

    local timerTrack=New("Frame",{BackgroundColor3=Color3.fromRGB(18,18,18),
        BorderSizePixel=0,Position=UDim2.new(0,0,1,-3),Size=UDim2.new(1,0,0,3),Parent=card})
    local timerFill=New("Frame",{BackgroundColor3=accent,BorderSizePixel=0,
        Size=UDim2.new(1,0,1,0),Parent=timerTrack})
    New("UIGradient",{Color=ColorSequence.new({
        ColorSequenceKeypoint.new(0,Theme.AccentDark or Color3.fromRGB(80,65,180)),
        ColorSequenceKeypoint.new(1,accent),
    }),Parent=timerFill})

    local closeBtn=New("ImageButton",{Image="rbxassetid://119943770201674",
        ImageColor3=Theme.TextDark,BackgroundTransparency=1,
        AnchorPoint=Vector2.new(1,0),Position=UDim2.new(1,-6,0,6),
        Size=UDim2.new(0,12,0,12),Parent=card})

    Tween(card,{Position=UDim2.new(0,0,0,0),BackgroundTransparency=0},0.3,Enum.EasingStyle.Quint)
    Tween(cardStroke,{Transparency=0},0.3)
    Tween(timerFill,{Size=UDim2.new(0,0,1,0)},duration,Enum.EasingStyle.Linear)

    -- Icon pulse
    task.spawn(function()
        task.wait(0.3)
        Tween(iconImg,{Size=UDim2.new(0,18,0,18)},0.12)
        task.wait(0.12)
        Tween(iconImg,{Size=UDim2.new(0,14,0,14)},0.13)
    end)

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
    card.MouseEnter:Connect(function()
        timerFill.Size=UDim2.new(timerFill.Size.X.Scale,0,1,0)
    end)
end

-- ┌─────────────────────────────────────────────────────────────────────────┐
-- │  SECTION 13 — LIBRARY CONSTRUCTOR                                      │
-- └─────────────────────────────────────────────────────────────────────────┘

function Library.new(title, configFolder)
    RebuildSize()
    CleanupDuplicates()  -- NEW: remove any stale UI before building

    local self=setmetatable({},Library)
    self.title          = title        or "Acrylic"
    self.configFolder   = configFolder or title or "Acrylic"
    self._sections      = {}
    self._allTabs       = {}
    self.currentTab     = nil
    self.minimized      = false
    self._visible       = true
    self._originalH     = Size.Window.Height
    self._toggleKey     = Enum.KeyCode.RightControl
    self._keybinds      = {}
    self._flags         = {}
    self._flagListeners = {}
    self._configElems   = {}
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
        Duration=3, Type="Success", Icon="sparkle", ImageSource="Material",
    })
    return self
end

-- ┌─────────────────────────────────────────────────────────────────────────┐
-- │  FLAG SYSTEM, NOTIFICATIONS, CONFIRM DIALOG (unchanged from v4)        │
-- └─────────────────────────────────────────────────────────────────────────┘

function Library:_RegisterConfig(flag,getVal,setVal)
    if not flag then return end
    self._configElems[flag]={getValue=getVal,setValue=setVal}
end
function Library:_SetFlagInternal(flag,value)
    if not flag then return end
    self._flags[flag]=value
    if self._flagListeners[flag] then
        for _,cb in ipairs(self._flagListeners[flag]) do pcall(cb,value) end
    end
end
function Library:GetFlag(flag)
    if self._flags[flag]==nil then Warn("GetFlag: flag '%s' not found",tostring(flag)) end
    return self._flags[flag]
end
function Library:SetFlag(flag,value)
    if self._configElems[flag] then pcall(self._configElems[flag].setValue,value)
    else Warn("SetFlag: flag '%s' not registered",tostring(flag)) end
end
function Library:OnFlagChanged(flag,callback)
    if type(callback)~="function" then Warn("OnFlagChanged: callback must be a function"); return end
    if not self._flagListeners[flag] then self._flagListeners[flag]={} end
    table.insert(self._flagListeners[flag],callback)
end
function Library:Notify(cfg) if self.screenGui then FireNotify(self.screenGui,cfg) end end

function Library:Confirm(cfg)
    local title=cfg.Title or "Are you sure?"
    local desc=cfg.Description or ""
    local onYes=cfg.OnYes or function() end
    local onNo=cfg.OnNo or function() end
    local overlay=New("Frame",{Name="ConfirmOverlay",BackgroundColor3=Color3.new(0,0,0),
        BackgroundTransparency=0.5,Size=UDim2.new(1,0,1,0),ZIndex=5000,Parent=self.screenGui})
    local dialog=New("Frame",{Name="Dialog",BackgroundColor3=Color3.fromRGB(0,0,0),
        BorderSizePixel=0,AnchorPoint=Vector2.new(0.5,0.5),Position=UDim2.new(0.5,0,0.4,0),
        Size=UDim2.new(0,290,0,0),AutomaticSize=Enum.AutomaticSize.Y,ZIndex=5001,Parent=overlay})
    Corner(dialog,4); Stroke(dialog,Theme.BorderLight,1); Padding(dialog,16,16,16,16); List(dialog,10)
    New("TextLabel",{FontFace=Font.Bold,TextColor3=Theme.Text,Text=title,
        BackgroundTransparency=1,TextXAlignment=Enum.TextXAlignment.Left,
        TextSize=TS.Normal,AutomaticSize=Enum.AutomaticSize.Y,Size=UDim2.new(1,0,0,0),ZIndex=5002,Parent=dialog})
    if desc~="" then
        New("TextLabel",{FontFace=Font.Regular,TextColor3=Theme.TextDark,Text=desc,
            BackgroundTransparency=1,TextXAlignment=Enum.TextXAlignment.Left,
            TextWrapped=true,TextSize=TS.Small,AutomaticSize=Enum.AutomaticSize.Y,
            Size=UDim2.new(1,0,0,0),ZIndex=5002,Parent=dialog})
    end
    local btnRow=New("Frame",{BackgroundTransparency=1,Size=UDim2.new(1,0,0,32),ZIndex=5002,Parent=dialog})
    List(btnRow,8,Enum.SortOrder.LayoutOrder,Enum.FillDirection.Horizontal)
    local function MakeBtn(lbl,color,cb)
        local b=New("TextButton",{FontFace=Font.Bold,Text=lbl,TextColor3=Color3.new(1,1,1),
            BackgroundColor3=color,BorderSizePixel=0,AutomaticSize=Enum.AutomaticSize.X,
            Size=UDim2.new(0,0,1,0),ZIndex=5003,Parent=btnRow})
        Corner(b,3); Padding(b,0,0,14,14)
        b.MouseButton1Click:Connect(function() overlay:Destroy(); pcall(cb) end)
        b.MouseEnter:Connect(function() Tween(b,{BackgroundTransparency=0.2},Anim.Fast) end)
        b.MouseLeave:Connect(function() Tween(b,{BackgroundTransparency=0},Anim.Fast) end)
    end
    MakeBtn(cfg.YesLabel or "Confirm", Theme[cfg.YesType or "Error"] or Theme.Error, onYes)
    MakeBtn(cfg.NoLabel  or "Cancel",  Theme.Tertiary, onNo)
    dialog.BackgroundTransparency=1; Tween(dialog,{BackgroundTransparency=0},0.2)
end

-- ┌─────────────────────────────────────────────────────────────────────────┐
-- │  _BUILD, WATERMARK, CONTROLS, CONTENT, RESIZE, MINIMIZE, DESTROY       │
-- │  (unchanged from v4 except using ParentScreenGui)                      │
-- └─────────────────────────────────────────────────────────────────────────┘

function Library:_Build()
    local vp=workspace.CurrentCamera.ViewportSize
    local wx=math.floor((vp.X-Size.Window.Width)/2)
    local wy=math.floor((vp.Y-Size.Window.Height)/2)

    self.screenGui=New("ScreenGui",{Name=Library.Name,ResetOnSpawn=false,
        ZIndexBehavior=Enum.ZIndexBehavior.Sibling,DisplayOrder=100})

    -- NEW: ParentScreenGui handles executor-safe parenting
    ParentScreenGui(self.screenGui)

    self.container=New("Frame",{Name="Container",BackgroundColor3=Theme.Background,
        BorderSizePixel=0,Position=UDim2.new(0,wx,0,wy),
        Size=UDim2.new(0,Size.Window.Width,0,Size.Window.Height),
        ClipsDescendants=false,Parent=self.screenGui})
    Corner(self.container,4); Stroke(self.container,Theme.BorderLight,1)

    self._bgLayer=New("ImageLabel",{Name="BgLayer",BackgroundTransparency=1,
        Image="",ImageTransparency=0.15,ScaleType=Enum.ScaleType.Crop,
        Size=UDim2.new(1,0,1,0),ZIndex=0,Visible=false,Parent=self.container})
    Corner(self._bgLayer,4)

    self.topBar=New("Frame",{Name="TopBar",BackgroundTransparency=1,
        Size=UDim2.new(1,0,0,48),Parent=self.container})

    -- Accent left bar
    New("Frame",{BackgroundColor3=Theme.Accent,BorderSizePixel=0,
        Position=UDim2.new(0,0,0.2,0),Size=UDim2.new(0,2,0.6,0),Parent=self.topBar})

    New("TextLabel",{FontFace=Font.Bold,TextColor3=Theme.Text,Text=self.title,
        BackgroundTransparency=1,TextXAlignment=Enum.TextXAlignment.Left,
        Position=UDim2.new(0,14,0.5,-9),TextSize=TS.Title,
        Size=UDim2.new(0,200,0,18),Parent=self.topBar})

    local vBadge=New("Frame",{BackgroundColor3=Theme.Tertiary,BorderSizePixel=0,
        AnchorPoint=Vector2.new(0,0.5),Position=UDim2.new(0,218,0.5,0),
        AutomaticSize=Enum.AutomaticSize.X,Size=UDim2.new(0,0,0,16),Parent=self.topBar})
    Corner(vBadge,3); Stroke(vBadge,Theme.Border,1)
    local vLbl=New("TextLabel",{FontFace=Font.Regular,TextColor3=Theme.TextDark,
        Text="v"..Library.Version,BackgroundTransparency=1,
        TextXAlignment=Enum.TextXAlignment.Center,TextSize=TS.Tiny,
        AutomaticSize=Enum.AutomaticSize.X,Size=UDim2.new(0,0,1,0),Parent=vBadge})
    Padding(vLbl,0,0,5,5)

    self._deviceBadge=New("TextLabel",{FontFace=Font.Regular,TextColor3=Theme.TextDark,
        Text=self._deviceType,BackgroundTransparency=1,
        TextXAlignment=Enum.TextXAlignment.Left,
        Position=UDim2.new(0,280,0.5,-6),TextSize=TS.Tiny,
        Size=UDim2.new(0,80,0,12),Parent=self.topBar})

    self:_BuildControls()
    New("Frame",{Name="Div",BackgroundColor3=Theme.Border,
        Position=UDim2.new(0,0,0,48),BorderSizePixel=0,
        Size=UDim2.new(1,0,0,1),Parent=self.container})
    self:_BuildContent()
    MakeDraggable(self.container,self.topBar)
    self._acrylicBlur=AcrylicBlur.new(self.container)
    self:_BuildWatermark()
end

function Library:_BuildWatermark()
    local wmText=Library.Name.."  |  "..self.title
    local wm=New("Frame",{Name="Watermark",BackgroundColor3=Color3.fromRGB(0,0,0),
        BackgroundTransparency=0.15,BorderSizePixel=0,AutomaticSize=Enum.AutomaticSize.X,
        Size=UDim2.new(0,0,0,22),AnchorPoint=Vector2.new(0,1),
        Position=UDim2.new(0,10,1,-10),ZIndex=150,Parent=self.screenGui})
    Corner(wm,3); Stroke(wm,Theme.BorderLight,1,0); Padding(wm,0,0,10,10)
    New("Frame",{BackgroundColor3=Theme.Accent,BorderSizePixel=0,
        AnchorPoint=Vector2.new(0,0.5),Size=UDim2.new(0,4,0,4),
        Position=UDim2.new(0,10,0.5,0),ZIndex=151,Parent=wm})
    local wmLabel=New("TextLabel",{FontFace=Font.Medium,TextColor3=Theme.TextDark,
        Text=wmText,BackgroundTransparency=1,TextXAlignment=Enum.TextXAlignment.Left,
        TextSize=TS.Tiny,AutomaticSize=Enum.AutomaticSize.X,
        Size=UDim2.new(0,0,1,0),Position=UDim2.new(0,20,0,0),ZIndex=151,Parent=wm})
    wm.BackgroundTransparency=1; wmLabel.TextTransparency=1
    Tween(wm,{BackgroundTransparency=0.25},0.4); Tween(wmLabel,{TextTransparency=0},0.4)
    self._watermark=wm; self._watermarkLabel=wmLabel; self._watermarkVisible=true
    MakeDraggable(wm,wm)
end
function Library:SetWatermarkText(text)
    if self._watermarkLabel then self._watermarkLabel.Text=tostring(text) end
end
function Library:SetWatermarkVisible(bool)
    if not self._watermark then return end
    self._watermarkVisible=bool
    if bool then
        self._watermark.Visible=true
        Tween(self._watermark,{BackgroundTransparency=0.25},Anim.Normal)
        Tween(self._watermarkLabel,{TextTransparency=0},Anim.Normal)
    else
        Tween(self._watermark,{BackgroundTransparency=1},Anim.Normal)
        Tween(self._watermarkLabel,{TextTransparency=1},Anim.Normal)
        task.delay(Anim.Normal+0.05,function()
            if not self._watermarkVisible and self._watermark then self._watermark.Visible=false end
        end)
    end
end

function Library:_BuildControls()
    local function IconBtn(img,xOff,onClick,hoverC)
        local b=New("ImageButton",{ImageColor3=Theme.TextDark,Image=img,
            BackgroundTransparency=1,AnchorPoint=Vector2.new(1,0.5),
            Position=UDim2.new(1,xOff,0.5,0),Size=UDim2.new(0,14,0,14),Parent=self.topBar})
        b.MouseEnter:Connect(function() Tween(b,{ImageColor3=hoverC or Theme.Text},Anim.Fast) end)
        b.MouseLeave:Connect(function() Tween(b,{ImageColor3=Theme.TextDark},Anim.Fast) end)
        b.MouseButton1Click:Connect(onClick); return b
    end
    IconBtn("rbxassetid://82603981310445",-35,function() self:_ToggleMinimize() end)
    IconBtn("rbxassetid://119943770201674",-12,function() self:Destroy() end,Color3.fromRGB(255,90,90))
    self.resizeBtn=New("ImageButton",{Name="Resize",ImageColor3=Theme.Border,
        Image="rbxassetid://120997033468887",BackgroundTransparency=1,
        AnchorPoint=Vector2.new(0.5,0.5),Position=UDim2.new(1,-5,1,-5),
        Size=UDim2.new(0,60,0,58),Parent=self.container})
    self:_SetupResize(self.resizeBtn)
end

function Library:_BuildContent()
    self.mainContent=New("Frame",{Name="MainContent",BackgroundTransparency=1,
        Position=UDim2.new(0,0,0,49),Size=UDim2.new(1,0,1,-49),
        ClipsDescendants=true,Parent=self.container})
    local searchArea=New("Frame",{BackgroundTransparency=1,Position=UDim2.new(0,0,0,0),
        Size=UDim2.new(0,Size.Sidebar,0,38),Parent=self.mainContent})
    local sb=New("TextBox",{FontFace=Font.Regular,TextColor3=Theme.Text,
        PlaceholderText="search…",PlaceholderColor3=Theme.TextDark,
        Text="",BackgroundColor3=Theme.Secondary,BackgroundTransparency=0,
        BorderSizePixel=0,TextSize=TS.Small,ClearTextOnFocus=false,
        Size=UDim2.new(1,-12,0,24),Position=UDim2.new(0,6,0.5,-12),Parent=searchArea})
    Corner(sb,3); Stroke(sb,Theme.Border,1); Padding(sb,0,0,8,8)
    self.sidebar=New("ScrollingFrame",{Name="Sidebar",ScrollBarThickness=0,
        BackgroundTransparency=1,Position=UDim2.new(0,0,0,38),
        Size=UDim2.new(0,Size.Sidebar,1,-38),CanvasSize=UDim2.new(0,0,0,0),
        AutomaticCanvasSize=Enum.AutomaticSize.Y,ScrollingDirection=Enum.ScrollingDirection.Y,
        Parent=self.mainContent})
    List(self.sidebar,0); Padding(self.sidebar,4,6,6,6)
    self.sidebarSep=New("Frame",{Name="Sep",BackgroundColor3=Theme.Border,
        Position=UDim2.new(0,Size.Sidebar,0,0),BorderSizePixel=0,
        Size=UDim2.new(0,1,1,0),Parent=self.mainContent})
    self.contentFrame=New("ScrollingFrame",{Name="Content",ScrollBarThickness=3,
        ScrollBarImageColor3=Color3.fromRGB(80,80,80),BackgroundTransparency=1,
        Position=UDim2.new(0,Size.Sidebar+1,0,0),Size=UDim2.new(1,-(Size.Sidebar+1),1,0),
        CanvasSize=UDim2.new(0,0,0,0),AutomaticCanvasSize=Enum.AutomaticSize.Y,
        ScrollingDirection=Enum.ScrollingDirection.Y,Parent=self.mainContent})
    List(self.contentFrame,6); Padding(self.contentFrame,12,12,14,14)
    sb:GetPropertyChangedSignal("Text"):Connect(function()
        local q=sb.Text:lower()
        for _,td in ipairs(self._allTabs) do
            if td.frame then td.frame.Visible=(q=="" or td.name:lower():find(q,1,true)~=nil) end
        end
    end)
    sb.Focused:Connect(function()  Tween(sb,{BackgroundColor3=Theme.Tertiary},Anim.Fast) end)
    sb.FocusLost:Connect(function() Tween(sb,{BackgroundColor3=Theme.Secondary},Anim.Fast) end)
end

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

function Library:_ToggleMinimize()
    self.minimized=not self.minimized
    if self.minimized then
        if self._acrylicBlur then self._acrylicBlur:SetEnabled(false) end
        Tween(self.mainContent,{Size=UDim2.new(1,0,0,0)},Anim.Slow)
        Tween(self.container,{Size=UDim2.new(0,self.container.AbsoluteSize.X,0,48)},Anim.Slow)
        if self.resizeBtn then self.resizeBtn.Visible=false end
    else
        if self._acrylicBlur then self._acrylicBlur:SetEnabled(true) end
        Tween(self.container,{Size=UDim2.new(0,self.container.AbsoluteSize.X,0,self._originalH)},Anim.Slow)
        task.delay(0.1,function() Tween(self.mainContent,{Size=UDim2.new(1,0,1,-49)},Anim.Normal) end)
        if self.resizeBtn then self.resizeBtn.Visible=true end
    end
end

-- ── Enhanced Destroy (Luna-style per-element tween before destroy) ──────────
function Library:Destroy()
    if self._autoSave then self:SaveConfig(self._currentConfig) end

    -- Luna-style hide: tween every element transparent first
    if self.container then
        for _, child in ipairs(self.container:GetDescendants()) do
            pcall(function()
                if child:IsA("GuiObject") then
                    Tween(child,{BackgroundTransparency=1},0.2)
                    if child:IsA("TextLabel") or child:IsA("TextButton") then
                        Tween(child,{TextTransparency=1},0.2)
                    end
                    if child:IsA("ImageLabel") or child:IsA("ImageButton") then
                        Tween(child,{ImageTransparency=1},0.2)
                    end
                end
            end)
        end
        Tween(self.container,{BackgroundTransparency=1},0.25)
    end

    task.delay(0.3, function()
        DisconnectAll()
        if self._acrylicBlur then self._acrylicBlur:Destroy() end
        if self._watermark and self._watermark.Parent then self._watermark:Destroy() end
        if self.screenGui and self.screenGui.Parent then self.screenGui:Destroy() end
        if NotifContainer then NotifContainer=nil end
    end)
end

function Library:SetVisible(bool)
    self._visible=bool; self.container.Visible=bool
    if self._watermark then
        self:SetWatermarkVisible(bool and self._watermarkVisible~=false)
    end
end
function Library:SetToggleKey(key) self._toggleKey=key end

function Library:_SetupKeybinds()
    local c=ui.InputBegan:Connect(function(i,gp)
        if gp then return end
        if i.KeyCode==self._toggleKey then self:SetVisible(not self._visible) end
        for _,kb in pairs(self._keybinds) do
            if i.KeyCode==kb.key then pcall(kb.callback) end
        end
    end)
    table.insert(Connections,c)
end

function Library:_SetupMobile()
    if not Device.IsMobile() then return end
    local btn=New("ImageButton",{Name="MobileToggle",Image="rbxassetid://10709775704",
        ImageColor3=Theme.Accent,BackgroundColor3=Theme.Secondary,BackgroundTransparency=0.2,
        Size=UDim2.new(0,44,0,44),Position=UDim2.new(1,-54,0.5,-22),
        ZIndex=200,Parent=self.screenGui})
    Corner(btn,100); Stroke(btn,Theme.Accent,1); Padding(btn,10,10,10,10)
    MakeDraggable(btn,btn)
    btn.MouseButton1Click:Connect(function() self:SetVisible(not self._visible) end)
    self._mobileToggle=btn
end

function Library:_SetupViewportWatch()
    local c=workspace.CurrentCamera:GetPropertyChangedSignal("ViewportSize"):Connect(function()
        local nd=Device.Detect()
        if nd~=self._deviceType then
            self._deviceType=nd; RebuildSize()
            local nw=Device.GetWindowSize()
            Tween(self.container,{Size=UDim2.new(0,nw.Width,0,nw.Height)},Anim.Slow)
            self._originalH=nw.Height
            if self.sidebar     then self.sidebar.Size=UDim2.new(0,Size.Sidebar,1,-38) end
            if self.sidebarSep  then self.sidebarSep.Position=UDim2.new(0,Size.Sidebar,0,0) end
            if self.contentFrame then
                self.contentFrame.Position=UDim2.new(0,Size.Sidebar+1,0,0)
                self.contentFrame.Size=UDim2.new(1,-(Size.Sidebar+1),1,0)
            end
            if self._deviceBadge then self._deviceBadge.Text="["..nd.."]" end
            self:Notify({Title=L("LayoutAdjusted"),Description=L("SwitchedTo").." "..nd,Duration=2,Type="Info"})
        end
    end)
    table.insert(Connections,c)
end

-- ┌─────────────────────────────────────────────────────────────────────────┐
-- │  THEME / GRADIENT / BACKGROUND / FONT / LANGUAGE                       │
-- └─────────────────────────────────────────────────────────────────────────┘

function Library:SetAccentColor(color)
    Theme.Accent=color; Theme.Info=color; Theme.Toggle.Enabled=color
    self:Notify({Title=L("ThemeUpdated"),Description=L("AccentChanged"),Duration=2,Type="Info"})
end

-- NEW: SetAccentGradient — apply a preset gradient to the top accent bar
function Library:SetAccentGradient(presetName)
    local preset=GradientPresets[presetName]
    if not preset then Warn("SetAccentGradient: preset '%s' not found",tostring(presetName)); return end
    -- Apply to topbar accent bar
    local bar=self.topBar and self.topBar:FindFirstChildOfClass("Frame")
    if bar then
        local existing=bar:FindFirstChildOfClass("UIGradient")
        if existing then existing:Destroy() end
        New("UIGradient",{
            Color=ColorSequence.new{
                ColorSequenceKeypoint.new(0,   preset[1]),
                ColorSequenceKeypoint.new(0.5, preset[2]),
                ColorSequenceKeypoint.new(1,   preset[3]),
            }, Parent=bar,
        })
        Theme.Accent=preset[1]
    end
    self:Notify({Title=L("ThemeUpdated"),Description=presetName,Duration=2,Type="Info"})
end

-- GetGradientPresets() — returns table of preset names for dropdown
function Library:GetGradientPresets()
    local names={}
    for k in pairs(GradientPresets) do table.insert(names,k) end
    table.sort(names); return names
end

function Library:SetBackground(url,transparency)
    if not self._bgLayer then return end
    self._bgLayer.Image=url
    self._bgLayer.ImageTransparency=transparency or 0.15
    self._bgLayer.Visible=url~=""
    Tween(self._bgLayer,{ImageTransparency=transparency or 0.15},Anim.Slow)
end
function Library:ClearBackground()
    if not self._bgLayer then return end
    Tween(self._bgLayer,{ImageTransparency=1},Anim.Normal)
    task.delay(Anim.Normal+0.05,function()
        if self._bgLayer then self._bgLayer.Image=""; self._bgLayer.Visible=false end
    end)
end
function Library:SetFont(fontName)
    for _,entry in ipairs(FontRegistry) do
        if entry.name==fontName then
            ApplyFont(entry)
            self:Notify({Title=L("Theme"),Description="Font → "..fontName,Duration=2,Type="Info"})
            return
        end
    end
    Warn("Font '%s' not found in registry",fontName)
end
function Library:SetLanguage(lang)
    if not Languages[lang] then Warn("Language '%s' not found",lang); return end
    CurrentLang=lang
    self:Notify({Title=L("Settings"),Description="Language → "..lang,Duration=2,Type="Info"})
end

-- ┌─────────────────────────────────────────────────────────────────────────┐
-- │  CONFIG SAVE / LOAD (with PackColor/UnpackColor)                        │
-- └─────────────────────────────────────────────────────────────────────────┘

function Library:SaveConfig(name)
    if not writefile then
        return self:Notify({Title="Error",Description="writefile not available",Duration=3,Type="Error"})
    end
    EnsureDir(self.configFolder)
    local data={}
    for flag,e in pairs(self._configElems) do
        local v=e.getValue()
        if typeof(v)=="Color3"   then v=PackColor(v); v._t="Color3" end
        if typeof(v)=="EnumItem" then v={_t="Enum",_e=tostring(v.EnumType),_v=v.Name} end
        data[flag]=v
    end
    local ok=pcall(function()
        writefile(self.configFolder.."/"..name..".json",hs:JSONEncode(data))
    end)
    if ok then self._currentConfig=name; self:Notify({Title=L("Saved"),Description=name,Duration=2,Type="Success"})
    else self:Notify({Title=L("SaveFail"),Description=name,Duration=3,Type="Error"}) end
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
        return self:Notify({Title=L("LoadFail"),Description=name,Duration=3,Type="Error"})
    end
    for flag,v in pairs(data) do
        if self._configElems[flag] then
            if type(v)=="table" and v._t=="Color3"  then v=UnpackColor(v) end
            if type(v)=="table" and v._t=="Enum"    then v=Enum[v._e][v._v] end
            pcall(function() self._configElems[flag].setValue(v) end)
        end
    end
    self._currentConfig=name
    self:Notify({Title=L("Saved"):gsub("Save","Load"),Description=name,Duration=2,Type="Success"})
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

-- ┌─────────────────────────────────────────────────────────────────────────┐
-- │  TAB SYSTEM / SECTIONS  (unchanged from v4, icon now via GetIcon)       │
-- └─────────────────────────────────────────────────────────────────────────┘

function Library:_SelectTab(tab)
    if self.currentTab then
        local p=self.currentTab
        if p.content then p.content.Visible=false end
        Tween(p.button,{BackgroundTransparency=1},Anim.Normal)
        Tween(p.stroke,{Transparency=1},Anim.Normal)
        Tween(p.icon,{ImageColor3=Theme.TextDark},Anim.Normal)
        Tween(p.textLbl,{TextColor3=Theme.TextDark},Anim.Normal)
        Tween(p.accentBar,{BackgroundTransparency=1},Anim.Normal)
    end
    self.currentTab=tab
    if tab.content then tab.content.Visible=true end
    if self.contentFrame then self.contentFrame.CanvasPosition=Vector2.new(0,0) end
    Tween(tab.button,{BackgroundTransparency=0.6},Anim.Normal)
    Tween(tab.stroke,{Transparency=0.6},Anim.Normal)
    Tween(tab.icon,{ImageColor3=Theme.Text},Anim.Normal)
    Tween(tab.textLbl,{TextColor3=Theme.Text},Anim.Normal)
    Tween(tab.accentBar,{BackgroundTransparency=0},Anim.Normal)
end

function Library:CreateSection(name, icon, iconSource)
    local sec={name=name,tabs={},expanded=true,_library=self}
    local secFrame=New("Frame",{Name="Sec_"..name,BackgroundTransparency=1,
        Size=UDim2.new(1,-8,0,0),AutomaticSize=Enum.AutomaticSize.Y,Parent=self.sidebar})
    List(secFrame,2)
    local hdr=New("Frame",{Name="Hdr",BackgroundTransparency=1,Size=UDim2.new(1,0,0,20),LayoutOrder=0,Parent=secFrame})
    local hBtn=New("TextButton",{Text="",BackgroundTransparency=1,Size=UDim2.new(1,0,1,0),Parent=hdr})
    local xOff=6
    if icon and icon~="" then
        local iconLbl=New("ImageLabel",{BackgroundTransparency=1,ImageColor3=Theme.TextDark,
            Position=UDim2.new(0,6,0.5,-5),Size=UDim2.new(0,10,0,10),Parent=hdr})
        ApplyIconToImageLabel(iconLbl,icon,iconSource or "Material")
        xOff=20
    end
    New("TextLabel",{FontFace=Font.Bold,TextColor3=Theme.Border,Text=name:upper(),
        TextXAlignment=Enum.TextXAlignment.Left,BackgroundTransparency=1,
        Position=UDim2.new(0,xOff,0,0),TextSize=TS.Tiny,Size=UDim2.new(1,-22,1,0),Parent=hdr})
    local arrow=New("ImageButton",{Image="rbxassetid://105558791071013",ImageColor3=Theme.TextDark,
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
    hBtn.MouseButton1Click:Connect(Toggle); arrow.MouseButton1Click:Connect(Toggle)
    sec.frame=secFrame; sec.tabsContainer=tabsCont
    table.insert(self._sections,sec)
    local meta=setmetatable({},{__index=sec})
    function meta:CreateTab(n,ico,icosrc,badge) return Library._CreateTab(self,n,ico,icosrc,badge) end
    return meta
end

function Library._CreateTab(section, name, icon, iconSource, badge)
    local lib=section._library
    local tab={name=name,elements={},_library=lib}
    local tf=New("Frame",{Name=name,BackgroundColor3=Theme.Secondary,BackgroundTransparency=1,
        BorderSizePixel=0,Size=UDim2.new(1,0,0,36),Parent=section.tabsContainer})
    Corner(tf,3)
    local ts2=Stroke(tf,Theme.Border,1,1)
    local acBar=New("Frame",{BackgroundColor3=Theme.Accent,
        Position=UDim2.new(0,0,0.1,0),Size=UDim2.new(0,2,0.8,0),
        BackgroundTransparency=1,BorderSizePixel=0,Parent=tf})
    Corner(acBar,1)

    -- Icon: resolve via GetIcon (supports Material/Lucide/Custom)
    local iconL=New("ImageLabel",{BackgroundTransparency=1,
        Image="rbxassetid://112235310154264",ImageColor3=Theme.TextDark,
        AnchorPoint=Vector2.new(0,0.5),Position=UDim2.new(0,14,0.5,0),
        Size=UDim2.new(0,13,0,13),Parent=tf})
    if icon then ApplyIconToImageLabel(iconL,icon,iconSource or "Material") end

    local badgeL=nil
    local textRightPad=12
    if badge then
        badgeL=New("Frame",{BackgroundColor3=Theme.Accent,BackgroundTransparency=0.7,
            AnchorPoint=Vector2.new(1,0.5),Position=UDim2.new(1,-8,0.5,0),
            AutomaticSize=Enum.AutomaticSize.X,Size=UDim2.new(0,0,0,14),Parent=tf})
        Corner(badgeL,100); Padding(badgeL,0,0,4,4)
        New("TextLabel",{FontFace=Font.Bold,TextColor3=Theme.Text,Text=tostring(badge),
            BackgroundTransparency=1,TextSize=8,AutomaticSize=Enum.AutomaticSize.X,
            Size=UDim2.new(0,0,1,0),Parent=badgeL})
        textRightPad=30
    end

    local textL=New("TextLabel",{FontFace=Font.Medium,TextColor3=Theme.TextDark,Text=name,
        TextXAlignment=Enum.TextXAlignment.Left,BackgroundTransparency=1,
        Position=UDim2.new(0,32,0.5,-7),TextSize=TS.Small,
        Size=UDim2.new(1,-(32+textRightPad),0,14),Parent=tf})
    local tabBtn=New("TextButton",{Text="",BackgroundTransparency=1,Size=UDim2.new(1,0,1,0),Parent=tf})
    tabBtn.MouseButton1Click:Connect(function() lib:_SelectTab(tab) end)
    tabBtn.MouseEnter:Connect(function()
        if lib.currentTab~=tab then
            Tween(tf,{BackgroundTransparency=0.8},Anim.Fast)
            Tween(textL,{TextColor3=Theme.AccentDark or Theme.Text},Anim.Fast)
        end
    end)
    tabBtn.MouseLeave:Connect(function()
        if lib.currentTab~=tab then
            Tween(tf,{BackgroundTransparency=1},Anim.Fast)
            Tween(textL,{TextColor3=Theme.TextDark},Anim.Fast)
        end
    end)

    -- Build tab content frame
    tab.content=New("Frame",{Name="TabContent_"..name,BackgroundTransparency=1,
        Size=UDim2.new(1,0,0,0),AutomaticSize=Enum.AutomaticSize.Y,
        Visible=false,Parent=lib.contentFrame})
    List(tab.content,6); Padding(tab.content,0,8,0,0)

    tab.button=tf; tab.stroke=ts2; tab.icon=iconL
    tab.textLbl=textL; tab.accentBar=acBar; tab.badgeL=badgeL; tab.frame=tf
    table.insert(lib._allTabs,tab)
    table.insert(section.tabs,tab)
    if not lib.currentTab then lib:_SelectTab(tab) end

    local meta=setmetatable({},{__index=tab})
    function meta:SetBadge(b)
        if badgeL then badgeL:FindFirstChildWhichIsA("TextLabel").Text=tostring(b); badgeL.Visible=(b~=nil and b~="") end
        return self
    end
    function meta:SetVisible(bool) if tf then tf.Visible=bool end; return self end
    function meta:Clear()
        if tab.content then
            for _,c in ipairs(tab.content:GetChildren()) do
                if not c:IsA("UIListLayout") and not c:IsA("UIPadding") then c:Destroy() end
            end
        end; return self
    end
    -- NEW: SetIcon (change tab icon at runtime using icon system)
    function meta:SetIcon(ico,src) ApplyIconToImageLabel(iconL,ico,src or "Material"); return self end

    function meta:CreateSection(n,ico,src)  return Library._CreateContentSection(self,n,ico,src) end
    function meta:CreateParagraph(c)        return Library._CreateParagraph(self,c) end
    function meta:CreateLabel(c)            return Library._CreateLabel(self,c) end
    function meta:CreateDivider()           return Library._CreateDivider(self) end
    function meta:CreateSlider(c)           return Library._CreateSlider(self,c) end
    function meta:CreateButton(c)           return Library._CreateButton(self,c) end
    function meta:CreateToggle(c)           return Library._CreateToggle(self,c) end
    function meta:CreateDropdown(c)         return Library._CreateDropdown(self,c) end
    function meta:CreateKeybind(c)          return Library._CreateKeybind(self,c,lib) end
    function meta:CreateColorPicker(c)      return Library._CreateColorPicker(self,c) end
    function meta:CreateTextBox(c)          return Library._CreateTextBox(self,c) end
    function meta:CreateProgressBar(c)      return Library._CreateProgressBar(self,c) end
    function meta:CreateConfigSection()     return Library._CreateConfigSection(self) end
    return meta
end

-- ┌─────────────────────────────────────────────────────────────────────────┐
-- │  ELEMENT BASE WRAPPER  (unchanged)                                      │
-- └─────────────────────────────────────────────────────────────────────────┘

local function WrapElement(frame,methods)
    methods=methods or {}
    function methods:SetVisible(bool) if frame then frame.Visible=bool end; return self end
    function methods:Destroy() if frame then frame:Destroy() end; return self end
    return Chainable(methods)
end

-- ┌─────────────────────────────────────────────────────────────────────────┐
-- │  CONTENT SECTION / DIVIDER / LABEL / PARAGRAPH  (unchanged)            │
-- └─────────────────────────────────────────────────────────────────────────┘

function Library._CreateContentSection(tab, name, icon, iconSource)
    local frame=New("Frame",{Name="Sec_"..name,BackgroundTransparency=1,
        Size=UDim2.new(1,0,0,24),Parent=tab.content})
    local xOff=0
    if icon and icon~="" then
        local iconLbl=New("ImageLabel",{BackgroundTransparency=1,ImageColor3=Theme.TextDark,
            Position=UDim2.new(0,0,0.5,-6),Size=UDim2.new(0,12,0,12),Parent=frame})
        ApplyIconToImageLabel(iconLbl,icon,iconSource or "Material")
        xOff=16
    end
    New("Frame",{BackgroundColor3=Theme.Accent,BorderSizePixel=0,
        AnchorPoint=Vector2.new(0,0.5),Position=UDim2.new(0,xOff,0.5,0),
        Size=UDim2.new(0,3,0,3),Parent=frame})
    New("TextLabel",{FontFace=Font.Bold,TextColor3=Theme.TextDark,Text=name:upper(),
        TextXAlignment=Enum.TextXAlignment.Left,BackgroundTransparency=1,
        Position=UDim2.new(0,xOff+8,0,0),TextSize=TS.Tiny,
        Size=UDim2.new(0,120,1,0),Parent=frame})
    New("Frame",{BackgroundColor3=Theme.Border,BorderSizePixel=0,
        Position=UDim2.new(0,xOff+132,0.5,0),Size=UDim2.new(1,-(xOff+136),0,1),Parent=frame})
    return WrapElement(frame)
end

function Library._CreateDivider(tab)
    local frame=New("Frame",{Name="Divider",BackgroundColor3=Theme.Border,
        BorderSizePixel=0,Size=UDim2.new(1,0,0,1),Parent=tab.content})
    return WrapElement(frame)
end

function Library._CreateLabel(tab, cfg)
    Require(cfg,"Name","CreateLabel")
    local frame=New("Frame",{Name="LBL_"..(cfg.Name or "Label"),BackgroundTransparency=1,
        Size=UDim2.new(1,0,0,22),Parent=tab.content})
    New("TextLabel",{FontFace=Font.Medium,TextColor3=Theme.TextDark,Text=cfg.Name or "",
        TextXAlignment=Enum.TextXAlignment.Left,BackgroundTransparency=1,
        Position=UDim2.new(0,0,0,0),TextSize=TS.Small,Size=UDim2.new(0.5,0,1,0),Parent=frame})
    local valLbl=New("TextLabel",{FontFace=Font.Regular,TextColor3=Theme.Text,
        Text=tostring(cfg.Value or ""),TextXAlignment=Enum.TextXAlignment.Right,
        BackgroundTransparency=1,TextSize=TS.Small,
        Position=UDim2.new(0.5,0,0,0),Size=UDim2.new(0.5,0,1,0),Parent=frame})
    return WrapElement(frame,{
        SetValue=function(_,v) valLbl.Text=tostring(v); return _ end,
        GetValue=function() return valLbl.Text end,
    })
end

function Library._CreateParagraph(tab, cfg)
    local frame=New("Frame",{Name="Para",BackgroundColor3=Theme.Secondary,
        BackgroundTransparency=0.5,BorderSizePixel=0,
        AutomaticSize=Enum.AutomaticSize.Y,Size=UDim2.new(1,0,0,0),Parent=tab.content})
    Corner(frame,3); Stroke(frame,Theme.Border,1)
    New("Frame",{BackgroundColor3=Theme.Accent,BorderSizePixel=0,Size=UDim2.new(0,2,1,0),Parent=frame})
    local inner=New("Frame",{BackgroundTransparency=1,Position=UDim2.new(0,10,0,0),
        AutomaticSize=Enum.AutomaticSize.Y,Size=UDim2.new(1,-14,0,0),Parent=frame})
    Padding(inner,10,10,0,0); List(inner,4)
    New("TextLabel",{FontFace=Font.Bold,TextColor3=Theme.Text,Text=cfg.Title or "",
        TextXAlignment=Enum.TextXAlignment.Left,BackgroundTransparency=1,TextWrapped=true,
        TextSize=TS.Normal,AutomaticSize=Enum.AutomaticSize.Y,Size=UDim2.new(1,0,0,0),Parent=inner})
    New("TextLabel",{FontFace=Font.Regular,TextColor3=Theme.TextDark,Text=cfg.Content or "",
        TextXAlignment=Enum.TextXAlignment.Left,BackgroundTransparency=1,TextWrapped=true,
        TextSize=TS.Small,AutomaticSize=Enum.AutomaticSize.Y,Size=UDim2.new(1,0,0,0),Parent=inner})
    return WrapElement(frame)
end

-- ┌─────────────────────────────────────────────────────────────────────────┐
-- │  BUTTON (unchanged)                                                     │
-- └─────────────────────────────────────────────────────────────────────────┘

function Library._CreateButton(tab, cfg)
    Require(cfg,"Name","CreateButton")
    local name=cfg.Name or "Button"; local cb=cfg.Callback or function() end
    local frame=New("Frame",{Name="BTN_"..name,BackgroundColor3=Theme.Secondary,
        BackgroundTransparency=0.5,BorderSizePixel=0,
        Size=UDim2.new(1,0,0,40),Parent=tab.content})
    Corner(frame,3); Stroke(frame,Theme.Border,1)

    -- Optional icon on button
    local textXOff = 12
    if cfg.Icon then
        local iconLbl=New("ImageLabel",{BackgroundTransparency=1,ImageColor3=Theme.TextDark,
            AnchorPoint=Vector2.new(0,0.5),Position=UDim2.new(0,12,0.5,0),
            Size=UDim2.new(0,14,0,14),Parent=frame})
        ApplyIconToImageLabel(iconLbl,cfg.Icon,cfg.IconSource or "Material")
        textXOff=32
    end

    New("TextLabel",{FontFace=Font.Medium,TextColor3=Theme.Text,Text=name,
        TextXAlignment=Enum.TextXAlignment.Left,BackgroundTransparency=1,
        Position=UDim2.new(0,textXOff,0.5,-8),TextSize=TS.Normal,
        Size=UDim2.new(1,-72,0,16),Parent=frame})
    local btn=New("TextButton",{FontFace=Font.Medium,TextColor3=Theme.Background,
        Text="▶",BackgroundColor3=Theme.Accent,BackgroundTransparency=0,
        BorderSizePixel=0,AnchorPoint=Vector2.new(1,0.5),
        Position=UDim2.new(1,-10,0.5,0),Size=UDim2.new(0,28,0,22),
        TextSize=TS.Tiny,Parent=frame})
    Corner(btn,3)
    btn.MouseEnter:Connect(function() Tween(btn,{BackgroundTransparency=0.2},Anim.Fast) end)
    btn.MouseLeave:Connect(function() Tween(btn,{BackgroundTransparency=0},Anim.Fast) end)
    btn.MouseButton1Click:Connect(function()
        Tween(btn,{Size=UDim2.new(0,24,0,20)},Anim.Fast)
        task.delay(0.12,function() Tween(btn,{Size=UDim2.new(0,28,0,22)},Anim.Fast) end)
        pcall(cb)
    end)
    local rowBtn=New("TextButton",{Text="",BackgroundTransparency=1,Size=UDim2.new(1,-48,1,0),Parent=frame})
    rowBtn.MouseEnter:Connect(function() Tween(frame,{BackgroundTransparency=0.3},Anim.Fast) end)
    rowBtn.MouseLeave:Connect(function() Tween(frame,{BackgroundTransparency=0.5},Anim.Fast) end)
    rowBtn.MouseButton1Click:Connect(function() pcall(cb) end)
    local sGui=frame:FindFirstAncestorOfClass("ScreenGui")
    if cfg.Tooltip and sGui then MakeTooltip(frame,cfg.Tooltip,sGui) end
    return WrapElement(frame,{Click=function() pcall(cb) end})
end

-- ┌─────────────────────────────────────────────────────────────────────────┐
-- │  TOGGLE (unchanged)                                                     │
-- └─────────────────────────────────────────────────────────────────────────┘

function Library._CreateToggle(tab, cfg)
    Require(cfg,"Name","CreateToggle")
    local lib=tab._library; local name=cfg.Name or "Toggle"
    local cb=cfg.Callback or function() end; local state=cfg.Default or false
    local frame=New("Frame",{Name="TG_"..name,BackgroundColor3=Theme.Secondary,
        BackgroundTransparency=0.5,BorderSizePixel=0,
        Size=UDim2.new(1,0,0,40),Parent=tab.content})
    Corner(frame,3); Stroke(frame,Theme.Border,1)
    New("TextLabel",{FontFace=Font.Medium,TextColor3=Theme.Text,Text=name,
        TextXAlignment=Enum.TextXAlignment.Left,BackgroundTransparency=1,
        Position=UDim2.new(0,12,0.5,-8),TextSize=TS.Normal,
        Size=UDim2.new(1,-64,0,16),Parent=frame})
    local track=New("Frame",{BackgroundColor3=state and Theme.Toggle.Enabled or Theme.Toggle.Disabled,
        AnchorPoint=Vector2.new(1,0.5),Position=UDim2.new(1,-12,0.5,0),
        BorderSizePixel=0,Size=UDim2.new(0,42,0,22),Parent=frame})
    Corner(track,100); Stroke(track,Theme.Border,1)
    local circle=New("Frame",{BackgroundColor3=Theme.Toggle.Circle,BorderSizePixel=0,
        AnchorPoint=Vector2.new(0,0.5),
        Position=UDim2.new(0,state and 22 or 3,0.5,0),
        Size=UDim2.new(0,14,0,14),Parent=track})
    Corner(circle,100)
    New("TextButton",{Text="",BackgroundTransparency=1,Size=UDim2.new(1,0,1,0),Parent=frame})
        .MouseButton1Click:Connect(function()
        state=not state
        Tween(track,{BackgroundColor3=state and Theme.Toggle.Enabled or Theme.Toggle.Disabled},Anim.Normal)
        Tween(circle,{Position=UDim2.new(0,state and 22 or 3,0.5,0)},Anim.Normal)
        if lib then lib:_SetFlagInternal(cfg.Flag,state) end; pcall(cb,state)
    end)
    local sGui=frame:FindFirstAncestorOfClass("ScreenGui")
    if cfg.Tooltip and sGui then MakeTooltip(frame,cfg.Tooltip,sGui) end
    local function SetState(s)
        state=s
        Tween(track,{BackgroundColor3=s and Theme.Toggle.Enabled or Theme.Toggle.Disabled},Anim.Normal)
        Tween(circle,{Position=UDim2.new(0,s and 22 or 3,0.5,0)},Anim.Normal)
        if lib then lib:_SetFlagInternal(cfg.Flag,s) end; pcall(cb,s)
    end
    if cfg.Flag and lib then
        lib:_RegisterConfig(cfg.Flag,function() return state end,SetState)
        lib:_SetFlagInternal(cfg.Flag,state)
    end
    return WrapElement(frame,{
        SetState=function(_,s) SetState(s); return _ end,
        GetState=function() return state end,
    })
end

-- ┌─────────────────────────────────────────────────────────────────────────┐
-- │  SLIDER (unchanged)                                                     │
-- └─────────────────────────────────────────────────────────────────────────┘

function Library._CreateSlider(tab, cfg)
    Require(cfg,"Name","CreateSlider")
    local lib=tab._library; local name=cfg.Name or "Slider"
    local min=cfg.Min or 0; local max=cfg.Max or 100
    local step=cfg.Step or 1; local suf=cfg.Suffix or ""
    local cb=cfg.Callback or function() end
    local curVal=math.clamp(cfg.Default or min,min,max)
    local range=(max-min)~=0 and (max-min) or 1
    local frame=New("Frame",{Name="SL_"..name,BackgroundColor3=Theme.Secondary,
        BackgroundTransparency=0.5,BorderSizePixel=0,
        Size=UDim2.new(1,0,0,54),Parent=tab.content})
    Corner(frame,3); Stroke(frame,Theme.Border,1)
    New("TextLabel",{FontFace=Font.Medium,TextColor3=Theme.Text,Text=name,
        TextXAlignment=Enum.TextXAlignment.Left,BackgroundTransparency=1,
        Position=UDim2.new(0,12,0,7),TextSize=TS.Normal,Size=UDim2.new(0.65,0,0,16),Parent=frame})
    local valLbl=New("TextLabel",{FontFace=Font.Regular,TextColor3=Theme.TextDark,
        Text=tostring(curVal)..suf,TextXAlignment=Enum.TextXAlignment.Right,
        BackgroundTransparency=1,Position=UDim2.new(0.65,0,0,7),
        TextSize=TS.Small,Size=UDim2.new(0.35,-12,0,16),Parent=frame})
    local track=New("Frame",{BackgroundColor3=Theme.Tertiary,BorderSizePixel=0,
        Position=UDim2.new(0,12,0,32),Size=UDim2.new(1,-24,0,4),Parent=frame})
    Corner(track,100)
    local fill=New("Frame",{BackgroundColor3=Theme.Accent,BorderSizePixel=0,
        Size=UDim2.new((curVal-min)/range,0,1,0),Parent=track})
    Corner(fill,100)
    local thumb=New("Frame",{BackgroundColor3=Theme.Accent,AnchorPoint=Vector2.new(0.5,0.5),
        Position=UDim2.new((curVal-min)/range,0,0.5,0),
        Size=UDim2.new(0,10,0,10),BorderSizePixel=0,ZIndex=2,Parent=track})
    Corner(thumb,100); Stroke(thumb,Theme.BorderLight,1)
    local popup=New("Frame",{BackgroundColor3=Color3.fromRGB(0,0,0),AnchorPoint=Vector2.new(0.5,1),
        Position=UDim2.new((curVal-min)/range,0,-0.5,0),
        Size=UDim2.new(0,38,0,20),Visible=false,ZIndex=50,BorderSizePixel=0,Parent=track})
    Corner(popup,4); Stroke(popup,Theme.BorderLight,1)
    local popLbl=New("TextLabel",{FontFace=Font.Bold,TextColor3=Theme.Accent,
        Text=tostring(curVal),BackgroundTransparency=1,
        TextSize=TS.Tiny,Size=UDim2.new(1,0,1,0),ZIndex=51,Parent=popup})
    New("TextButton",{Text="",BackgroundTransparency=1,Size=UDim2.new(1,0,1,0),ZIndex=3,Parent=frame})
    local dragging=false
    local function Snap(raw)
        return math.clamp(math.round((raw-min)/step)*step+min,min,max)
    end
    local function SetValue(v)
        v=Snap(v); curVal=v
        local t=(v-min)/range
        fill.Size=UDim2.new(t,0,1,0); thumb.Position=UDim2.new(t,0,0.5,0)
        popup.Position=UDim2.new(t,0,-0.5,0)
        valLbl.Text=tostring(v)..suf; popLbl.Text=tostring(v)
        if lib then lib:_SetFlagInternal(cfg.Flag,v) end; pcall(cb,v)
    end
    local function HandleDrag(input)
        local tp=track.AbsolutePosition; local ts3=track.AbsoluteSize
        SetValue(min+range*math.clamp((input.Position.X-tp.X)/ts3.X,0,1))
    end
    local frameBtn=frame:FindFirstChildWhichIsA("TextButton")
    if frameBtn then
        frameBtn.InputBegan:Connect(function(i)
            if i.UserInputType==Enum.UserInputType.MouseButton1
            or i.UserInputType==Enum.UserInputType.Touch then
                dragging=true; popup.Visible=true
                Tween(thumb,{Size=UDim2.new(0,14,0,14)},Anim.Fast); HandleDrag(i)
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
            Tween(thumb,{Size=UDim2.new(0,10,0,10)},Anim.Fast)
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

-- ┌─────────────────────────────────────────────────────────────────────────┐
-- │  PROGRESS BAR (unchanged)                                               │
-- └─────────────────────────────────────────────────────────────────────────┘

function Library._CreateProgressBar(tab, cfg)
    local name=cfg.Name or "Progress"; local min=cfg.Min or 0; local max=cfg.Max or 100
    local suf=cfg.Suffix or "%"; local color=cfg.Color or Theme.Accent
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
        Tween(fill,{Size=UDim2.new((v-min)/(max-min),0,1,0)},Anim.Normal)
        valLbl.Text=tostring(math.floor(v))..suf
    end
    return WrapElement(frame,{
        SetValue=function(_,v) SetValue(v); return _ end,
        GetValue=function() return curVal end,
        AnimateTo=function(_,v,dur)
            local steps=40; local diff=v-curVal
            for i=1,steps do task.wait((dur or 1)/steps); SetValue(curVal+diff/steps) end
            return _
        end,
    })
end

-- ┌─────────────────────────────────────────────────────────────────────────┐
-- │  DROPDOWN (unchanged from v4)                                           │
-- └─────────────────────────────────────────────────────────────────────────┘

function Library._CreateDropdown(tab, cfg)
    Require(cfg,"Name","CreateDropdown")
    local lib=tab._library; local name=cfg.Name or "Dropdown"
    local options=cfg.Options or {}; local multiSel=cfg.MultiSelect or false
    local maxVis=cfg.MaxVisible or 5; local cb=cfg.Callback or function() end
    local expanded=false
    local selected
    if multiSel then selected=type(cfg.Default)=="table" and cfg.Default or {}
    else selected=cfg.Default or (options[1] or "") end

    local frameH=multiSel and 50 or 40
    local frame=New("Frame",{Name="DD_"..name,BackgroundColor3=Theme.Secondary,
        BackgroundTransparency=0.5,BorderSizePixel=0,
        Size=UDim2.new(1,0,0,frameH),ZIndex=1,Parent=tab.content})
    Corner(frame,3); Stroke(frame,Theme.Border,1)
    New("TextLabel",{FontFace=Font.Medium,TextColor3=Theme.Text,Text=name,
        TextXAlignment=Enum.TextXAlignment.Left,BackgroundTransparency=1,
        Position=UDim2.new(0,10,0,0),Size=UDim2.new(0.45,0,0,frameH),
        TextSize=TS.Normal,Parent=frame})
    local selDisp=New("Frame",{BackgroundColor3=Theme.Tertiary,BackgroundTransparency=0.2,
        AnchorPoint=Vector2.new(1,0.5),Position=UDim2.new(1,-10,0.5,0),
        BorderSizePixel=0,Size=UDim2.new(0,140,0,multiSel and 36 or 24),ZIndex=2,Parent=frame})
    Corner(selDisp,3); Stroke(selDisp,Theme.Border,1)
    local selLbl,pillsScroll,countBadge=nil,nil,nil
    if not multiSel then
        selLbl=New("TextLabel",{FontFace=Font.Regular,TextColor3=Theme.Text,
            Text=tostring(selected),TextXAlignment=Enum.TextXAlignment.Left,
            BackgroundTransparency=1,TextSize=TS.Small,TextTruncate=Enum.TextTruncate.AtEnd,
            Position=UDim2.new(0,6,0,0),Size=UDim2.new(1,-20,1,0),ZIndex=2,Parent=selDisp})
    else
        pillsScroll=New("ScrollingFrame",{BackgroundTransparency=1,BorderSizePixel=0,
            Position=UDim2.new(0,4,0,4),Size=UDim2.new(1,-24,1,-8),
            CanvasSize=UDim2.new(0,0,0,0),AutomaticCanvasSize=Enum.AutomaticSize.X,
            ScrollBarThickness=0,ScrollingDirection=Enum.ScrollingDirection.X,
            ZIndex=2,Parent=selDisp})
        New("UIListLayout",{FillDirection=Enum.FillDirection.Horizontal,Padding=UDim.new(0,3),
            SortOrder=Enum.SortOrder.LayoutOrder,VerticalAlignment=Enum.VerticalAlignment.Center,
            Parent=pillsScroll})
        countBadge=New("TextLabel",{FontFace=Font.Bold,TextColor3=Theme.Accent,
            Text="",BackgroundTransparency=1,TextSize=TS.Tiny,
            AnchorPoint=Vector2.new(1,0.5),Position=UDim2.new(1,-2,0.5,0),
            Size=UDim2.new(0,18,0,18),ZIndex=3,Parent=selDisp})
    end
    local arrow=New("ImageLabel",{BackgroundTransparency=1,
        Image="rbxassetid://105558791071013",ImageColor3=Theme.TextDark,Rotation=0,
        AnchorPoint=Vector2.new(1,0.5),Position=UDim2.new(1,-4,0.5,0),
        Size=UDim2.new(0,10,0,10),ZIndex=3,Parent=selDisp})
    local function RebuildPills()
        if not multiSel or not pillsScroll then return end
        for _,c in ipairs(pillsScroll:GetChildren()) do if not c:IsA("UIListLayout") then c:Destroy() end end
        if #selected==0 then
            New("TextLabel",{FontFace=Font.Regular,TextColor3=Theme.TextDark,Text="None",
                BackgroundTransparency=1,TextSize=TS.Small,Size=UDim2.new(0,30,1,0),ZIndex=2,Parent=pillsScroll})
        else
            for _,item in ipairs(selected) do
                local pill=New("Frame",{BackgroundColor3=Theme.Accent,BackgroundTransparency=0.7,
                    BorderSizePixel=0,AutomaticSize=Enum.AutomaticSize.X,
                    Size=UDim2.new(0,0,0,18),ZIndex=2,Parent=pillsScroll})
                Corner(pill,4); Padding(pill,0,0,5,5)
                New("TextLabel",{FontFace=Font.Medium,TextColor3=Theme.Text,Text=item,
                    BackgroundTransparency=1,TextSize=9,AutomaticSize=Enum.AutomaticSize.X,
                    Size=UDim2.new(0,0,1,0),ZIndex=3,Parent=pill})
            end
        end
        if countBadge then countBadge.Text=#selected>0 and tostring(#selected) or "" end
    end
    local optRowH=multiSel and 28 or 30; local headerH=multiSel and 28 or 0
    local opH=math.min(#options,maxVis)*optRowH+headerH
    local optsCont=New("Frame",{BackgroundColor3=Theme.Secondary,BorderSizePixel=0,
        AnchorPoint=Vector2.new(1,0),Position=UDim2.new(1,-10,1,4),
        Size=UDim2.new(0,140,0,opH),Visible=false,ZIndex=100,ClipsDescendants=true,Parent=frame})
    Corner(optsCont,3); Stroke(optsCont,Theme.BorderLight,1)
    local optBodyOffset=0
    if multiSel then
        optBodyOffset=headerH
        local hdr=New("Frame",{BackgroundColor3=Theme.Tertiary,BackgroundTransparency=0.5,
            BorderSizePixel=0,Size=UDim2.new(1,0,0,headerH),ZIndex=101,Parent=optsCont})
        local allBtn=New("TextButton",{FontFace=Font.Medium,Text="All",TextColor3=Theme.Accent,
            BackgroundTransparency=1,BorderSizePixel=0,TextSize=TS.Tiny,
            Size=UDim2.new(0.5,0,1,0),ZIndex=102,Parent=hdr})
        local clrBtn=New("TextButton",{FontFace=Font.Medium,Text="Clear",TextColor3=Theme.TextDark,
            BackgroundTransparency=1,BorderSizePixel=0,TextSize=TS.Tiny,
            Position=UDim2.new(0.5,0,0,0),Size=UDim2.new(0.5,0,1,0),ZIndex=102,Parent=hdr})
        New("Frame",{BackgroundColor3=Theme.Border,BorderSizePixel=0,
            Position=UDim2.new(0.5,0,0.1,0),Size=UDim2.new(0,1,0.8,0),ZIndex=102,Parent=hdr})
        New("Frame",{BackgroundColor3=Theme.Border,BorderSizePixel=0,
            Position=UDim2.new(0,0,0,headerH-1),Size=UDim2.new(1,0,0,1),ZIndex=101,Parent=optsCont})
        allBtn.MouseButton1Click:Connect(function()
            selected={}; for _,o in ipairs(options) do table.insert(selected,o) end
            RebuildPills()
            for _,c in ipairs(optsCont:GetChildren()) do
                if c.Name=="OptRow" then
                    local chk=c:FindFirstChild("Chk"); if chk then chk.BackgroundColor3=Theme.Accent; chk.BackgroundTransparency=0 end
                    local chkMark=chk and chk:FindFirstChild("Mark"); if chkMark then chkMark.Visible=true end
                end
            end
            if lib then lib:_SetFlagInternal(cfg.Flag,selected) end; cb(selected)
        end)
        clrBtn.MouseButton1Click:Connect(function()
            selected={}; RebuildPills()
            for _,c in ipairs(optsCont:GetChildren()) do
                if c.Name=="OptRow" then
                    local chk=c:FindFirstChild("Chk"); if chk then chk.BackgroundColor3=Theme.Tertiary; chk.BackgroundTransparency=0.1 end
                    local chkMark=chk and chk:FindFirstChild("Mark"); if chkMark then chkMark.Visible=false end
                end
            end
            if lib then lib:_SetFlagInternal(cfg.Flag,selected) end; cb(selected)
        end)
    end
    local optsScroll=New("ScrollingFrame",{BackgroundTransparency=1,BorderSizePixel=0,
        Position=UDim2.new(0,0,0,optBodyOffset),Size=UDim2.new(1,0,1,-optBodyOffset),
        CanvasSize=UDim2.new(0,0,0,#options*optRowH),ScrollBarThickness=3,
        ScrollBarImageColor3=Color3.fromRGB(80,80,80),ZIndex=100,Parent=optsCont})
    List(optsScroll,0)
    local optRows={}
    local function IsSelected(opt)
        if multiSel then return table.find(selected,opt)~=nil else return selected==opt end
    end
    local function MakeOpt(opt)
        local ob=New("Frame",{Name="OptRow",BackgroundTransparency=1,BorderSizePixel=0,
            Size=UDim2.new(1,0,0,optRowH),ZIndex=100,Parent=optsScroll})
        local btn=New("TextButton",{Text="",BackgroundTransparency=1,BorderSizePixel=0,
            Size=UDim2.new(1,0,1,0),ZIndex=101,Parent=ob})
        local chk,chkMark=nil,nil
        if multiSel then
            local isSel=IsSelected(opt)
            chk=New("Frame",{Name="Chk",BackgroundColor3=isSel and Theme.Accent or Theme.Tertiary,
                BackgroundTransparency=isSel and 0 or 0.1,BorderSizePixel=0,
                AnchorPoint=Vector2.new(0,0.5),Position=UDim2.new(0,8,0.5,0),
                Size=UDim2.new(0,12,0,12),ZIndex=102,Parent=ob})
            Corner(chk,3); Stroke(chk,isSel and Theme.Accent or Theme.Border,1)
            chkMark=New("TextLabel",{Name="Mark",Text="✓",FontFace=Font.Bold,
                TextColor3=Color3.new(1,1,1),BackgroundTransparency=1,TextSize=9,
                Size=UDim2.new(1,0,1,0),Visible=isSel,ZIndex=103,Parent=chk})
        end
        local xOff=multiSel and 26 or 8
        local lbl=New("TextLabel",{FontFace=Font.Regular,TextColor3=IsSelected(opt) and Theme.Accent or Theme.Text,
            Text=opt,BackgroundTransparency=1,BorderSizePixel=0,
            TextXAlignment=Enum.TextXAlignment.Left,TextSize=TS.Small,
            Position=UDim2.new(0,xOff,0,0),Size=UDim2.new(1,-(xOff+4),1,0),
            TextTruncate=Enum.TextTruncate.AtEnd,ZIndex=102,Parent=ob})
        btn.MouseEnter:Connect(function() Tween(ob,{BackgroundTransparency=0.7},Anim.Fast); ob.BackgroundColor3=Theme.Border end)
        btn.MouseLeave:Connect(function() Tween(ob,{BackgroundTransparency=1},Anim.Fast) end)
        btn.MouseButton1Click:Connect(function()
            if multiSel then
                local idx=table.find(selected,opt)
                if idx then
                    table.remove(selected,idx)
                    if chk then Tween(chk,{BackgroundColor3=Theme.Tertiary,BackgroundTransparency=0.1},Anim.Fast); Stroke(chk,Theme.Border,1); if chkMark then chkMark.Visible=false end end
                    Tween(lbl,{TextColor3=Theme.Text},Anim.Fast)
                else
                    table.insert(selected,opt)
                    if chk then Tween(chk,{BackgroundColor3=Theme.Accent,BackgroundTransparency=0},Anim.Fast); Stroke(chk,Theme.Accent,1); if chkMark then chkMark.Visible=true end end
                    Tween(lbl,{TextColor3=Theme.Accent},Anim.Fast)
                end
                RebuildPills(); if lib then lib:_SetFlagInternal(cfg.Flag,selected) end; cb(selected)
            else
                for _,r in ipairs(optRows) do
                    if r.lbl then Tween(r.lbl,{TextColor3=Theme.Text},Anim.Fast) end
                    if r.row then Tween(r.row,{BackgroundTransparency=1},Anim.Fast) end
                end
                selected=opt; Tween(lbl,{TextColor3=Theme.Accent},Anim.Fast)
                if selLbl then selLbl.Text=opt end
                expanded=false; optsCont.Visible=false
                Tween(arrow,{Rotation=0},Anim.Normal); frame.ZIndex=1
                if lib then lib:_SetFlagInternal(cfg.Flag,selected) end; cb(selected)
            end
        end)
        table.insert(optRows,{row=ob,lbl=lbl,chk=chk,chkMark=chkMark,opt=opt})
    end
    for _,o in ipairs(options) do MakeOpt(o) end
    if multiSel then RebuildPills() end
    New("TextButton",{Text="",BackgroundTransparency=1,Size=UDim2.new(1,0,1,0),ZIndex=3,Parent=selDisp})
        .MouseButton1Click:Connect(function()
        expanded=not expanded; optsCont.Visible=expanded
        Tween(arrow,{Rotation=expanded and 180 or 0},Anim.Normal); frame.ZIndex=expanded and 10 or 1
    end)
    local sGui=frame:FindFirstAncestorOfClass("ScreenGui")
    if cfg.Tooltip and sGui then MakeTooltip(frame,cfg.Tooltip,sGui) end
    local function SetValue(v)
        if multiSel and type(v)=="table" then
            selected=v
            for _,r in ipairs(optRows) do
                local isSel=table.find(selected,r.opt)~=nil
                if r.chk then r.chk.BackgroundColor3=isSel and Theme.Accent or Theme.Tertiary; r.chk.BackgroundTransparency=isSel and 0 or 0.1 end
                if r.chkMark then r.chkMark.Visible=isSel end
                if r.lbl then r.lbl.TextColor3=isSel and Theme.Accent or Theme.Text end
            end
            RebuildPills()
        elseif not multiSel then
            selected=v; if selLbl then selLbl.Text=tostring(v) end
            for _,r in ipairs(optRows) do if r.lbl then r.lbl.TextColor3=(r.opt==v and Theme.Accent or Theme.Text) end end
        end
        if lib then lib:_SetFlagInternal(cfg.Flag,selected) end; cb(selected)
    end
    if cfg.Flag and lib then
        lib:_RegisterConfig(cfg.Flag,function() return selected end,SetValue)
        lib:_SetFlagInternal(cfg.Flag,selected)
    end
    return WrapElement(frame,{
        SetValue=function(_,v) SetValue(v); return _ end,
        GetValue=function() return selected end,
        Refresh=function(_,newOpts)
            options=newOpts; optRows={}
            for _,c in ipairs(optsScroll:GetChildren()) do if c:IsA("Frame") then c:Destroy() end end
            for _,o in ipairs(options) do MakeOpt(o) end
            optsScroll.CanvasSize=UDim2.new(0,0,0,#options*optRowH)
            local nH=math.min(#options,maxVis)*optRowH+headerH
            optsCont.Size=UDim2.new(0,138,0,nH)
            if multiSel then RebuildPills() end; return _
        end,
    })
end

-- ┌─────────────────────────────────────────────────────────────────────────┐
-- │  KEYBIND (unchanged)                                                    │
-- └─────────────────────────────────────────────────────────────────────────┘

function Library._CreateKeybind(tab, cfg, lib)
    Require(cfg,"Name","CreateKeybind")
    local name=cfg.Name or "Keybind"; local cb=cfg.Callback or function() end
    local curKey=cfg.Default or Enum.KeyCode.F; local listening=false
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
            keyLbl.Text="…"; Tween(kbBox,{BackgroundColor3=Theme.AccentDark or Color3.fromRGB(80,65,180)},Anim.Fast)
            Tween(keyLbl,{TextColor3=Theme.Accent},Anim.Fast)
        else
            local dn=curKey.Name; if #dn>6 then dn=dn:sub(1,5)..".." end
            keyLbl.Text=dn; Tween(kbBox,{BackgroundColor3=Theme.Tertiary},Anim.Fast)
            Tween(keyLbl,{TextColor3=Theme.Text},Anim.Fast)
        end
    end
    New("TextButton",{Text="",BackgroundTransparency=1,Size=UDim2.new(1,0,1,0),Parent=kbBox})
        .MouseButton1Click:Connect(function() listening=true; UpdateDisplay() end)
    local c=ui.InputBegan:Connect(function(i,gp)
        if listening and not gp and i.UserInputType==Enum.UserInputType.Keyboard then
            curKey=i.KeyCode; listening=false
            if lib then lib._keybinds[kbId].key=curKey end
            if lib then lib:_SetFlagInternal(cfg.Flag,curKey) end; UpdateDisplay()
        end
    end)
    table.insert(Connections,c); UpdateDisplay()
    local sGui=frame:FindFirstAncestorOfClass("ScreenGui")
    if cfg.Tooltip and sGui then MakeTooltip(kbBox,cfg.Tooltip,sGui) end
    if cfg.Flag and lib then
        lib:_RegisterConfig(cfg.Flag,function() return curKey end,function(v)
            curKey=v; if lib then lib._keybinds[kbId].key=v end; UpdateDisplay()
        end)
        lib:_SetFlagInternal(cfg.Flag,curKey)
    end
    return WrapElement(frame,{
        SetKey=function(_,kc) curKey=kc; if lib then lib._keybinds[kbId].key=kc end; UpdateDisplay(); return _ end,
        GetKey=function() return curKey end,
    })
end

-- ┌─────────────────────────────────────────────────────────────────────────┐
-- │  COLOR PICKER (unchanged)                                               │
-- └─────────────────────────────────────────────────────────────────────────┘

function Library._CreateColorPicker(tab, cfg)
    local lib=tab._library; local name=cfg.Name or "Color"; local cb=cfg.Callback or function() end
    local cur=cfg.Default or Color3.fromRGB(124,106,252); local h,s,v=cur:ToHSV(); local expanded=false
    local frame=New("Frame",{Name="CP_"..name,BackgroundColor3=Theme.Secondary,
        BackgroundTransparency=0.4,BorderSizePixel=0,
        Size=UDim2.new(1,0,0,38),Parent=tab.content})
    Corner(frame); Stroke(frame)
    New("TextLabel",{FontFace=Font.Medium,TextColor3=Theme.Text,Text=name,
        TextXAlignment=Enum.TextXAlignment.Left,BackgroundTransparency=1,
        Position=UDim2.new(0,10,0,0),TextSize=TS.Normal,Size=UDim2.new(1,-50,1,0),Parent=frame})
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
        cur=Color3.fromHSV(h,s,v); preview.BackgroundColor3=cur
        svPick.BackgroundColor3=Color3.fromHSV(h,1,1)
        svC.Position=UDim2.new(s,0,1-v,0); hC.Position=UDim2.new(h,0,0.5,0)
        if lib then lib:_SetFlagInternal(cfg.Flag,cur) end; pcall(cb,cur)
    end
    local svDrag,hDrag=false,false
    local function Handle(i)
        if not picker.Visible then return end
        if svDrag then
            local sz=svPick.AbsoluteSize; local pos=svPick.AbsolutePosition
            s=math.clamp((i.Position.X-pos.X)/sz.X,0,1)
            v=1-math.clamp((i.Position.Y-pos.Y)/sz.Y,0,1); UpdColor()
        elseif hDrag then
            local sz=hueBar.AbsoluteSize; local pos=hueBar.AbsolutePosition
            h=math.clamp((i.Position.X-pos.X)/sz.X,0,1); UpdColor()
        end
    end
    svPick.InputBegan:Connect(function(i) if i.UserInputType==Enum.UserInputType.MouseButton1 then svDrag=true; Handle(i) end end)
    hueBar.InputBegan:Connect(function(i) if i.UserInputType==Enum.UserInputType.MouseButton1 then hDrag=true; Handle(i) end end)
    ui.InputChanged:Connect(function(i) if i.UserInputType==Enum.UserInputType.MouseMovement then Handle(i) end end)
    ui.InputEnded:Connect(function(i) if i.UserInputType==Enum.UserInputType.MouseButton1 then svDrag=false; hDrag=false end end)
    local function Close() picker.Visible=false; expanded=false
        if Library.ActivePicker==Close then Library.ActivePicker=nil end
    end
    prevBtn.MouseButton1Click:Connect(function()
        if expanded then Close(); return end
        if Library.ActivePicker then Library.ActivePicker() end
        Library.ActivePicker=Close
        local bp=preview.AbsolutePosition; local vp2=workspace.CurrentCamera.ViewportSize
        picker.Position=UDim2.new(0,math.max(0,bp.X-174),0,math.clamp(bp.Y,0,vp2.Y-130))
        picker.Visible=true; expanded=true
    end)
    if cfg.Flag and lib then
        lib:_RegisterConfig(cfg.Flag,function() return cur end,function(col) cur=col; h,s,v=col:ToHSV(); UpdColor() end)
        lib:_SetFlagInternal(cfg.Flag,cur)
    end
    return WrapElement(frame,{
        SetColor=function(_,col) cur=col; h,s,v=col:ToHSV(); UpdColor(); return _ end,
        GetColor=function() return cur end,
    })
end

-- ┌─────────────────────────────────────────────────────────────────────────┐
-- │  TEXTBOX (unchanged)                                                    │
-- └─────────────────────────────────────────────────────────────────────────┘

function Library._CreateTextBox(tab, cfg)
    local lib=tab._library; local name=cfg.Name or "TextBox"; local cb=cfg.Callback or function() end
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
    textBox.Focused:Connect(function() Tween(tbC,{BackgroundTransparency=0},Anim.Fast); Tween(tbS,{Color=Theme.Accent},Anim.Fast) end)
    textBox.FocusLost:Connect(function(enter)
        Tween(tbC,{BackgroundTransparency=0.1},Anim.Fast); Tween(tbS,{Color=Theme.Border},Anim.Fast)
        if cfg.NumbersOnly then
            local n=tonumber(textBox.Text); textBox.Text=n and tostring(n) or curText
        end
        curText=textBox.Text; if lib then lib:_SetFlagInternal(cfg.Flag,curText) end; pcall(cb,curText,enter)
    end)
    if cfg.NumbersOnly then
        textBox:GetPropertyChangedSignal("Text"):Connect(function()
            local t=textBox.Text; local f=t:gsub("[^%d%.%-]",""); if t~=f then textBox.Text=f end
        end)
    end
    local sGui=frame:FindFirstAncestorOfClass("ScreenGui")
    if cfg.Tooltip and sGui then MakeTooltip(frame,cfg.Tooltip,sGui) end
    if cfg.Flag and lib then
        lib:_RegisterConfig(cfg.Flag,function() return curText end,function(v) curText=tostring(v); textBox.Text=curText end)
        lib:_SetFlagInternal(cfg.Flag,curText)
    end
    return WrapElement(frame,{
        SetText       =function(_,t) curText=tostring(t); textBox.Text=curText; return _ end,
        GetText       =function() return curText end,
        SetPlaceholder=function(_,p) textBox.PlaceholderText=p; return _ end,
        Focus         =function(_) textBox:CaptureFocus(); return _ end,
    })
end

-- ┌─────────────────────────────────────────────────────────────────────────┐
-- │  CONFIG SECTION (with gradient preset dropdown added)                   │
-- └─────────────────────────────────────────────────────────────────────────┘

function Library._CreateConfigSection(tab)
    local lib=tab._library
    Library._CreateContentSection(tab,L("Configuration"))
    local nameBox=Library._CreateTextBox(tab,{Name=L("ConfigName"),Default="default",
        Placeholder="config name…",Callback=function(t) lib._currentConfig=t end})
    local drop; drop=Library._CreateDropdown(tab,{Name=L("SelectConfig"),
        Options=lib:GetConfigs(),Default="default",
        Callback=function(sel) nameBox:SetText(sel); lib._currentConfig=sel end})
    Library._CreateButton(tab,{Name=L("Save"),Icon="save",Callback=function()
        local n=nameBox:GetText(); if n~="" then lib:SaveConfig(n); drop:Refresh(lib:GetConfigs()) end end})
    Library._CreateButton(tab,{Name=L("Load"),Icon="cloud",Callback=function()
        local n=nameBox:GetText(); if n~="" then lib:LoadConfig(n) end end})
    Library._CreateButton(tab,{Name=L("Delete"),Icon="delete",Tooltip=L("ConfirmDeleteDesc"),
        Callback=function()
            local n=nameBox:GetText()
            if n~="" then
                lib:Confirm({Title=L("ConfirmDelete").." '"..n.."'?",Description=L("ConfirmDeleteDesc"),
                    YesLabel=L("ConfirmDelete"),YesType="Error",
                    OnYes=function() lib:DeleteConfig(n); drop:Refresh(lib:GetConfigs()) end})
            end
        end})
    Library._CreateButton(tab,{Name=L("Refresh"),Icon="refresh",Callback=function()
        drop:Refresh(lib:GetConfigs())
        lib:Notify({Title=L("Refreshed"),Description=L("ConfigListUpdated"),Duration=2,Type="Success"})
    end})
    Library._CreateToggle(tab,{Name=L("AutoSave"),Default=false,
        Tooltip="Saves current config every 30 seconds",
        Callback=function(en) lib:SetAutoSave(en) end})

    Library._CreateDivider(tab)
    Library._CreateContentSection(tab,L("Theme"))
    local presets={{name="White",color=Color3.fromRGB(255,255,255)},{name="Silver",color=Color3.fromRGB(180,180,180)},
        {name="Cyan",color=Color3.fromRGB(80,210,230)},{name="Green",color=Color3.fromRGB(80,200,120)},
        {name="Red",color=Color3.fromRGB(240,80,80)},{name="Orange",color=Color3.fromRGB(240,160,60)},
        {name="Pink",color=Color3.fromRGB(240,100,180)},{name="Purple",color=Color3.fromRGB(124,106,252)}}
    local pNames={}; for _,p in ipairs(presets) do table.insert(pNames,p.name) end
    Library._CreateDropdown(tab,{Name=L("AccentPreset"),Options=pNames,Default="White",
        Tooltip="Changes the global accent color",
        Callback=function(sel)
            for _,p in ipairs(presets) do if p.name==sel then lib:SetAccentColor(p.color); break end end end})

    -- NEW: Gradient preset dropdown
    Library._CreateDivider(tab)
    Library._CreateContentSection(tab,L("GradientPreset"))
    Library._CreateDropdown(tab,{Name=L("GradientPreset"),Options=lib:GetGradientPresets(),Default="Nightlight (Neo)",
        Tooltip="Applies a gradient to the accent bar",
        Callback=function(sel) lib:SetAccentGradient(sel) end})

    Library._CreateDivider(tab)
    Library._CreateContentSection(tab,L("Background"))
    local bgTransSlider=Library._CreateSlider(tab,{Name="Transparency",Min=0,Max=90,Default=15,Step=5,Suffix="%",
        Tooltip="0 = fully opaque, 90 = nearly invisible"})
    local bgUrlBox=Library._CreateTextBox(tab,{Name=L("Background"),Placeholder="https://... or rbxassetid://...",Default="",Tooltip="Paste a direct image or GIF URL"})
    Library._CreateButton(tab,{Name=L("BgApply"),Icon="image",Callback=function()
        local url=bgUrlBox:GetText(); local transp=bgTransSlider:GetValue()/100
        if url~="" then lib:SetBackground(url,transp); lib:Notify({Title=L("BgApply"),Description="Background applied~",Duration=2,Type="Success"})
        else lib:Notify({Title="Error",Description="URL trống!",Duration=2,Type="Error"}) end end})
    Library._CreateButton(tab,{Name=L("BgClear"),Icon="delete",Callback=function()
        lib:ClearBackground(); bgUrlBox:SetText("")
        lib:Notify({Title=L("BgClear"),Description="Background removed :3",Duration=2,Type="Info"}) end})

    Library._CreateDivider(tab)
    Library._CreateContentSection(tab,L("Font"))
    local fontNames={}; for _,f in ipairs(FontRegistry) do table.insert(fontNames,f.name) end
    Library._CreateDropdown(tab,{Name=L("Font"),Options=fontNames,Default=fontNames[1],
        Tooltip="Changes the UI font globally",Callback=function(sel) lib:SetFont(sel) end})

    Library._CreateDivider(tab)
    Library._CreateContentSection(tab,L("Language"))
    local langNames={}; for k in pairs(Languages) do table.insert(langNames,k) end; table.sort(langNames)
    Library._CreateDropdown(tab,{Name=L("Language"),Options=langNames,Default=CurrentLang,
        Tooltip="Changes UI language",Callback=function(sel) lib:SetLanguage(sel) end})

    Library._CreateDivider(tab)
    Library._CreateContentSection(tab,L("Device"))
    Library._CreateLabel(tab,{Name="Type",Value=Device.Detect()})
    Library._CreateLabel(tab,{Name="Size",Value=tostring(math.floor(workspace.CurrentCamera.ViewportSize.X)).."x"..tostring(math.floor(workspace.CurrentCamera.ViewportSize.Y))})
    Library._CreateLabel(tab,{Name=L("Version"),Value="Zenith Ui v"..Library.Version})

    return {RefreshConfigs=function() drop:Refresh(lib:GetConfigs()) end}
end

-- ┌─────────────────────────────────────────────────────────────────────────┐
-- │  PUBLIC EXPORTS                                                         │
-- └─────────────────────────────────────────────────────────────────────────┘

-- Expose utilities for scripts that use the library
Library.GetIcon          = GetIcon
Library.ApplyIcon        = ApplyIconToImageLabel
Library.MaterialIcons    = MaterialIcons
Library.GradientPresets  = GradientPresets
Library.PackColor        = PackColor
Library.UnpackColor      = UnpackColor
Library.Merge            = Merge
Library.Theme            = Theme

return Library
