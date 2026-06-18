
local Quantum = {}
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

local Config = {
    Name = "Quantum",
    DefaultVersion = "5.1",
    DefaultTheme = "Dark",
    CornerRadius = 16,
    ElementCorner = 12,
    SidebarWidth = 200,
    TopbarHeight = 46,
    MinWindowSize = Vector2.new(480, 300),
    Themes = {
        Dark = {
            Background = Color3.fromRGB(16, 16, 20),
            Sidebar = Color3.fromRGB(22, 22, 28),
            Accent = Color3.fromRGB(124, 92, 242),
            Text = Color3.fromRGB(240, 240, 245),
            SubText = Color3.fromRGB(150, 150, 160),
            Element = Color3.fromRGB(30, 30, 38),
            ElementHover = Color3.fromRGB(38, 38, 48),
            ToggleOn = Color3.fromRGB(124, 92, 242),
            ToggleOff = Color3.fromRGB(45, 45, 55),
            Border = Color3.fromRGB(45, 45, 55),
            Shadow = Color3.fromRGB(0, 0, 0),
            Overlay = Color3.fromRGB(0, 0, 0),
            Success = Color3.fromRGB(90, 220, 140)
        },
        Light = {
            Background = Color3.fromRGB(248, 248, 252),
            Sidebar = Color3.fromRGB(238, 238, 244),
            Accent = Color3.fromRGB(100, 80, 220),
            Text = Color3.fromRGB(30, 30, 35),
            SubText = Color3.fromRGB(110, 110, 120),
            Element = Color3.fromRGB(228, 228, 234),
            ElementHover = Color3.fromRGB(218, 218, 224),
            ToggleOn = Color3.fromRGB(100, 80, 220),
            ToggleOff = Color3.fromRGB(190, 190, 200),
            Border = Color3.fromRGB(210, 210, 220),
            Shadow = Color3.fromRGB(180, 180, 190),
            Overlay = Color3.fromRGB(200, 200, 200),
            Success = Color3.fromRGB(60, 200, 120)
        },
        Ocean = {
            Background = Color3.fromRGB(12, 22, 32),
            Sidebar = Color3.fromRGB(18, 32, 48),
            Accent = Color3.fromRGB(60, 180, 220),
            Text = Color3.fromRGB(230, 240, 250),
            SubText = Color3.fromRGB(140, 160, 180),
            Element = Color3.fromRGB(22, 42, 62),
            ElementHover = Color3.fromRGB(32, 58, 85),
            ToggleOn = Color3.fromRGB(60, 180, 220),
            ToggleOff = Color3.fromRGB(40, 60, 80),
            Border = Color3.fromRGB(40, 70, 100),
            Shadow = Color3.fromRGB(0, 0, 0),
            Overlay = Color3.fromRGB(0, 0, 0),
            Success = Color3.fromRGB(80, 220, 160)
        },
        Midnight = {
            Background = Color3.fromRGB(8, 8, 12),
            Sidebar = Color3.fromRGB(12, 12, 18),
            Accent = Color3.fromRGB(220, 60, 120),
            Text = Color3.fromRGB(245, 245, 250),
            SubText = Color3.fromRGB(150, 150, 160),
            Element = Color3.fromRGB(20, 20, 28),
            ElementHover = Color3.fromRGB(28, 28, 40),
            ToggleOn = Color3.fromRGB(220, 60, 120),
            ToggleOff = Color3.fromRGB(50, 50, 60),
            Border = Color3.fromRGB(40, 40, 50),
            Shadow = Color3.fromRGB(0, 0, 0),
            Overlay = Color3.fromRGB(0, 0, 0),
            Success = Color3.fromRGB(220, 60, 120)
        },
        Forest = {
            Background = Color3.fromRGB(14, 22, 14),
            Sidebar = Color3.fromRGB(20, 32, 20),
            Accent = Color3.fromRGB(80, 200, 120),
            Text = Color3.fromRGB(230, 245, 235),
            SubText = Color3.fromRGB(140, 160, 145),
            Element = Color3.fromRGB(26, 40, 26),
            ElementHover = Color3.fromRGB(34, 52, 34),
            ToggleOn = Color3.fromRGB(80, 200, 120),
            ToggleOff = Color3.fromRGB(45, 60, 45),
            Border = Color3.fromRGB(45, 65, 45),
            Shadow = Color3.fromRGB(0, 0, 0),
            Overlay = Color3.fromRGB(0, 0, 0),
            Success = Color3.fromRGB(100, 220, 100)
        }
    }
}

local Icons = {
    Home = "rbxassetid://7733960981",
    Settings = "rbxassetid://7734053495",
    User = "rbxassetid://7743875962",
    Eye = "rbxassetid://7733774602",
    EyeOff = "rbxassetid://7733774495",
    Shield = "rbxassetid://7734056608",
    ShieldCheck = "rbxassetid://7734056411",
    Search = "rbxassetid://7734052925",
    ChevronDown = "rbxassetid://7733717447",
    ChevronRight = "rbxassetid://7733717755",
    ChevronUp = "rbxassetid://7733919605",
    ChevronLeft = "rbxassetid://7733717651",
    X = "rbxassetid://7743878857",
    Minus = "rbxassetid://7734000129",
    Maximize = "rbxassetid://7733992982",
    Maximize2 = "rbxassetid://7733992901",
    Minimize = "rbxassetid://7733997941",
    Minimize2 = "rbxassetid://7733997870",
    Moon = "rbxassetid://7743870134",
    Sun = "rbxassetid://7734068495",
    Palette = "rbxassetid://7734021595",
    Sliders = "rbxassetid://7734058803",
    ToggleLeft = "rbxassetid://7734091286",
    ToggleRight = "rbxassetid://7743873539",
    Type = "rbxassetid://7743874740",
    MousePointer = "rbxassetid://7743870392",
    Layers = "rbxassetid://7743868936",
    Command = "rbxassetid://7733924046",
    Star = "rbxassetid://7734068321",
    Bell = "rbxassetid://7733911828",
    Folder = "rbxassetid://7733799185",
    Terminal = "rbxassetid://7743872929",
    Activity = "rbxassetid://7733655755",
    Target = "rbxassetid://7743872758",
    Anchor = "rbxassetid://7733911490",
    Compass = "rbxassetid://7733924216",
    Cpu = "rbxassetid://7733765045",
    Globe = "rbxassetid://7733954760",
    Hash = "rbxassetid://7733955906",
    Key = "rbxassetid://7733965118",
    Lock = "rbxassetid://7733992528",
    Unlock = "rbxassetid://7743875263",
    Move = "rbxassetid://7743870731",
    Power = "rbxassetid://7734042493",
    RefreshCw = "rbxassetid://7734051052",
    Trash = "rbxassetid://7743873871",
    Trash2 = "rbxassetid://7743873772",
    Wifi = "rbxassetid://7743878148",
    Wrench = "rbxassetid://7743878358",
    Check = "rbxassetid://7733715400",
    AlertCircle = "rbxassetid://7733911490",
    Info = "rbxassetid://7733960981",
    AlertTriangle = "rbxassetid://7733911490",
    ["bot"] = "rbxassetid://7733924046",
    ["fish"] = "rbxassetid://7733954760",
    ["droplets"] = "rbxassetid://7733924216",
    ["map-pin"] = "rbxassetid://7743872758",
    ["shopping-cart"] = "rbxassetid://7733799185",
    ["calendar"] = "rbxassetid://7733911828",
    ["repeat"] = "rbxassetid://7734051052",
    ["scroll"] = "rbxassetid://7743874740",
    ["check"] = "rbxassetid://7733715400",
    ["alert-triangle"] = "rbxassetid://7733911490",
    ["x"] = "rbxassetid://7743878857",
    ["refresh-cw"] = "rbxassetid://7734051052",
    ["user-x"] = "rbxassetid://7743875962",
    ["bar-chart-2"] = "rbxassetid://7734058803",
    ["smile"] = "rbxassetid://7743875962",
    ["sword"] = "rbxassetid://7743872758",
    ["gem"] = "rbxassetid://7734068321",
    ["sparkles"] = "rbxassetid://7734068321",
    ["egg"] = "rbxassetid://7733911828",
    ["heart"] = "rbxassetid://7734068321",
    ["cloud"] = "rbxassetid://7733954760",
    ["flame"] = "rbxassetid://7733911490",
    ["leaf"] = "rbxassetid://7733924216",
    ["candy"] = "rbxassetid://7733911828",
    ["rainbow"] = "rbxassetid://7734068321",
    ["code"] = "rbxassetid://7743872929",
    ["wand"] = "rbxassetid://7733965118",
    ["dna"] = "rbxassetid://7733765045",
    ["clover"] = "rbxassetid://7733924216",
    ["coins"] = "rbxassetid://7733954760",
    ["skull"] = "rbxassetid://7733911490",
    ["zap"] = "rbxassetid://7733765045",
    ["telescope"] = "rbxassetid://7733924216",
    ["cloud-lightning"] = "rbxassetid://7733911490",
    ["trending-up"] = "rbxassetid://7734058803",
    ["lock"] = "rbxassetid://7733992528",
    ["bug"] = "rbxassetid://7733924046",
    ["waves"] = "rbxassetid://7733954760",
    ["camera"] = "rbxassetid://7733774602",
    ["box"] = "rbxassetid://7733799185",
    ["layers"] = "rbxassetid://7743868936",
    ["clock"] = "rbxassetid://7733911828",
    ["rotate-ccw"] = "rbxassetid://7734051052",
    ["moon"] = "rbxassetid://7743870134",
    ["sun"] = "rbxassetid://7734068495",
    ["thumbs-up"] = "rbxassetid://7733715400",
    ["info"] = "rbxassetid://7733960981",
    ["user"] = "rbxassetid://7743875962",
    ["star"] = "rbxassetid://7734068321",
    ["target"] = "rbxassetid://7743872758",
    ["anchor"] = "rbxassetid://7733911490",
    ["shield"] = "rbxassetid://7734056608",
    ["cpu"] = "rbxassetid://7733765045",
    ["hash"] = "rbxassetid://7733955906",
    ["key"] = "rbxassetid://7733965118",
    ["move"] = "rbxassetid://7743870731",
    ["trash"] = "rbxassetid://7743873871",
    ["wifi"] = "rbxassetid://7743878148",
    ["wrench"] = "rbxassetid://7743878358",
    ["alert-circle"] = "rbxassetid://7733911490",
}

local function Create(className, properties)
    local instance = Instance.new(className)
    for prop, value in pairs(properties or {}) do
        instance[prop] = value
    end
    return instance
end

local function Tween(instance, properties, duration, easingStyle, easingDirection)
    if not instance or not instance.Parent then return end
    local tween = TweenService:Create(instance, TweenInfo.new(
        duration or 0.25,
        easingStyle or Enum.EasingStyle.Quart,
        easingDirection or Enum.EasingDirection.Out
    ), properties)
    tween:Play()
    return tween
end

local function Round(number, precision)
    precision = precision or 2
    return math.round(number * 10^precision) / 10^precision
end

local function GetIcon(name)
    if not name then return Icons.Info end
    if Icons[name] then return Icons[name] end
    return Icons.Info
end

local function NormalizeOption(opt)
    if type(opt) == "table" then
        return opt.Title or opt.title or tostring(opt), opt.Icon or opt.icon
    end
    return tostring(opt), nil
end

local CurrentTheme = Config.Themes[Config.DefaultTheme]
local ThemeListeners = {}

local function ApplyTheme(themeName)
    if not Config.Themes[themeName] then return end
    CurrentTheme = Config.Themes[themeName]
    for _, callback in ipairs(ThemeListeners) do
        callback(CurrentTheme)
    end
end

local function ListenTheme(callback)
    table.insert(ThemeListeners, callback)
    callback(CurrentTheme)
end

local NotifyScreen = nil
local NotifyLayout = nil
local ActiveNotifications = {}

local function InitNotify()
    if NotifyScreen then return end
    NotifyScreen = Create("ScreenGui", {
        Name = "QuantumNotify",
        Parent = game.CoreGui,
        ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
        ResetOnSpawn = false,
    })
    NotifyLayout = Create("Frame", {
        Parent = NotifyScreen,
        Size = UDim2.new(0, 300, 1, -40),
        Position = UDim2.new(1, -320, 0, 20),
        BackgroundTransparency = 1,
        ZIndex = 200,
    })
    Create("UIListLayout", {
        Parent = NotifyLayout,
        Padding = UDim.new(0, 8),
        HorizontalAlignment = Enum.HorizontalAlignment.Right,
        VerticalAlignment = Enum.VerticalAlignment.Top,
        SortOrder = Enum.SortOrder.LayoutOrder,
    })
end

function Quantum:Notify(data)
    data = data or {}
    local title = data.Title or "Notification"
    local content = data.Content or ""
    local duration = data.Duration or 3
    local icon = data.Icon or "Info"
    local iconId = GetIcon(icon)

    InitNotify()

    local notifFrame = Create("Frame", {
        Parent = NotifyLayout,
        Size = UDim2.new(0, 280, 0, 0),
        BackgroundColor3 = CurrentTheme.Background,
        BorderSizePixel = 0,
        ClipsDescendants = true,
        LayoutOrder = #ActiveNotifications,
        ZIndex = 201,
    })
    Create("UICorner", {CornerRadius = UDim.new(0, 10), Parent = notifFrame})
    Create("UIStroke", {Color = CurrentTheme.Border, Thickness = 1, Parent = notifFrame})

    local AccentBar = Create("Frame", {
        Parent = notifFrame,
        Size = UDim2.new(0, 3, 1, 0),
        Position = UDim2.new(0, 0, 0, 0),
        BackgroundColor3 = CurrentTheme.Accent,
        BorderSizePixel = 0,
        ZIndex = 202,
    })

    local IconImg = Create("ImageLabel", {
        Parent = notifFrame,
        Size = UDim2.new(0, 22, 0, 22),
        Position = UDim2.new(0, 12, 0, 10),
        BackgroundTransparency = 1,
        Image = iconId,
        ImageColor3 = CurrentTheme.Accent,
        ZIndex = 202,
    })

    local TitleLbl = Create("TextLabel", {
        Parent = notifFrame,
        Size = UDim2.new(1, -50, 0, 18),
        Position = UDim2.new(0, 40, 0, 8),
        BackgroundTransparency = 1,
        Text = title,
        TextColor3 = CurrentTheme.Text,
        TextSize = 12,
        Font = Enum.Font.GothamBold,
        TextXAlignment = Enum.TextXAlignment.Left,
        TextWrapped = true,
        ZIndex = 202,
    })

    local ContentLbl = Create("TextLabel", {
        Parent = notifFrame,
        Size = UDim2.new(1, -50, 0, 0),
        Position = UDim2.new(0, 40, 0, 26),
        BackgroundTransparency = 1,
        Text = content,
        TextColor3 = CurrentTheme.SubText,
        TextSize = 11,
        Font = Enum.Font.Gotham,
        TextXAlignment = Enum.TextXAlignment.Left,
        TextWrapped = true,
        AutomaticSize = Enum.AutomaticSize.Y,
        ZIndex = 202,
    })

    local ProgressBar = Create("Frame", {
        Parent = notifFrame,
        Size = UDim2.new(1, 0, 0, 2),
        Position = UDim2.new(0, 0, 1, -2),
        BackgroundColor3 = CurrentTheme.Accent,
        BorderSizePixel = 0,
        ZIndex = 202,
    })

    table.insert(ActiveNotifications, notifFrame)

    task.wait()
    local contentHeight = math.max(60, 26 + ContentLbl.AbsoluteSize.Y + 10)
    Tween(notifFrame, {Size = UDim2.new(0, 280, 0, contentHeight)}, 0.3, Enum.EasingStyle.Back)

    Tween(ProgressBar, {Size = UDim2.new(0, 0, 0, 2)}, duration, Enum.EasingStyle.Linear)

    task.delay(duration, function()
        Tween(notifFrame, {Size = UDim2.new(0, 0, 0, contentHeight)}, 0.25, Enum.EasingStyle.Quart).Completed:Connect(function()
            notifFrame:Destroy()
            for i, n in ipairs(ActiveNotifications) do
                if n == notifFrame then
                    table.remove(ActiveNotifications, i)
                    break
                end
            end
        end)
    end)
end

local FloatingIconScreen = nil
local FloatingIconBtn = nil
local FloatingConnections = {}
local MainWindowScreen = nil
local MainFrame = nil
local IsMinimized = false
local IsClosed = false

local function CreateFloatingIcon(customIcon)
    for _, conn in ipairs(FloatingConnections) do
        if conn then conn:Disconnect() end
    end
    FloatingConnections = {}

    if FloatingIconScreen then
        FloatingIconScreen:Destroy()
    end

    local iconToUse = customIcon or Icons.Power

    FloatingIconScreen = Create("ScreenGui", {
        Name = "QuantumFloatingIcon",
        Parent = game.CoreGui,
        ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
        ResetOnSpawn = false,
        Enabled = true
    })

    local Backdrop = Create("Frame", {
        Name = "Backdrop",
        Parent = FloatingIconScreen,
        Size = UDim2.new(0, 48, 0, 48),
        Position = UDim2.new(0, 20, 0.5, -24),
        BackgroundColor3 = CurrentTheme.Accent,
        BackgroundTransparency = 0.15,
        BorderSizePixel = 0,
        Active = true,
        ZIndex = 1000
    })

    Create("UICorner", {
        CornerRadius = UDim.new(0, 12),
        Parent = Backdrop
    })

    Create("UIStroke", {
        Color = CurrentTheme.Text,
        Transparency = 0.4,
        Thickness = 1,
        Parent = Backdrop
    })

    local Icon = Create("ImageLabel", {
        Name = "Icon",
        Parent = Backdrop,
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.new(0.5, 0, 0.5, 0),
        Size = UDim2.new(0, 22, 0, 22),
        BackgroundTransparency = 1,
        Image = iconToUse,
        ImageColor3 = CurrentTheme.Text,
        ZIndex = 1001
    })

    local mouseDownOnIcon = false
    local isDragging = false
    local dragStart = nil
    local startPos = nil
    local hasMoved = false
    local dragThreshold = 5

    local conn1 = Backdrop.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            mouseDownOnIcon = true
            isDragging = true
            hasMoved = false
            dragStart = input.Position
            startPos = Backdrop.Position
        end
    end)

    local conn2 = UserInputService.InputChanged:Connect(function(input)
        if isDragging and mouseDownOnIcon and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
            local delta = input.Position - dragStart
            if math.abs(delta.X) > dragThreshold or math.abs(delta.Y) > dragThreshold then
                hasMoved = true
            end
            if Backdrop and Backdrop.Parent then
                Backdrop.Position = UDim2.new(
                    startPos.X.Scale, startPos.X.Offset + delta.X,
                    startPos.Y.Scale, startPos.Y.Offset + delta.Y
                )
            end
        end
    end)

    local conn3 = UserInputService.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            if mouseDownOnIcon and not hasMoved then
                if IsClosed then
                    IsClosed = false
                    if MainWindowScreen then
                        MainWindowScreen.Enabled = true
                    end
                    if MainFrame then
                        MainFrame.Visible = true
                        MainFrame.Size = UDim2.new(0, 0, 0, 0)
                        MainFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
                        Tween(MainFrame, {Size = UDim2.new(0, 600, 0, 380)}, 0.4, Enum.EasingStyle.Back)
                        MainFrame.Position = UDim2.new(0.5, -300, 0.5, -190)
                    end
                elseif IsMinimized then
                    IsMinimized = false
                    if MainFrame then
                        MainFrame.Visible = true
                    end
                else
                    IsMinimized = true
                    if MainFrame then
                        MainFrame.Visible = false
                    end
                end
            end
            mouseDownOnIcon = false
            isDragging = false
        end
    end)

    table.insert(FloatingConnections, conn1)
    table.insert(FloatingConnections, conn2)
    table.insert(FloatingConnections, conn3)

    ListenTheme(function(theme)
        if Backdrop and Backdrop.Parent then
            Backdrop.BackgroundColor3 = theme.Accent
            Icon.ImageColor3 = theme.Text
        end
    end)

    FloatingIconBtn = Backdrop
    return FloatingIconScreen
end

function Quantum:CreateWindow(data)
    data = data or {}
    local windowName = data.Name or "Quantum"
    local windowIcon = data.Icon or "Power"
    local floatingIcon = data.FloatingIcon or nil
    local customVersion = data.Version or Config.DefaultVersion
    local toggleKey = data.ToggleKey

    if MainWindowScreen then
        MainWindowScreen:Destroy()
    end

    CreateFloatingIcon(floatingIcon)

    MainWindowScreen = Create("ScreenGui", {
        Name = "QuantumUI",
        Parent = game.CoreGui,
        ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
        ResetOnSpawn = false,
        Enabled = true
    })

    MainFrame = Create("Frame", {
        Name = "Main",
        Parent = MainWindowScreen,
        Size = UDim2.new(0, 0, 0, 0),
        Position = UDim2.new(0.5, 0, 0.5, 0),
        AnchorPoint = Vector2.new(0, 0),
        BackgroundColor3 = CurrentTheme.Background,
        BorderSizePixel = 0,
        ClipsDescendants = true,
        Active = true,
        ZIndex = 10
    })

    Create("UICorner", {
        CornerRadius = UDim.new(0, Config.CornerRadius),
        Parent = MainFrame
    })

    local Shadow = Create("ImageLabel", {
        Name = "Shadow",
        Parent = MainFrame,
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.new(0.5, 0, 0.5, 0),
        Size = UDim2.new(1, 50, 1, 50),
        BackgroundTransparency = 1,
        Image = "rbxassetid://10806158995",
        ImageColor3 = CurrentTheme.Shadow,
        ImageTransparency = 0.5,
        ZIndex = 0
    })

    local Topbar = Create("Frame", {
        Name = "Topbar",
        Parent = MainFrame,
        Size = UDim2.new(1, 0, 0, Config.TopbarHeight),
        BackgroundColor3 = CurrentTheme.Sidebar,
        BorderSizePixel = 0,
        ZIndex = 20
    })

    Create("UICorner", {
        CornerRadius = UDim.new(0, Config.CornerRadius),
        Parent = Topbar
    })

    local TopbarFix = Create("Frame", {
        Name = "Fix",
        Parent = Topbar,
        Size = UDim2.new(1, 0, 0.5, 0),
        Position = UDim2.new(0, 0, 0.5, 0),
        BackgroundColor3 = CurrentTheme.Sidebar,
        BorderSizePixel = 0,
        ZIndex = 20
    })

    local TitleIcon = Create("ImageLabel", {
        Name = "TitleIcon",
        Parent = Topbar,
        Size = UDim2.new(0, 20, 0, 20),
        Position = UDim2.new(0, 14, 0, 10),
        BackgroundTransparency = 1,
        Image = GetIcon(windowIcon),
        ImageColor3 = CurrentTheme.Accent,
        ZIndex = 21
    })

    local Title = Create("TextLabel", {
        Name = "Title",
        Parent = Topbar,
        Size = UDim2.new(0, 200, 0, 26),
        Position = UDim2.new(0, 40, 0, 6),
        BackgroundTransparency = 1,
        Text = windowName,
        TextColor3 = CurrentTheme.Text,
        TextSize = 15,
        Font = Enum.Font.GothamBold,
        TextXAlignment = Enum.TextXAlignment.Left,
        ZIndex = 21
    })

    local Version = Create("TextLabel", {
        Name = "Version",
        Parent = Topbar,
        Size = UDim2.new(0, 200, 0, 14),
        Position = UDim2.new(0, 40, 0, 28),
        BackgroundTransparency = 1,
        Text = "v" .. customVersion,
        TextColor3 = CurrentTheme.SubText,
        TextSize = 10,
        Font = Enum.Font.Gotham,
        TextXAlignment = Enum.TextXAlignment.Left,
        ZIndex = 21
    })

    local ConfirmOverlay = Create("Frame", {
        Name = "ConfirmOverlay",
        Parent = MainFrame,
        Size = UDim2.new(1, 0, 1, 0),
        BackgroundColor3 = CurrentTheme.Overlay,
        BackgroundTransparency = 0.4,
        BorderSizePixel = 0,
        Visible = false,
        ZIndex = 100
    })
    Create("UICorner", {CornerRadius = UDim.new(0, Config.CornerRadius), Parent = ConfirmOverlay})

    local ConfirmBox = Create("Frame", {
        Name = "ConfirmBox",
        Parent = ConfirmOverlay,
        Size = UDim2.new(0, 280, 0, 140),
        Position = UDim2.new(0.5, -140, 0.5, -70),
        BackgroundColor3 = CurrentTheme.Background,
        BorderSizePixel = 0,
        ZIndex = 101
    })
    Create("UICorner", {CornerRadius = UDim.new(0, 12), Parent = ConfirmBox})
    Create("UIStroke", {Color = CurrentTheme.Border, Thickness = 1, Parent = ConfirmBox})

    Create("TextLabel", {
        Parent = ConfirmBox,
        Size = UDim2.new(1, 0, 0, 30),
        Position = UDim2.new(0, 0, 0, 12),
        BackgroundTransparency = 1,
        Text = "Close Quantum?",
        TextColor3 = CurrentTheme.Text,
        TextSize = 16,
        Font = Enum.Font.GothamBold,
        ZIndex = 102
    })

    Create("TextLabel", {
        Parent = ConfirmBox,
        Size = UDim2.new(1, -30, 0, 40),
        Position = UDim2.new(0, 15, 0, 42),
        BackgroundTransparency = 1,
        Text = "You can reopen using the floating icon.",
        TextColor3 = CurrentTheme.SubText,
        TextSize = 12,
        Font = Enum.Font.Gotham,
        TextWrapped = true,
        ZIndex = 102
    })

    local ConfirmYes = Create("TextButton", {
        Parent = ConfirmBox,
        Size = UDim2.new(0, 100, 0, 32),
        Position = UDim2.new(0.5, 10, 1, -42),
        BackgroundColor3 = Color3.fromRGB(220, 60, 60),
        Text = "Close",
        TextColor3 = Color3.fromRGB(255, 255, 255),
        TextSize = 12,
        Font = Enum.Font.GothamBold,
        ZIndex = 102
    })
    Create("UICorner", {CornerRadius = UDim.new(0, 8), Parent = ConfirmYes})

    local ConfirmNo = Create("TextButton", {
        Parent = ConfirmBox,
        Size = UDim2.new(0, 100, 0, 32),
        Position = UDim2.new(0.5, -110, 1, -42),
        BackgroundColor3 = CurrentTheme.Element,
        Text = "Cancel",
        TextColor3 = CurrentTheme.Text,
        TextSize = 12,
        Font = Enum.Font.GothamBold,
        ZIndex = 102
    })
    Create("UICorner", {CornerRadius = UDim.new(0, 8), Parent = ConfirmNo})

    local Controls = Create("Frame", {
        Name = "Controls",
        Parent = Topbar,
        Size = UDim2.new(0, 110, 0, Config.TopbarHeight),
        Position = UDim2.new(1, -115, 0, 0),
        BackgroundTransparency = 1,
        ZIndex = 21
    })

    local function MakeControl(name, icon, pos, callback)
        local btn = Create("ImageButton", {
            Name = name,
            Parent = Controls,
            Size = UDim2.new(0, 28, 0, 28),
            Position = pos,
            BackgroundColor3 = CurrentTheme.Element,
            AutoButtonColor = false,
            Image = GetIcon(icon),
            ImageColor3 = CurrentTheme.SubText,
            ZIndex = 22
        })
        Create("UICorner", {CornerRadius = UDim.new(0, 8), Parent = btn})
        btn.MouseEnter:Connect(function()
            Tween(btn, {BackgroundColor3 = CurrentTheme.ElementHover}, 0.15)
        end)
        btn.MouseLeave:Connect(function()
            Tween(btn, {BackgroundColor3 = CurrentTheme.Element}, 0.15)
        end)
        btn.MouseButton1Click:Connect(callback)
        return btn
    end

    MakeControl("Minimize", "Minus", UDim2.new(0, 0, 0.5, -14), function()
        IsMinimized = true
        MainFrame.Visible = false
    end)

    local IsMaximized = false
    MakeControl("Resize", "Maximize2", UDim2.new(0, 34, 0.5, -14), function()
        IsMaximized = not IsMaximized
        if IsMaximized then
            Tween(MainFrame, {Size = UDim2.new(0, 700, 0, 450)}, 0.3)
        else
            Tween(MainFrame, {Size = UDim2.new(0, 600, 0, 380)}, 0.3)
        end
    end)

    MakeControl("Close", "X", UDim2.new(0, 68, 0.5, -14), function()
        ConfirmOverlay.Visible = true
        ConfirmOverlay.BackgroundTransparency = 1
        ConfirmBox.Size = UDim2.new(0, 240, 0, 120)
        ConfirmBox.Position = UDim2.new(0.5, -120, 0.5, -60)
        Tween(ConfirmOverlay, {BackgroundTransparency = 0.4}, 0.2)
        Tween(ConfirmBox, {Size = UDim2.new(0, 280, 0, 140), Position = UDim2.new(0.5, -140, 0.5, -70)}, 0.2)
    end)

    ConfirmYes.MouseButton1Click:Connect(function()
        IsClosed = true
        MainWindowScreen.Enabled = false
        ConfirmOverlay.Visible = false
    end)

    ConfirmNo.MouseButton1Click:Connect(function()
        Tween(ConfirmOverlay, {BackgroundTransparency = 1}, 0.2).Completed:Connect(function()
            ConfirmOverlay.Visible = false
        end)
    end)

    local Sidebar = Create("Frame", {
        Name = "Sidebar",
        Parent = MainFrame,
        Size = UDim2.new(0, Config.SidebarWidth, 1, -Config.TopbarHeight),
        Position = UDim2.new(0, 0, 0, Config.TopbarHeight),
        BackgroundColor3 = CurrentTheme.Sidebar,
        BorderSizePixel = 0,
        ZIndex = 15
    })

    Create("Frame", {
        Name = "Fix",
        Parent = Sidebar,
        Size = UDim2.new(1, 0, 0, 10),
        Position = UDim2.new(0, 0, 0, -10),
        BackgroundColor3 = CurrentTheme.Sidebar,
        BorderSizePixel = 0,
        ZIndex = 15
    })

    local TabList = Create("ScrollingFrame", {
        Name = "TabList",
        Parent = Sidebar,
        Size = UDim2.new(1, -10, 1, -65),
        Position = UDim2.new(0, 5, 0, 8),
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        ScrollBarThickness = 2,
        ScrollBarImageColor3 = CurrentTheme.Accent,
        CanvasSize = UDim2.new(0, 0, 0, 0),
        AutomaticCanvasSize = Enum.AutomaticSize.Y,
        ZIndex = 16
    })

    Create("UIListLayout", {
        Parent = TabList,
        Padding = UDim.new(0, 4),
        SortOrder = Enum.SortOrder.LayoutOrder
    })

    local ThemeFrame = Create("Frame", {
        Name = "ThemeFrame",
        Parent = Sidebar,
        Size = UDim2.new(1, -10, 0, 38),
        Position = UDim2.new(0, 5, 1, -46),
        BackgroundColor3 = CurrentTheme.Element,
        BorderSizePixel = 0,
        ZIndex = 16
    })
    Create("UICorner", {CornerRadius = UDim.new(0, 10), Parent = ThemeFrame})

    Create("ImageLabel", {
        Parent = ThemeFrame,
        Size = UDim2.new(0, 16, 0, 16),
        Position = UDim2.new(0, 10, 0.5, -8),
        BackgroundTransparency = 1,
        Image = GetIcon("Palette"),
        ImageColor3 = CurrentTheme.SubText,
        ZIndex = 17
    })

    Create("TextLabel", {
        Parent = ThemeFrame,
        Size = UDim2.new(0, 80, 0, 38),
        Position = UDim2.new(0, 32, 0, 0),
        BackgroundTransparency = 1,
        Text = "Theme",
        TextColor3 = CurrentTheme.SubText,
        TextSize = 12,
        Font = Enum.Font.Gotham,
        TextXAlignment = Enum.TextXAlignment.Left,
        ZIndex = 17
    })

    local ThemeDropdown = Create("TextButton", {
        Parent = ThemeFrame,
        Size = UDim2.new(0, 75, 0, 26),
        Position = UDim2.new(1, -80, 0.5, -13),
        BackgroundColor3 = CurrentTheme.Background,
        Text = Config.DefaultTheme,
        TextColor3 = CurrentTheme.Text,
        TextSize = 11,
        Font = Enum.Font.Gotham,
        ZIndex = 17
    })
    Create("UICorner", {CornerRadius = UDim.new(0, 6), Parent = ThemeDropdown})

    local ThemeMenu = Create("Frame", {
        Parent = ThemeFrame,
        Size = UDim2.new(0, 75, 0, 0),
        Position = UDim2.new(1, -80, 0, -90),
        BackgroundColor3 = CurrentTheme.Background,
        BorderSizePixel = 0,
        ClipsDescendants = true,
        Visible = false,
        ZIndex = 25
    })
    Create("UICorner", {CornerRadius = UDim.new(0, 8), Parent = ThemeMenu})
    Create("UIStroke", {Color = CurrentTheme.Border, Thickness = 1, Parent = ThemeMenu})

    Create("UIListLayout", {
        Parent = ThemeMenu,
        Padding = UDim.new(0, 2)
    })

    local themeOpen = false
    for themeName, _ in pairs(Config.Themes) do
        local btn = Create("TextButton", {
            Parent = ThemeMenu,
            Size = UDim2.new(1, 0, 0, 26),
            BackgroundColor3 = CurrentTheme.Background,
            Text = themeName,
            TextColor3 = CurrentTheme.Text,
            TextSize = 11,
            Font = Enum.Font.Gotham,
            ZIndex = 26
        })
        btn.MouseButton1Click:Connect(function()
            ApplyTheme(themeName)
            ThemeDropdown.Text = themeName
            themeOpen = false
            ThemeMenu.Visible = false
        end)
        btn.MouseEnter:Connect(function()
            Tween(btn, {BackgroundColor3 = CurrentTheme.ElementHover}, 0.15)
        end)
        btn.MouseLeave:Connect(function()
            Tween(btn, {BackgroundColor3 = CurrentTheme.Background}, 0.15)
        end)
    end

    ThemeDropdown.MouseButton1Click:Connect(function()
        themeOpen = not themeOpen
        ThemeMenu.Visible = true
        if themeOpen then
            Tween(ThemeMenu, {Size = UDim2.new(0, 75, 0, 110)}, 0.2)
        else
            Tween(ThemeMenu, {Size = UDim2.new(0, 75, 0, 0)}, 0.2).Completed:Connect(function()
                ThemeMenu.Visible = false
            end)
        end
    end)

    local Content = Create("Frame", {
        Name = "Content",
        Parent = MainFrame,
        Size = UDim2.new(1, -Config.SidebarWidth, 1, -Config.TopbarHeight),
        Position = UDim2.new(0, Config.SidebarWidth, 0, Config.TopbarHeight),
        BackgroundColor3 = CurrentTheme.Background,
        BorderSizePixel = 0,
        ZIndex = 14
    })

    Create("Frame", {
        Name = "Fix",
        Parent = Content,
        Size = UDim2.new(0, 10, 0, 10),
        Position = UDim2.new(0, -10, 0, 0),
        BackgroundColor3 = CurrentTheme.Background,
        BorderSizePixel = 0,
        ZIndex = 14
    })

    local ResizeHandle = Create("ImageButton", {
        Name = "ResizeHandle",
        Parent = MainFrame,
        Size = UDim2.new(0, 18, 0, 18),
        Position = UDim2.new(1, -18, 1, -18),
        BackgroundTransparency = 1,
        Image = GetIcon("ChevronLeft"),
        ImageColor3 = CurrentTheme.SubText,
        ImageTransparency = 0.4,
        Rotation = -45,
        ZIndex = 30,
        Active = true
    })

    local resizing = false
    local resizeStart = nil
    local startSize = nil

    ResizeHandle.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            resizing = true
            resizeStart = input.Position
            startSize = MainFrame.Size
        end
    end)

    UserInputService.InputChanged:Connect(function(input)
        if resizing and input.UserInputType == Enum.UserInputType.MouseMovement then
            local delta = input.Position - resizeStart
            local newWidth = math.max(Config.MinWindowSize.X, startSize.X.Offset + delta.X)
            local newHeight = math.max(Config.MinWindowSize.Y, startSize.Y.Offset + delta.Y)
            MainFrame.Size = UDim2.new(0, newWidth, 0, newHeight)
        end
    end)

    UserInputService.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            resizing = false
        end
    end)

    ResizeHandle.MouseEnter:Connect(function()
        Tween(ResizeHandle, {ImageTransparency = 0.1}, 0.15)
    end)
    ResizeHandle.MouseLeave:Connect(function()
        Tween(ResizeHandle, {ImageTransparency = 0.4}, 0.15)
    end)

    local dragging = false
    local dragStart = nil
    local startPos = nil

    Topbar.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = true
            dragStart = input.Position
            startPos = MainFrame.Position
        end
    end)

    UserInputService.InputChanged:Connect(function(input)
        if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
            local delta = input.Position - dragStart
            MainFrame.Position = UDim2.new(
                startPos.X.Scale, startPos.X.Offset + delta.X,
                startPos.Y.Scale, startPos.Y.Offset + delta.Y
            )
        end
    end)

    UserInputService.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = false
        end
    end)

    if toggleKey then
        UserInputService.InputBegan:Connect(function(input, gpe)
            if not gpe and input.KeyCode == toggleKey then
                if MainFrame then
                    MainFrame.Visible = not MainFrame.Visible
                    IsMinimized = not MainFrame.Visible
                end
            end
        end)
    end

    ListenTheme(function(theme)
        MainFrame.BackgroundColor3 = theme.Background
        Shadow.ImageColor3 = theme.Shadow
        Topbar.BackgroundColor3 = theme.Sidebar
        TopbarFix.BackgroundColor3 = theme.Sidebar
        Sidebar.BackgroundColor3 = theme.Sidebar
        Content.BackgroundColor3 = theme.Background
        Title.TextColor3 = theme.Text
        Version.TextColor3 = theme.SubText
        TitleIcon.ImageColor3 = theme.Accent
        TabList.ScrollBarImageColor3 = theme.Accent
        ThemeFrame.BackgroundColor3 = theme.Element
        ThemeDropdown.BackgroundColor3 = theme.Background
        ThemeDropdown.TextColor3 = theme.Text
        ThemeMenu.BackgroundColor3 = theme.Background
        ConfirmOverlay.BackgroundColor3 = theme.Overlay
        ConfirmBox.BackgroundColor3 = theme.Background
        ConfirmNo.BackgroundColor3 = theme.Element
        ConfirmNo.TextColor3 = theme.Text
        ResizeHandle.ImageColor3 = theme.SubText
        for _, child in ipairs(ThemeMenu:GetChildren()) do
            if child:IsA("TextButton") then
                child.BackgroundColor3 = theme.Background
                child.TextColor3 = theme.Text
            end
        end
    end)

    Tween(MainFrame, {Size = UDim2.new(0, 600, 0, 380)}, 0.4, Enum.EasingStyle.Back)
    MainFrame.Position = UDim2.new(0.5, -300, 0.5, -190)

    local WindowAPI = {}
    WindowAPI.Notify = function(_, d) Quantum:Notify(d) end
    WindowAPI.SetTheme = function(_, name) ApplyTheme(name) end

    local Tabs = {}
    local ActiveTab = nil

    function WindowAPI:CreateTab(tabData)
        tabData = tabData or {}
        local tabName = tabData.Name or "Tab"
        local tabIcon = tabData.Icon or "Settings"

        local TabBtn = Create("TextButton", {
            Parent = TabList,
            Size = UDim2.new(1, -4, 0, 36),
            BackgroundColor3 = CurrentTheme.Element,
            Text = "",
            AutoButtonColor = false,
            LayoutOrder = #Tabs + 1,
            ZIndex = 17
        })
        Create("UICorner", {CornerRadius = UDim.new(0, 10), Parent = TabBtn})

        local TabBtnIcon = Create("ImageLabel", {
            Parent = TabBtn,
            Size = UDim2.new(0, 18, 0, 18),
            Position = UDim2.new(0, 10, 0.5, -9),
            BackgroundTransparency = 1,
            Image = GetIcon(tabIcon),
            ImageColor3 = CurrentTheme.SubText,
            ZIndex = 18
        })

        local TabBtnText = Create("TextLabel", {
            Parent = TabBtn,
            Size = UDim2.new(0, 130, 0, 36),
            Position = UDim2.new(0, 34, 0, 0),
            BackgroundTransparency = 1,
            Text = tabName,
            TextColor3 = CurrentTheme.SubText,
            TextSize = 13,
            Font = Enum.Font.Gotham,
            TextXAlignment = Enum.TextXAlignment.Left,
            ZIndex = 18
        })

        local TabIndicator = Create("Frame", {
            Parent = TabBtn,
            Size = UDim2.new(0, 3, 0.5, 0),
            Position = UDim2.new(0, 0, 0.25, 0),
            BackgroundColor3 = CurrentTheme.Accent,
            BorderSizePixel = 0,
            Visible = false,
            ZIndex = 18
        })
        Create("UICorner", {CornerRadius = UDim.new(0, 2), Parent = TabIndicator})

        local TabContent = Create("ScrollingFrame", {
            Parent = Content,
            Size = UDim2.new(1, -16, 1, -16),
            Position = UDim2.new(0, 8, 0, 8),
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            ScrollBarThickness = 3,
            ScrollBarImageColor3 = CurrentTheme.Accent,
            CanvasSize = UDim2.new(0, 0, 0, 0),
            AutomaticCanvasSize = Enum.AutomaticSize.Y,
            Visible = false,
            ZIndex = 15
        })

        Create("UIListLayout", {
            Parent = TabContent,
            Padding = UDim.new(0, 8),
            SortOrder = Enum.SortOrder.LayoutOrder
        })

        local function Activate()
            if ActiveTab then
                ActiveTab.Content.Visible = false
                ActiveTab.Indicator.Visible = false
                Tween(ActiveTab.Button, {BackgroundColor3 = CurrentTheme.Element}, 0.2)
                Tween(ActiveTab.Icon, {ImageColor3 = CurrentTheme.SubText}, 0.2)
                Tween(ActiveTab.Label, {TextColor3 = CurrentTheme.SubText}, 0.2)
            end

            ActiveTab = {
                Button = TabBtn,
                Content = TabContent,
                Icon = TabBtnIcon,
                Label = TabBtnText,
                Indicator = TabIndicator
            }

            TabContent.Visible = true
            TabIndicator.Visible = true
            Tween(TabBtn, {BackgroundColor3 = CurrentTheme.ElementHover}, 0.2)
            Tween(TabBtnIcon, {ImageColor3 = CurrentTheme.Accent}, 0.2)
            Tween(TabBtnText, {TextColor3 = CurrentTheme.Text}, 0.2)
        end

        TabBtn.MouseButton1Click:Connect(Activate)
        TabBtn.MouseEnter:Connect(function()
            if ActiveTab and ActiveTab.Button == TabBtn then return end
            Tween(TabBtn, {BackgroundColor3 = CurrentTheme.ElementHover}, 0.15)
        end)
        TabBtn.MouseLeave:Connect(function()
            if ActiveTab and ActiveTab.Button == TabBtn then return end
            Tween(TabBtn, {BackgroundColor3 = CurrentTheme.Element}, 0.15)
        end)

        table.insert(Tabs, {Activate = Activate})
        if #Tabs == 1 then Activate() end

        ListenTheme(function(theme)
            if ActiveTab and ActiveTab.Button == TabBtn then
                TabBtn.BackgroundColor3 = theme.ElementHover
                TabBtnIcon.ImageColor3 = theme.Accent
                TabBtnText.TextColor3 = theme.Text
            else
                TabBtn.BackgroundColor3 = theme.Element
                TabBtnIcon.ImageColor3 = theme.SubText
                TabBtnText.TextColor3 = theme.SubText
            end
            TabIndicator.BackgroundColor3 = theme.Accent
            TabContent.ScrollBarImageColor3 = theme.Accent
        end)

        local TabAPI = {}

        function TabAPI:CreateSection(sectionData)
            sectionData = sectionData or {}
            local sectionName = sectionData.Name or "Section"
            local sectionIcon = sectionData.Icon or "Folder"
            local collapsed = sectionData.Collapsed or false

            local SectionFrame = Create("Frame", {
                Parent = TabContent,
                Size = UDim2.new(1, 0, 0, 42),
                BackgroundColor3 = CurrentTheme.Element,
                BorderSizePixel = 0,
                ClipsDescendants = true,
                LayoutOrder = #TabContent:GetChildren(),
                ZIndex = 16
            })
            Create("UICorner", {CornerRadius = UDim.new(0, Config.ElementCorner), Parent = SectionFrame})

            local SectionHeader = Create("TextButton", {
                Parent = SectionFrame,
                Size = UDim2.new(1, 0, 0, 42),
                BackgroundColor3 = CurrentTheme.Element,
                Text = "",
                AutoButtonColor = false,
                ZIndex = 17
            })
            Create("UICorner", {CornerRadius = UDim.new(0, Config.ElementCorner), Parent = SectionHeader})

            Create("ImageLabel", {
                Parent = SectionHeader,
                Size = UDim2.new(0, 16, 0, 16),
                Position = UDim2.new(0, 12, 0.5, -8),
                BackgroundTransparency = 1,
                Image = GetIcon(sectionIcon),
                ImageColor3 = CurrentTheme.Accent,
                ZIndex = 18
            })

            Create("TextLabel", {
                Parent = SectionHeader,
                Size = UDim2.new(0, 200, 0, 42),
                Position = UDim2.new(0, 36, 0, 0),
                BackgroundTransparency = 1,
                Text = sectionName,
                TextColor3 = CurrentTheme.Text,
                TextSize = 13,
                Font = Enum.Font.GothamBold,
                TextXAlignment = Enum.TextXAlignment.Left,
                ZIndex = 18
            })

            local Arrow = Create("ImageLabel", {
                Parent = SectionHeader,
                Size = UDim2.new(0, 16, 0, 16),
                Position = UDim2.new(1, -30, 0.5, -8),
                BackgroundTransparency = 1,
                Image = GetIcon("ChevronDown"),
                ImageColor3 = CurrentTheme.SubText,
                ZIndex = 18
            })

            local SectionItems = Create("Frame", {
                Parent = SectionFrame,
                Size = UDim2.new(1, -16, 0, 0),
                Position = UDim2.new(0, 8, 0, 42),
                BackgroundTransparency = 1,
                BorderSizePixel = 0,
                ZIndex = 17
            })

            Create("UIListLayout", {
                Parent = SectionItems,
                Padding = UDim.new(0, 6),
                SortOrder = Enum.SortOrder.LayoutOrder
            })

            local isCollapsed = collapsed
            local targetHeight = 42

            local function UpdateSize()
                local itemsHeight = SectionItems.UIListLayout.AbsoluteContentSize.Y
                targetHeight = 42 + itemsHeight + 10
                if isCollapsed then
                    Tween(SectionFrame, {Size = UDim2.new(1, 0, 0, 42)}, 0.25)
                    Tween(Arrow, {Rotation = 0}, 0.25)
                else
                    Tween(SectionFrame, {Size = UDim2.new(1, 0, 0, targetHeight)}, 0.25)
                    Tween(Arrow, {Rotation = 180}, 0.25)
                end
                task.wait(0.3)
                TabContent.CanvasSize = UDim2.new(0, 0, 0, TabContent.UIListLayout.AbsoluteContentSize.Y + 20)
            end

            SectionHeader.MouseButton1Click:Connect(function()
                isCollapsed = not isCollapsed
                UpdateSize()
            end)

            if not collapsed then
                Arrow.Rotation = 180
                task.wait(0.05)
                SectionFrame.Size = UDim2.new(1, 0, 0, targetHeight)
            end

            ListenTheme(function(theme)
                SectionFrame.BackgroundColor3 = theme.Element
                SectionHeader.BackgroundColor3 = theme.Element
                Arrow.ImageColor3 = theme.SubText
            end)

            SectionItems.ChildAdded:Connect(function()
                task.wait(0.1)
                if not isCollapsed then
                    UpdateSize()
                end
            end)

            local SectionAPI = {}

            function SectionAPI:CreateToggle(toggleData)
                toggleData = toggleData or {}
                local toggleName = toggleData.Name or "Toggle"
                local toggleIcon = toggleData.Icon or "ToggleLeft"
                local default = toggleData.Default or false
                local callback = toggleData.Callback or function() end
                local desc = toggleData.Desc

                local hasDesc = desc and desc ~= ""
                local frameHeight = hasDesc and 52 or 36

                local ToggleFrame = Create("Frame", {
                    Parent = SectionItems,
                    Size = UDim2.new(1, 0, 0, frameHeight),
                    BackgroundColor3 = CurrentTheme.Background,
                    BorderSizePixel = 0,
                    LayoutOrder = #SectionItems:GetChildren(),
                    ZIndex = 18
                })
                Create("UICorner", {CornerRadius = UDim.new(0, 8), Parent = ToggleFrame})

                Create("ImageLabel", {
                    Parent = ToggleFrame,
                    Size = UDim2.new(0, 14, 0, 14),
                    Position = UDim2.new(0, 10, 0, hasDesc and 8 or 11),
                    BackgroundTransparency = 1,
                    Image = GetIcon(toggleIcon),
                    ImageColor3 = CurrentTheme.SubText,
                    ZIndex = 19
                })

                Create("TextLabel", {
                    Parent = ToggleFrame,
                    Size = UDim2.new(0, 200, 0, 18),
                    Position = UDim2.new(0, 30, 0, hasDesc and 4 or 9),
                    BackgroundTransparency = 1,
                    Text = toggleName,
                    TextColor3 = CurrentTheme.Text,
                    TextSize = 12,
                    Font = Enum.Font.Gotham,
                    TextXAlignment = Enum.TextXAlignment.Left,
                    ZIndex = 19
                })

                if hasDesc then
                    Create("TextLabel", {
                        Parent = ToggleFrame,
                        Size = UDim2.new(0, 200, 0, 14),
                        Position = UDim2.new(0, 30, 0, 22),
                        BackgroundTransparency = 1,
                        Text = desc,
                        TextColor3 = CurrentTheme.SubText,
                        TextSize = 10,
                        Font = Enum.Font.Gotham,
                        TextXAlignment = Enum.TextXAlignment.Left,
                        ZIndex = 19
                    })
                end

                local ToggleBtn = Create("Frame", {
                    Parent = ToggleFrame,
                    Size = UDim2.new(0, 40, 0, 22),
                    Position = UDim2.new(1, -50, 0.5, -11),
                    BackgroundColor3 = CurrentTheme.ToggleOff,
                    BorderSizePixel = 0,
                    ZIndex = 19
                })
                Create("UICorner", {CornerRadius = UDim.new(1, 0), Parent = ToggleBtn})

                local ToggleCircle = Create("Frame", {
                    Parent = ToggleBtn,
                    Size = UDim2.new(0, 18, 0, 18),
                    Position = UDim2.new(0, 2, 0.5, -9),
                    BackgroundColor3 = CurrentTheme.Text,
                    BorderSizePixel = 0,
                    ZIndex = 20
                })
                Create("UICorner", {CornerRadius = UDim.new(1, 0), Parent = ToggleCircle})

                local ToggleClick = Create("TextButton", {
                    Parent = ToggleFrame,
                    Size = UDim2.new(1, 0, 1, 0),
                    BackgroundTransparency = 1,
                    Text = "",
                    ZIndex = 25
                })

                local state = default
                if default then
                    ToggleBtn.BackgroundColor3 = CurrentTheme.ToggleOn
                    ToggleCircle.Position = UDim2.new(0, 20, 0.5, -9)
                end

                ToggleClick.MouseButton1Click:Connect(function()
                    state = not state
                    if state then
                        Tween(ToggleBtn, {BackgroundColor3 = CurrentTheme.ToggleOn}, 0.2)
                        Tween(ToggleCircle, {Position = UDim2.new(0, 20, 0.5, -9)}, 0.2)
                    else
                        Tween(ToggleBtn, {BackgroundColor3 = CurrentTheme.ToggleOff}, 0.2)
                        Tween(ToggleCircle, {Position = UDim2.new(0, 2, 0.5, -9)}, 0.2)
                    end
                    callback(state)
                end)

                ListenTheme(function(theme)
                    ToggleFrame.BackgroundColor3 = theme.Background
                    ToggleCircle.BackgroundColor3 = theme.Text
                    if state then
                        ToggleBtn.BackgroundColor3 = theme.ToggleOn
                    else
                        ToggleBtn.BackgroundColor3 = theme.ToggleOff
                    end
                end)

                return {
                    Set = function(v)
                        state = v
                        if state then
                            ToggleBtn.BackgroundColor3 = CurrentTheme.ToggleOn
                            ToggleCircle.Position = UDim2.new(0, 20, 0.5, -9)
                        else
                            ToggleBtn.BackgroundColor3 = CurrentTheme.ToggleOff
                            ToggleCircle.Position = UDim2.new(0, 2, 0.5, -9)
                        end
                        callback(state)
                    end,
                    Get = function() return state end
                }
            end

            function SectionAPI:CreateSlider(sliderData)
                sliderData = sliderData or {}
                local sliderName = sliderData.Name or "Slider"
                local sliderIcon = sliderData.Icon or "Sliders"
                local min = sliderData.Min or 0
                local max = sliderData.Max or 100
                local default = sliderData.Default or min
                local increment = sliderData.Increment or 1
                local callback = sliderData.Callback or function() end
                local desc = sliderData.Desc

                local hasDesc = desc and desc ~= ""
                local frameHeight = hasDesc and 68 or 52

                local SliderFrame = Create("Frame", {
                    Parent = SectionItems,
                    Size = UDim2.new(1, 0, 0, frameHeight),
                    BackgroundColor3 = CurrentTheme.Background,
                    BorderSizePixel = 0,
                    LayoutOrder = #SectionItems:GetChildren(),
                    ZIndex = 18
                })
                Create("UICorner", {CornerRadius = UDim.new(0, 8), Parent = SliderFrame})

                Create("ImageLabel", {
                    Parent = SliderFrame,
                    Size = UDim2.new(0, 14, 0, 14),
                    Position = UDim2.new(0, 10, 0, hasDesc and 8 or 9),
                    BackgroundTransparency = 1,
                    Image = GetIcon(sliderIcon),
                    ImageColor3 = CurrentTheme.SubText,
                    ZIndex = 19
                })

                Create("TextLabel", {
                    Parent = SliderFrame,
                    Size = UDim2.new(0, 150, 0, 18),
                    Position = UDim2.new(0, 30, 0, hasDesc and 4 or 7),
                    BackgroundTransparency = 1,
                    Text = sliderName,
                    TextColor3 = CurrentTheme.Text,
                    TextSize = 12,
                    Font = Enum.Font.Gotham,
                    TextXAlignment = Enum.TextXAlignment.Left,
                    ZIndex = 19
                })

                if hasDesc then
                    Create("TextLabel", {
                        Parent = SliderFrame,
                        Size = UDim2.new(0, 200, 0, 14),
                        Position = UDim2.new(0, 30, 0, 22),
                        BackgroundTransparency = 1,
                        Text = desc,
                        TextColor3 = CurrentTheme.SubText,
                        TextSize = 10,
                        Font = Enum.Font.Gotham,
                        TextXAlignment = Enum.TextXAlignment.Left,
                        ZIndex = 19
                    })
                end

                local ValueLabel = Create("TextLabel", {
                    Parent = SliderFrame,
                    Size = UDim2.new(0, 50, 0, 18),
                    Position = UDim2.new(1, -55, 0, hasDesc and 4 or 7),
                    BackgroundTransparency = 1,
                    Text = tostring(default),
                    TextColor3 = CurrentTheme.Accent,
                    TextSize = 12,
                    Font = Enum.Font.GothamBold,
                    TextXAlignment = Enum.TextXAlignment.Right,
                    ZIndex = 19
                })

                local Track = Create("Frame", {
                    Parent = SliderFrame,
                    Size = UDim2.new(1, -20, 0, 6),
                    Position = UDim2.new(0, 10, 0, hasDesc and 46 or 34),
                    BackgroundColor3 = CurrentTheme.Element,
                    BorderSizePixel = 0,
                    ZIndex = 19
                })
                Create("UICorner", {CornerRadius = UDim.new(1, 0), Parent = Track})

                local Fill = Create("Frame", {
                    Parent = Track,
                    Size = UDim2.new((default - min) / (max - min), 0, 1, 0),
                    BackgroundColor3 = CurrentTheme.Accent,
                    BorderSizePixel = 0,
                    ZIndex = 20
                })
                Create("UICorner", {CornerRadius = UDim.new(1, 0), Parent = Fill})

                local Knob = Create("Frame", {
                    Parent = Track,
                    Size = UDim2.new(0, 14, 0, 14),
                    Position = UDim2.new((default - min) / (max - min), -7, 0.5, -7),
                    BackgroundColor3 = CurrentTheme.Text,
                    BorderSizePixel = 0,
                    ZIndex = 21
                })
                Create("UICorner", {CornerRadius = UDim.new(1, 0), Parent = Knob})

                local draggingSlider = false

                local function UpdateSlider(input)
                    local pos = math.clamp((input.Position.X - Track.AbsolutePosition.X) / Track.AbsoluteSize.X, 0, 1)
                    local value = math.clamp(Round(min + (pos * (max - min)), math.log10(1/increment)), min, max)
                    value = math.floor(value / increment + 0.5) * increment
                    Fill.Size = UDim2.new((value - min) / (max - min), 0, 1, 0)
                    Knob.Position = UDim2.new((value - min) / (max - min), -7, 0.5, -7)
                    ValueLabel.Text = tostring(value)
                    callback(value)
                end

                Knob.InputBegan:Connect(function(input)
                    if input.UserInputType == Enum.UserInputType.MouseButton1 then
                        draggingSlider = true
                    end
                end)

                Track.InputBegan:Connect(function(input)
                    if input.UserInputType == Enum.UserInputType.MouseButton1 then
                        draggingSlider = true
                        UpdateSlider(input)
                    end
                end)

                UserInputService.InputChanged:Connect(function(input)
                    if draggingSlider and input.UserInputType == Enum.UserInputType.MouseMovement then
                        UpdateSlider(input)
                    end
                end)

                UserInputService.InputEnded:Connect(function(input)
                    if input.UserInputType == Enum.UserInputType.MouseButton1 then
                        draggingSlider = false
                    end
                end)

                ListenTheme(function(theme)
                    SliderFrame.BackgroundColor3 = theme.Background
                    Track.BackgroundColor3 = theme.Element
                    Fill.BackgroundColor3 = theme.Accent
                    Knob.BackgroundColor3 = theme.Text
                    ValueLabel.TextColor3 = theme.Accent
                end)

                return {
                    Set = function(v)
                        v = math.clamp(v, min, max)
                        Fill.Size = UDim2.new((v - min) / (max - min), 0, 1, 0)
                        Knob.Position = UDim2.new((v - min) / (max - min), -7, 0.5, -7)
                        ValueLabel.Text = tostring(v)
                        callback(v)
                    end,
                    Get = function() return tonumber(ValueLabel.Text) end
                }
            end

            function SectionAPI:CreateButton(buttonData)
                buttonData = buttonData or {}
                local buttonName = buttonData.Name or "Button"
                local buttonIcon = buttonData.Icon or "Command"
                local callback = buttonData.Callback or function() end
                local desc = buttonData.Desc

                local hasDesc = desc and desc ~= ""
                local frameHeight = hasDesc and 50 or 34

                local Btn = Create("TextButton", {
                    Parent = SectionItems,
                    Size = UDim2.new(1, 0, 0, frameHeight),
                    BackgroundColor3 = CurrentTheme.Accent,
                    Text = "",
                    AutoButtonColor = false,
                    LayoutOrder = #SectionItems:GetChildren(),
                    ZIndex = 18
                })
                Create("UICorner", {CornerRadius = UDim.new(0, 8), Parent = Btn})

                Create("ImageLabel", {
                    Parent = Btn,
                    Size = UDim2.new(0, 14, 0, 14),
                    Position = UDim2.new(0, 10, 0, hasDesc and 8 or 10),
                    BackgroundTransparency = 1,
                    Image = GetIcon(buttonIcon),
                    ImageColor3 = CurrentTheme.Text,
                    ZIndex = 19
                })

                Create("TextLabel", {
                    Parent = Btn,
                    Size = UDim2.new(0, 200, 0, 18),
                    Position = UDim2.new(0, 30, 0, hasDesc and 4 or 8),
                    BackgroundTransparency = 1,
                    Text = buttonName,
                    TextColor3 = CurrentTheme.Text,
                    TextSize = 12,
                    Font = Enum.Font.GothamBold,
                    TextXAlignment = Enum.TextXAlignment.Left,
                    ZIndex = 19
                })

                if hasDesc then
                    Create("TextLabel", {
                        Parent = Btn,
                        Size = UDim2.new(0, 200, 0, 14),
                        Position = UDim2.new(0, 30, 0, 22),
                        BackgroundTransparency = 1,
                        Text = desc,
                        TextColor3 = CurrentTheme.Text,
                        TextTransparency = 0.3,
                        TextSize = 10,
                        Font = Enum.Font.Gotham,
                        TextXAlignment = Enum.TextXAlignment.Left,
                        ZIndex = 19
                    })
                end

                Btn.MouseEnter:Connect(function()
                    Tween(Btn, {BackgroundColor3 = Color3.fromRGB(
                        math.clamp(CurrentTheme.Accent.R * 255 + 20, 0, 255),
                        math.clamp(CurrentTheme.Accent.G * 255 + 20, 0, 255),
                        math.clamp(CurrentTheme.Accent.B * 255 + 20, 0, 255)
                    )}, 0.15)
                end)
                Btn.MouseLeave:Connect(function()
                    Tween(Btn, {BackgroundColor3 = CurrentTheme.Accent}, 0.15)
                end)
                Btn.MouseButton1Click:Connect(function()
                    Tween(Btn, {Size = UDim2.new(0.98, 0, 0, frameHeight - 2)}, 0.05).Completed:Connect(function()
                        Tween(Btn, {Size = UDim2.new(1, 0, 0, frameHeight)}, 0.1)
                    end)
                    callback()
                end)

                ListenTheme(function(theme)
                    Btn.BackgroundColor3 = theme.Accent
                end)

                return Btn
            end

            function SectionAPI:CreateDropdown(dropdownData)
                dropdownData = dropdownData or {}
                local dropdownName = dropdownData.Name or "Dropdown"
                local dropdownIcon = dropdownData.Icon or "ChevronDown"
                local options = dropdownData.Options or dropdownData.Values or {}
                local default = dropdownData.Default or ""
                local callback = dropdownData.Callback or function() end
                local desc = dropdownData.Desc

                local hasDesc = desc and desc ~= ""
                local frameHeight = hasDesc and 48 or 32

                local DropdownFrame = Create("Frame", {
                    Parent = SectionItems,
                    Size = UDim2.new(1, 0, 0, frameHeight),
                    BackgroundColor3 = CurrentTheme.Background,
                    BorderSizePixel = 0,
                    LayoutOrder = #SectionItems:GetChildren(),
                    ClipsDescendants = false,
                    ZIndex = 18
                })
                Create("UICorner", {CornerRadius = UDim.new(0, 8), Parent = DropdownFrame})

                Create("ImageLabel", {
                    Parent = DropdownFrame,
                    Size = UDim2.new(0, 14, 0, 14),
                    Position = UDim2.new(0, 10, 0, hasDesc and 8 or 9),
                    BackgroundTransparency = 1,
                    Image = GetIcon(dropdownIcon),
                    ImageColor3 = CurrentTheme.SubText,
                    ZIndex = 19
                })

                Create("TextLabel", {
                    Parent = DropdownFrame,
                    Size = UDim2.new(0, 100, 0, 18),
                    Position = UDim2.new(0, 30, 0, hasDesc and 4 or 7),
                    BackgroundTransparency = 1,
                    Text = dropdownName,
                    TextColor3 = CurrentTheme.Text,
                    TextSize = 12,
                    Font = Enum.Font.Gotham,
                    TextXAlignment = Enum.TextXAlignment.Left,
                    ZIndex = 19
                })

                if hasDesc then
                    Create("TextLabel", {
                        Parent = DropdownFrame,
                        Size = UDim2.new(0, 200, 0, 14),
                        Position = UDim2.new(0, 30, 0, 22),
                        BackgroundTransparency = 1,
                        Text = desc,
                        TextColor3 = CurrentTheme.SubText,
                        TextSize = 10,
                        Font = Enum.Font.Gotham,
                        TextXAlignment = Enum.TextXAlignment.Left,
                        ZIndex = 19
                    })
                end

                local DropdownBtn = Create("TextButton", {
                    Parent = DropdownFrame,
                    Size = UDim2.new(0, 130, 0, 24),
                    Position = UDim2.new(1, -140, 0, hasDesc and 12 or 4),
                    BackgroundColor3 = CurrentTheme.Element,
                    Text = "",
                    TextColor3 = CurrentTheme.Text,
                    TextSize = 11,
                    Font = Enum.Font.Gotham,
                    TextTruncate = Enum.TextTruncate.AtEnd,
                    ZIndex = 19
                })
                Create("UICorner", {CornerRadius = UDim.new(0, 6), Parent = DropdownBtn})

                local Arrow = Create("ImageLabel", {
                    Parent = DropdownBtn,
                    Size = UDim2.new(0, 12, 0, 12),
                    Position = UDim2.new(1, -18, 0.5, -6),
                    BackgroundTransparency = 1,
                    Image = GetIcon("ChevronDown"),
                    ImageColor3 = CurrentTheme.SubText,
                    ZIndex = 20
                })

                local defaultText, _ = NormalizeOption(default)
                if defaultText ~= "" then
                    DropdownBtn.Text = defaultText
                    DropdownBtn.TextColor3 = CurrentTheme.Text
                else
                    DropdownBtn.Text = "Select option"
                    DropdownBtn.TextColor3 = CurrentTheme.SubText
                end

                local MenuFrame = Create("Frame", {
                    Parent = MainFrame,
                    Size = UDim2.new(0, 0, 0, 0),
                    Position = UDim2.new(0, 0, 0, 0),
                    BackgroundColor3 = CurrentTheme.Background,
                    BorderSizePixel = 0,
                    ClipsDescendants = false,
                    Visible = false,
                    ZIndex = 100
                })
                Create("UICorner", {CornerRadius = UDim.new(0, 8), Parent = MenuFrame})
                Create("UIStroke", {Color = CurrentTheme.Border, Thickness = 1, Parent = MenuFrame})

                local SearchBox = Create("TextBox", {
                    Parent = MenuFrame,
                    Size = UDim2.new(1, -12, 0, 26),
                    Position = UDim2.new(0, 6, 0, 6),
                    BackgroundColor3 = CurrentTheme.Element,
                    Text = "",
                    PlaceholderText = "Search...",
                    TextColor3 = CurrentTheme.Text,
                    PlaceholderColor3 = CurrentTheme.SubText,
                    TextSize = 11,
                    Font = Enum.Font.Gotham,
                    ClearTextOnFocus = false,
                    ZIndex = 31
                })
                Create("UICorner", {CornerRadius = UDim.new(0, 6), Parent = SearchBox})

                Create("ImageLabel", {
                    Parent = SearchBox,
                    Size = UDim2.new(0, 12, 0, 12),
                    Position = UDim2.new(1, -22, 0.5, -6),
                    BackgroundTransparency = 1,
                    Image = GetIcon("Search"),
                    ImageColor3 = CurrentTheme.SubText,
                    ZIndex = 32
                })

                local OptionsScroll = Create("ScrollingFrame", {
                    Parent = MenuFrame,
                    Size = UDim2.new(1, -12, 0, 0),
                    Position = UDim2.new(0, 6, 0, 38),
                    BackgroundTransparency = 1,
                    BorderSizePixel = 0,
                    ScrollBarThickness = 2,
                    ScrollBarImageColor3 = CurrentTheme.Accent,
                    CanvasSize = UDim2.new(0, 0, 0, 0),
                    ZIndex = 31
                })

                Create("UIListLayout", {
                    Parent = OptionsScroll,
                    Padding = UDim.new(0, 2)
                })

                local isOpen = false
                local selected = default
                local optionButtons = {}

                local function BuildOptions(filterText)
                    for _, btn in ipairs(optionButtons) do
                        if btn then btn:Destroy() end
                    end
                    optionButtons = {}

                    local count = 0
                    for _, opt in ipairs(options) do
                        local optText, optIcon = NormalizeOption(opt)
                        if not filterText or filterText == "" or string.find(string.lower(optText), string.lower(filterText), 1, true) then
                            local optBtn = Create("TextButton", {
                                Parent = OptionsScroll,
                                Size = UDim2.new(1, 0, 0, 24),
                                BackgroundColor3 = CurrentTheme.Element,
                                Text = "",
                                TextColor3 = CurrentTheme.Text,
                                TextSize = 11,
                                Font = Enum.Font.Gotham,
                                ZIndex = 32
                            })
                            Create("UICorner", {CornerRadius = UDim.new(0, 4), Parent = optBtn})

                            if optIcon then
                                Create("ImageLabel", {
                                    Parent = optBtn,
                                    Size = UDim2.new(0, 14, 0, 14),
                                    Position = UDim2.new(0, 6, 0.5, -7),
                                    BackgroundTransparency = 1,
                                    Image = GetIcon(optIcon),
                                    ImageColor3 = CurrentTheme.SubText,
                                    ZIndex = 33,
                                })
                                local txt = Create("TextLabel", {
                                    Parent = optBtn,
                                    Size = UDim2.new(1, -28, 1, 0),
                                    Position = UDim2.new(0, 22, 0, 0),
                                    BackgroundTransparency = 1,
                                    Text = optText,
                                    TextColor3 = CurrentTheme.Text,
                                    TextSize = 11,
                                    Font = Enum.Font.Gotham,
                                    TextXAlignment = Enum.TextXAlignment.Left,
                                    ZIndex = 33,
                                })
                            else
                                optBtn.Text = optText
                            end

                            optBtn.MouseButton1Click:Connect(function()
                                selected = opt
                                local selText, _ = NormalizeOption(selected)
                                DropdownBtn.Text = selText
                                DropdownBtn.TextColor3 = CurrentTheme.Text
                                callback(selected)
                                isOpen = false
                                MenuFrame.Visible = false
                                MenuFrame.Size = UDim2.new(0, 160, 0, 0)
                                Arrow.Rotation = 0
                            end)

                            optBtn.MouseEnter:Connect(function()
                                Tween(optBtn, {BackgroundColor3 = CurrentTheme.Accent}, 0.1)
                            end)
                            optBtn.MouseLeave:Connect(function()
                                Tween(optBtn, {BackgroundColor3 = CurrentTheme.Element}, 0.1)
                            end)

                            table.insert(optionButtons, optBtn)
                            count = count + 1
                        end
                    end

                    local listHeight = math.min(count * 26 + 4, 120)
                    OptionsScroll.Size = UDim2.new(1, -12, 0, listHeight)
                    OptionsScroll.CanvasSize = UDim2.new(0, 0, 0, count * 26 + 4)
                end

                BuildOptions("")

                SearchBox:GetPropertyChangedSignal("Text"):Connect(function()
                    BuildOptions(SearchBox.Text)
                end)

                local function UpdateMenuPosition()
                    if not DropdownBtn or not DropdownBtn.Parent then return end
                    local btnPos = DropdownBtn.AbsolutePosition
                    local mainPos = MainFrame.AbsolutePosition
                    local x = btnPos.X - mainPos.X
                    local y = btnPos.Y - mainPos.Y + DropdownBtn.AbsoluteSize.Y + 4
                    local w = DropdownBtn.AbsoluteSize.X
                    MenuFrame.Position = UDim2.new(0, x, 0, y)
                    MenuFrame.Size = UDim2.new(0, w, 0, MenuFrame.Size.Y.Offset)
                end

                DropdownBtn.MouseButton1Click:Connect(function()
                    isOpen = not isOpen
                    if isOpen then
                        UpdateMenuPosition()
                        MenuFrame.Visible = true
                        local menuHeight = math.min(#options * 26 + 50, 170)
                        Tween(MenuFrame, {Size = UDim2.new(0, DropdownBtn.AbsoluteSize.X, 0, menuHeight)}, 0.2)
                        Arrow.Rotation = 180
                        SearchBox.Text = ""
                        BuildOptions("")
                    else
                        Tween(MenuFrame, {Size = UDim2.new(0, MenuFrame.Size.X.Offset, 0, 0)}, 0.2).Completed:Connect(function()
                            MenuFrame.Visible = false
                        end)
                        Arrow.Rotation = 0
                    end
                end)

                ListenTheme(function(theme)
                    DropdownFrame.BackgroundColor3 = theme.Background
                    DropdownBtn.BackgroundColor3 = theme.Element
                    local selText, _ = NormalizeOption(selected)
                    DropdownBtn.TextColor3 = selText ~= "" and selText ~= "Select option" and theme.Text or theme.SubText
                    Arrow.ImageColor3 = theme.SubText
                    MenuFrame.BackgroundColor3 = theme.Background
                    SearchBox.BackgroundColor3 = theme.Element
                    SearchBox.TextColor3 = theme.Text
                    SearchBox.PlaceholderColor3 = theme.SubText
                    OptionsScroll.ScrollBarImageColor3 = theme.Accent
                    for _, btn in ipairs(optionButtons) do
                        if btn and btn.Parent then
                            btn.BackgroundColor3 = theme.Element
                            if btn:IsA("TextButton") and btn.Text ~= "" then
                                btn.TextColor3 = theme.Text
                            end
                        end
                    end
                end)

                return {
                    Set = function(v)
                        selected = v
                        local selText, _ = NormalizeOption(selected)
                        DropdownBtn.Text = selText
                        DropdownBtn.TextColor3 = CurrentTheme.Text
                        callback(v)
                    end,
                    Get = function() return selected end,
                    Refresh = function(newOptions)
                        options = newOptions
                        BuildOptions(SearchBox.Text)
                    end
                }
            end

            function SectionAPI:CreateMultiDropdown(dropdownData)
                dropdownData = dropdownData or {}
                local dropdownName = dropdownData.Name or "MultiDropdown"
                local dropdownIcon = dropdownData.Icon or "ChevronDown"
                local options = dropdownData.Options or dropdownData.Values or {}
                local default = dropdownData.Default or {}
                local callback = dropdownData.Callback or function() end
                local desc = dropdownData.Desc

                local hasDesc = desc and desc ~= ""
                local frameHeight = hasDesc and 48 or 32

                local DropdownFrame = Create("Frame", {
                    Parent = SectionItems,
                    Size = UDim2.new(1, 0, 0, frameHeight),
                    BackgroundColor3 = CurrentTheme.Background,
                    BorderSizePixel = 0,
                    LayoutOrder = #SectionItems:GetChildren(),
                    ClipsDescendants = false,
                    ZIndex = 18
                })
                Create("UICorner", {CornerRadius = UDim.new(0, 8), Parent = DropdownFrame})

                Create("ImageLabel", {
                    Parent = DropdownFrame,
                    Size = UDim2.new(0, 14, 0, 14),
                    Position = UDim2.new(0, 10, 0, hasDesc and 8 or 9),
                    BackgroundTransparency = 1,
                    Image = GetIcon(dropdownIcon),
                    ImageColor3 = CurrentTheme.SubText,
                    ZIndex = 19
                })

                Create("TextLabel", {
                    Parent = DropdownFrame,
                    Size = UDim2.new(0, 100, 0, 18),
                    Position = UDim2.new(0, 30, 0, hasDesc and 4 or 7),
                    BackgroundTransparency = 1,
                    Text = dropdownName,
                    TextColor3 = CurrentTheme.Text,
                    TextSize = 12,
                    Font = Enum.Font.Gotham,
                    TextXAlignment = Enum.TextXAlignment.Left,
                    ZIndex = 19
                })

                if hasDesc then
                    Create("TextLabel", {
                        Parent = DropdownFrame,
                        Size = UDim2.new(0, 200, 0, 14),
                        Position = UDim2.new(0, 30, 0, 22),
                        BackgroundTransparency = 1,
                        Text = desc,
                        TextColor3 = CurrentTheme.SubText,
                        TextSize = 10,
                        Font = Enum.Font.Gotham,
                        TextXAlignment = Enum.TextXAlignment.Left,
                        ZIndex = 19
                    })
                end

                local DropdownBtn = Create("TextButton", {
                    Parent = DropdownFrame,
                    Size = UDim2.new(0, 130, 0, 24),
                    Position = UDim2.new(1, -140, 0, hasDesc and 12 or 4),
                    BackgroundColor3 = CurrentTheme.Element,
                    Text = "",
                    TextColor3 = CurrentTheme.SubText,
                    TextSize = 11,
                    Font = Enum.Font.Gotham,
                    TextTruncate = Enum.TextTruncate.AtEnd,
                    ZIndex = 19
                })
                Create("UICorner", {CornerRadius = UDim.new(0, 6), Parent = DropdownBtn})

                local Arrow = Create("ImageLabel", {
                    Parent = DropdownBtn,
                    Size = UDim2.new(0, 12, 0, 12),
                    Position = UDim2.new(1, -18, 0.5, -6),
                    BackgroundTransparency = 1,
                    Image = GetIcon("ChevronDown"),
                    ImageColor3 = CurrentTheme.SubText,
                    ZIndex = 20
                })

                local selected = {}
                if type(default) == "table" then
                    for _, v in ipairs(default) do
                        table.insert(selected, v)
                    end
                end

                local function UpdateButtonText()
                    if #selected == 0 then
                        DropdownBtn.Text = "Select options"
                        DropdownBtn.TextColor3 = CurrentTheme.SubText
                    elseif #selected == 1 then
                        local t, _ = NormalizeOption(selected[1])
                        DropdownBtn.Text = t
                        DropdownBtn.TextColor3 = CurrentTheme.Text
                    else
                        DropdownBtn.Text = #selected .. " selected"
                        DropdownBtn.TextColor3 = CurrentTheme.Text
                    end
                end
                UpdateButtonText()

                local MenuFrame = Create("Frame", {
                    Parent = MainFrame,
                    Size = UDim2.new(0, 0, 0, 0),
                    Position = UDim2.new(0, 0, 0, 0),
                    BackgroundColor3 = CurrentTheme.Background,
                    BorderSizePixel = 0,
                    ClipsDescendants = false,
                    Visible = false,
                    ZIndex = 100
                })
                Create("UICorner", {CornerRadius = UDim.new(0, 8), Parent = MenuFrame})
                Create("UIStroke", {Color = CurrentTheme.Border, Thickness = 1, Parent = MenuFrame})

                local SearchBox = Create("TextBox", {
                    Parent = MenuFrame,
                    Size = UDim2.new(1, -12, 0, 26),
                    Position = UDim2.new(0, 6, 0, 6),
                    BackgroundColor3 = CurrentTheme.Element,
                    Text = "",
                    PlaceholderText = "Search...",
                    TextColor3 = CurrentTheme.Text,
                    PlaceholderColor3 = CurrentTheme.SubText,
                    TextSize = 11,
                    Font = Enum.Font.Gotham,
                    ClearTextOnFocus = false,
                    ZIndex = 31
                })
                Create("UICorner", {CornerRadius = UDim.new(0, 6), Parent = SearchBox})

                Create("ImageLabel", {
                    Parent = SearchBox,
                    Size = UDim2.new(0, 12, 0, 12),
                    Position = UDim2.new(1, -22, 0.5, -6),
                    BackgroundTransparency = 1,
                    Image = GetIcon("Search"),
                    ImageColor3 = CurrentTheme.SubText,
                    ZIndex = 32
                })

                local OptionsScroll = Create("ScrollingFrame", {
                    Parent = MenuFrame,
                    Size = UDim2.new(1, -12, 0, 0),
                    Position = UDim2.new(0, 6, 0, 38),
                    BackgroundTransparency = 1,
                    BorderSizePixel = 0,
                    ScrollBarThickness = 2,
                    ScrollBarImageColor3 = CurrentTheme.Accent,
                    CanvasSize = UDim2.new(0, 0, 0, 0),
                    ZIndex = 31
                })

                Create("UIListLayout", {
                    Parent = OptionsScroll,
                    Padding = UDim.new(0, 2)
                })

                local isOpen = false
                local optionItems = {}

                local function IsSelected(opt)
                    for _, s in ipairs(selected) do
                        local sText, _ = NormalizeOption(s)
                        local oText, _ = NormalizeOption(opt)
                        if sText == oText then return true end
                    end
                    return false
                end

                local function BuildOptions(filterText)
                    for _, item in ipairs(optionItems) do
                        if item then item:Destroy() end
                    end
                    optionItems = {}

                    local count = 0
                    for _, opt in ipairs(options) do
                        local optText, optIcon = NormalizeOption(opt)
                        if not filterText or filterText == "" or string.find(string.lower(optText), string.lower(filterText), 1, true) then

                        local row = Create("Frame", {
                            Parent = OptionsScroll,
                            Size = UDim2.new(1, 0, 0, 24),
                            BackgroundColor3 = CurrentTheme.Element,
                            ZIndex = 32,
                        })
                        Create("UICorner", {CornerRadius = UDim.new(0, 4), Parent = row})

                        local checkBox = Create("Frame", {
                            Parent = row,
                            Size = UDim2.new(0, 14, 0, 14),
                            Position = UDim2.new(0, 8, 0.5, -7),
                            BackgroundColor3 = CurrentTheme.Background,
                            BorderSizePixel = 0,
                            ZIndex = 33,
                        })
                        Create("UICorner", {CornerRadius = UDim.new(0, 3), Parent = checkBox})

                        local checkMark = Create("ImageLabel", {
                            Parent = checkBox,
                            Size = UDim2.new(0, 10, 0, 10),
                            Position = UDim2.new(0.5, -5, 0.5, -5),
                            BackgroundTransparency = 1,
                            Image = GetIcon("Check"),
                            ImageColor3 = CurrentTheme.Accent,
                            ZIndex = 34,
                            Visible = IsSelected(opt),
                        })

                        local textX = 28
                        if optIcon then
                            Create("ImageLabel", {
                                Parent = row,
                                Size = UDim2.new(0, 14, 0, 14),
                                Position = UDim2.new(0, 26, 0.5, -7),
                                BackgroundTransparency = 1,
                                Image = GetIcon(optIcon),
                                ImageColor3 = CurrentTheme.SubText,
                                ZIndex = 33,
                            })
                            textX = 44
                        end

                        local txt = Create("TextLabel", {
                            Parent = row,
                            Size = UDim2.new(1, -textX - 8, 1, 0),
                            Position = UDim2.new(0, textX, 0, 0),
                            BackgroundTransparency = 1,
                            Text = optText,
                            TextColor3 = CurrentTheme.Text,
                            TextSize = 11,
                            Font = Enum.Font.Gotham,
                            TextXAlignment = Enum.TextXAlignment.Left,
                            ZIndex = 33,
                        })

                        local clickBtn = Create("TextButton", {
                            Parent = row,
                            Size = UDim2.new(1, 0, 1, 0),
                            BackgroundTransparency = 1,
                            Text = "",
                            ZIndex = 35,
                        })

                        clickBtn.MouseButton1Click:Connect(function()
                            local selIdx = nil
                            for i, s in ipairs(selected) do
                                local sText, _ = NormalizeOption(s)
                                if sText == optText then selIdx = i; break end
                            end
                            if selIdx then
                                table.remove(selected, selIdx)
                                checkMark.Visible = false
                            else
                                table.insert(selected, opt)
                                checkMark.Visible = true
                            end
                            UpdateButtonText()
                            callback(selected)
                        end)

                        row.MouseEnter:Connect(function()
                            Tween(row, {BackgroundColor3 = CurrentTheme.ElementHover}, 0.1)
                        end)
                        row.MouseLeave:Connect(function()
                            Tween(row, {BackgroundColor3 = CurrentTheme.Element}, 0.1)
                        end)

                        table.insert(optionItems, row)
                        count = count + 1
                        end
                    end

                    local listHeight = math.min(count * 26 + 4, 120)
                    OptionsScroll.Size = UDim2.new(1, -12, 0, listHeight)
                    OptionsScroll.CanvasSize = UDim2.new(0, 0, 0, count * 26 + 4)
                end

                BuildOptions()

                SearchBox:GetPropertyChangedSignal("Text"):Connect(function()
                    BuildOptions(SearchBox.Text)
                end)

                local function UpdateMenuPosition()
                    if not DropdownBtn or not DropdownBtn.Parent then return end
                    local btnPos = DropdownBtn.AbsolutePosition
                    local mainPos = MainFrame.AbsolutePosition
                    local x = btnPos.X - mainPos.X
                    local y = btnPos.Y - mainPos.Y + DropdownBtn.AbsoluteSize.Y + 4
                    local w = DropdownBtn.AbsoluteSize.X
                    MenuFrame.Position = UDim2.new(0, x, 0, y)
                    MenuFrame.Size = UDim2.new(0, w, 0, MenuFrame.Size.Y.Offset)
                end

                DropdownBtn.MouseButton1Click:Connect(function()
                    isOpen = not isOpen
                    if isOpen then
                        UpdateMenuPosition()
                        MenuFrame.Visible = true
                        local menuHeight = math.min(#options * 26 + 50, 170)
                        Tween(MenuFrame, {Size = UDim2.new(0, DropdownBtn.AbsoluteSize.X, 0, menuHeight)}, 0.2)
                        Arrow.Rotation = 180
                        SearchBox.Text = ""
                        BuildOptions()
                    else
                        Tween(MenuFrame, {Size = UDim2.new(0, MenuFrame.Size.X.Offset, 0, 0)}, 0.2).Completed:Connect(function()
                            MenuFrame.Visible = false
                        end)
                        Arrow.Rotation = 0
                    end
                end)

                ListenTheme(function(theme)
                    DropdownFrame.BackgroundColor3 = theme.Background
                    DropdownBtn.BackgroundColor3 = theme.Element
                    UpdateButtonText()
                    Arrow.ImageColor3 = theme.SubText
                    MenuFrame.BackgroundColor3 = theme.Background
                    SearchBox.BackgroundColor3 = theme.Element
                    SearchBox.TextColor3 = theme.Text
                    SearchBox.PlaceholderColor3 = theme.SubText
                    OptionsScroll.ScrollBarImageColor3 = theme.Accent
                    for _, row in ipairs(optionItems) do
                        if row and row.Parent then
                            row.BackgroundColor3 = theme.Element
                        end
                    end
                end)

                return {
                    Set = function(v)
                        selected = {}
                        if type(v) == "table" then
                            for _, item in ipairs(v) do table.insert(selected, item) end
                        end
                        UpdateButtonText()
                        BuildOptions()
                        callback(selected)
                    end,
                    Get = function() return selected end,
                    Refresh = function(newOptions)
                        options = newOptions
                        BuildOptions()
                    end
                }
            end

            function SectionAPI:CreateInput(inputData)
                inputData = inputData or {}
                local inputName = inputData.Name or "Input"
                local inputIcon = inputData.Icon or "Type"
                local placeholder = inputData.Placeholder or "Enter..."
                local default = inputData.Default or ""
                local callback = inputData.Callback or function() end
                local desc = inputData.Desc

                local hasDesc = desc and desc ~= ""
                local frameHeight = hasDesc and 48 or 32

                local InputFrame = Create("Frame", {
                    Parent = SectionItems,
                    Size = UDim2.new(1, 0, 0, frameHeight),
                    BackgroundColor3 = CurrentTheme.Background,
                    BorderSizePixel = 0,
                    LayoutOrder = #SectionItems:GetChildren(),
                    ZIndex = 18
                })
                Create("UICorner", {CornerRadius = UDim.new(0, 8), Parent = InputFrame})

                Create("ImageLabel", {
                    Parent = InputFrame,
                    Size = UDim2.new(0, 14, 0, 14),
                    Position = UDim2.new(0, 10, 0, hasDesc and 8 or 9),
                    BackgroundTransparency = 1,
                    Image = GetIcon(inputIcon),
                    ImageColor3 = CurrentTheme.SubText,
                    ZIndex = 19
                })

                Create("TextLabel", {
                    Parent = InputFrame,
                    Size = UDim2.new(0, 100, 0, 18),
                    Position = UDim2.new(0, 30, 0, hasDesc and 4 or 7),
                    BackgroundTransparency = 1,
                    Text = inputName,
                    TextColor3 = CurrentTheme.Text,
                    TextSize = 12,
                    Font = Enum.Font.Gotham,
                    TextXAlignment = Enum.TextXAlignment.Left,
                    ZIndex = 19
                })

                if hasDesc then
                    Create("TextLabel", {
                        Parent = InputFrame,
                        Size = UDim2.new(0, 200, 0, 14),
                        Position = UDim2.new(0, 30, 0, 22),
                        BackgroundTransparency = 1,
                        Text = desc,
                        TextColor3 = CurrentTheme.SubText,
                        TextSize = 10,
                        Font = Enum.Font.Gotham,
                        TextXAlignment = Enum.TextXAlignment.Left,
                        ZIndex = 19
                    })
                end

                local InputBox = Create("TextBox", {
                    Parent = InputFrame,
                    Size = UDim2.new(0, 130, 0, 22),
                    Position = UDim2.new(1, -140, 0, hasDesc and 12 or 5),
                    BackgroundColor3 = CurrentTheme.Element,
                    Text = default,
                    PlaceholderText = placeholder,
                    TextColor3 = CurrentTheme.Text,
                    PlaceholderColor3 = CurrentTheme.SubText,
                    TextSize = 11,
                    Font = Enum.Font.Gotham,
                    ClearTextOnFocus = false,
                    TextTruncate = Enum.TextTruncate.AtEnd,
                    ZIndex = 19
                })
                Create("UICorner", {CornerRadius = UDim.new(0, 6), Parent = InputBox})

                InputBox.FocusLost:Connect(function(enterPressed)
                    callback(InputBox.Text, enterPressed)
                end)

                ListenTheme(function(theme)
                    InputFrame.BackgroundColor3 = theme.Background
                    InputBox.BackgroundColor3 = theme.Element
                    InputBox.TextColor3 = theme.Text
                    InputBox.PlaceholderColor3 = theme.SubText
                end)

                return {
                    Set = function(t) InputBox.Text = t end,
                    Get = function() return InputBox.Text end
                }
            end

            function SectionAPI:CreateKeybind(bindData)
                bindData = bindData or {}
                local bindName = bindData.Name or "Keybind"
                local bindIcon = bindData.Icon or "Key"
                local default = bindData.Default or Enum.KeyCode.LeftShift
                local callback = bindData.Callback or function() end
                local desc = bindData.Desc

                local hasDesc = desc and desc ~= ""
                local frameHeight = hasDesc and 48 or 32

                local BindFrame = Create("Frame", {
                    Parent = SectionItems,
                    Size = UDim2.new(1, 0, 0, frameHeight),
                    BackgroundColor3 = CurrentTheme.Background,
                    BorderSizePixel = 0,
                    LayoutOrder = #SectionItems:GetChildren(),
                    ZIndex = 18
                })
                Create("UICorner", {CornerRadius = UDim.new(0, 8), Parent = BindFrame})

                Create("ImageLabel", {
                    Parent = BindFrame,
                    Size = UDim2.new(0, 14, 0, 14),
                    Position = UDim2.new(0, 10, 0, hasDesc and 8 or 9),
                    BackgroundTransparency = 1,
                    Image = GetIcon(bindIcon),
                    ImageColor3 = CurrentTheme.SubText,
                    ZIndex = 19
                })

                Create("TextLabel", {
                    Parent = BindFrame,
                    Size = UDim2.new(0, 150, 0, 18),
                    Position = UDim2.new(0, 30, 0, hasDesc and 4 or 7),
                    BackgroundTransparency = 1,
                    Text = bindName,
                    TextColor3 = CurrentTheme.Text,
                    TextSize = 12,
                    Font = Enum.Font.Gotham,
                    TextXAlignment = Enum.TextXAlignment.Left,
                    ZIndex = 19
                })

                if hasDesc then
                    Create("TextLabel", {
                        Parent = BindFrame,
                        Size = UDim2.new(0, 200, 0, 14),
                        Position = UDim2.new(0, 30, 0, 22),
                        BackgroundTransparency = 1,
                        Text = desc,
                        TextColor3 = CurrentTheme.SubText,
                        TextSize = 10,
                        Font = Enum.Font.Gotham,
                        TextXAlignment = Enum.TextXAlignment.Left,
                        ZIndex = 19
                    })
                end

                local BindBtn = Create("TextButton", {
                    Parent = BindFrame,
                    Size = UDim2.new(0, 70, 0, 22),
                    Position = UDim2.new(1, -80, 0, hasDesc and 12 or 5),
                    BackgroundColor3 = CurrentTheme.Element,
                    Text = default.Name,
                    TextColor3 = CurrentTheme.Text,
                    TextSize = 11,
                    Font = Enum.Font.GothamBold,
                    ZIndex = 19
                })
                Create("UICorner", {CornerRadius = UDim.new(0, 6), Parent = BindBtn})

                local listening = false
                BindBtn.MouseButton1Click:Connect(function()
                    listening = true
                    BindBtn.Text = "..."
                    local conn
                    conn = UserInputService.InputBegan:Connect(function(input)
                        if input.UserInputType == Enum.UserInputType.Keyboard then
                            default = input.KeyCode
                            BindBtn.Text = input.KeyCode.Name
                            listening = false
                            conn:Disconnect()
                            callback(input.KeyCode)
                        end
                    end)
                end)

                UserInputService.InputBegan:Connect(function(input)
                    if input.KeyCode == default and not listening then
                        callback(default)
                    end
                end)

                ListenTheme(function(theme)
                    BindFrame.BackgroundColor3 = theme.Background
                    BindBtn.BackgroundColor3 = theme.Element
                    BindBtn.TextColor3 = theme.Text
                end)

                return {
                    Set = function(key)
                        default = key
                        BindBtn.Text = key.Name
                    end,
                    Get = function() return default end
                }
            end

            function SectionAPI:CreateLabel(labelData)
                labelData = labelData or {}
                local labelText = labelData.Text or "Label"
                local labelIcon = labelData.Icon or "Type"

                local LabelFrame = Create("Frame", {
                    Parent = SectionItems,
                    Size = UDim2.new(1, 0, 0, 28),
                    BackgroundColor3 = CurrentTheme.Background,
                    BorderSizePixel = 0,
                    LayoutOrder = #SectionItems:GetChildren(),
                    ZIndex = 18
                })
                Create("UICorner", {CornerRadius = UDim.new(0, 6), Parent = LabelFrame})

                Create("ImageLabel", {
                    Parent = LabelFrame,
                    Size = UDim2.new(0, 14, 0, 14),
                    Position = UDim2.new(0, 10, 0.5, -7),
                    BackgroundTransparency = 1,
                    Image = GetIcon(labelIcon),
                    ImageColor3 = CurrentTheme.SubText,
                    ZIndex = 19
                })

                local Label = Create("TextLabel", {
                    Parent = LabelFrame,
                    Size = UDim2.new(0, 300, 0, 28),
                    Position = UDim2.new(0, 30, 0, 0),
                    BackgroundTransparency = 1,
                    Text = labelText,
                    TextColor3 = CurrentTheme.Text,
                    TextSize = 12,
                    Font = Enum.Font.Gotham,
                    TextXAlignment = Enum.TextXAlignment.Left,
                    RichText = true,
                    ZIndex = 19
                })

                ListenTheme(function(theme)
                    LabelFrame.BackgroundColor3 = theme.Background
                    Label.TextColor3 = theme.Text
                end)

                return {Set = function(t) Label.Text = t end}
            end

            function SectionAPI:CreateParagraph(paraData)
                paraData = paraData or {}
                local title = paraData.Title or "Paragraph"
                local content = paraData.Content or paraData.Desc or "Description text goes here..."
                local icon = paraData.Icon or "Type"

                local ParaFrame = Create("Frame", {
                    Parent = SectionItems,
                    Size = UDim2.new(1, 0, 0, 0),
                    BackgroundColor3 = CurrentTheme.Background,
                    BorderSizePixel = 0,
                    LayoutOrder = #SectionItems:GetChildren(),
                    AutomaticSize = Enum.AutomaticSize.Y,
                    ZIndex = 18
                })
                Create("UICorner", {CornerRadius = UDim.new(0, 8), Parent = ParaFrame})

                Create("ImageLabel", {
                    Parent = ParaFrame,
                    Size = UDim2.new(0, 14, 0, 14),
                    Position = UDim2.new(0, 10, 0, 10),
                    BackgroundTransparency = 1,
                    Image = GetIcon(icon),
                    ImageColor3 = CurrentTheme.Accent,
                    ZIndex = 19
                })

                local TitleLabel = Create("TextLabel", {
                    Parent = ParaFrame,
                    Size = UDim2.new(0, 300, 0, 20),
                    Position = UDim2.new(0, 30, 0, 8),
                    BackgroundTransparency = 1,
                    Text = title,
                    TextColor3 = CurrentTheme.Text,
                    TextSize = 12,
                    Font = Enum.Font.GothamBold,
                    TextXAlignment = Enum.TextXAlignment.Left,
                    ZIndex = 19
                })

                local ContentLabel = Create("TextLabel", {
                    Parent = ParaFrame,
                    Size = UDim2.new(1, -20, 0, 0),
                    Position = UDim2.new(0, 10, 0, 32),
                    BackgroundTransparency = 1,
                    Text = content,
                    TextColor3 = CurrentTheme.SubText,
                    TextSize = 11,
                    Font = Enum.Font.Gotham,
                    TextXAlignment = Enum.TextXAlignment.Left,
                    TextWrapped = true,
                    RichText = true,
                    AutomaticSize = Enum.AutomaticSize.Y,
                    ZIndex = 19
                })

                Create("Frame", {
                    Parent = ParaFrame,
                    Size = UDim2.new(1, 0, 0, 8),
                    Position = UDim2.new(0, 0, 1, 0),
                    BackgroundTransparency = 1,
                    ZIndex = 19
                })

                ListenTheme(function(theme)
                    ParaFrame.BackgroundColor3 = theme.Background
                    TitleLabel.TextColor3 = theme.Text
                    ContentLabel.TextColor3 = theme.SubText
                end)

                local API = {
                    SetTitle = function(t) TitleLabel.Text = t end,
                    SetContent = function(c) ContentLabel.Text = c end,
                    SetDesc = function(c) ContentLabel.Text = c end,
                }
                return API
            end

            function SectionAPI:CreateColorPicker(pickerData)
                pickerData = pickerData or {}
                local pickerName = pickerData.Name or "Color"
                local pickerIcon = pickerData.Icon or "Palette"
                local default = pickerData.Default or Color3.fromRGB(255, 255, 255)
                local callback = pickerData.Callback or function() end
                local desc = pickerData.Desc

                local hasDesc = desc and desc ~= ""
                local frameHeight = hasDesc and 48 or 32

                local PickerFrame = Create("Frame", {
                    Parent = SectionItems,
                    Size = UDim2.new(1, 0, 0, frameHeight),
                    BackgroundColor3 = CurrentTheme.Background,
                    BorderSizePixel = 0,
                    LayoutOrder = #SectionItems:GetChildren(),
                    ZIndex = 18
                })
                Create("UICorner", {CornerRadius = UDim.new(0, 8), Parent = PickerFrame})

                Create("ImageLabel", {
                    Parent = PickerFrame,
                    Size = UDim2.new(0, 14, 0, 14),
                    Position = UDim2.new(0, 10, 0, hasDesc and 8 or 9),
                    BackgroundTransparency = 1,
                    Image = GetIcon(pickerIcon),
                    ImageColor3 = CurrentTheme.SubText,
                    ZIndex = 19
                })

                Create("TextLabel", {
                    Parent = PickerFrame,
                    Size = UDim2.new(0, 150, 0, 18),
                    Position = UDim2.new(0, 30, 0, hasDesc and 4 or 7),
                    BackgroundTransparency = 1,
                    Text = pickerName,
                    TextColor3 = CurrentTheme.Text,
                    TextSize = 12,
                    Font = Enum.Font.Gotham,
                    TextXAlignment = Enum.TextXAlignment.Left,
                    ZIndex = 19
                })

                if hasDesc then
                    Create("TextLabel", {
                        Parent = PickerFrame,
                        Size = UDim2.new(0, 200, 0, 14),
                        Position = UDim2.new(0, 30, 0, 22),
                        BackgroundTransparency = 1,
                        Text = desc,
                        TextColor3 = CurrentTheme.SubText,
                        TextSize = 10,
                        Font = Enum.Font.Gotham,
                        TextXAlignment = Enum.TextXAlignment.Left,
                        ZIndex = 19
                    })
                end

                local ColorPreview = Create("TextButton", {
                    Parent = PickerFrame,
                    Size = UDim2.new(0, 50, 0, 22),
                    Position = UDim2.new(1, -60, 0, hasDesc and 12 or 5),
                    BackgroundColor3 = default,
                    Text = "",
                    ZIndex = 19
                })
                Create("UICorner", {CornerRadius = UDim.new(0, 6), Parent = ColorPreview})
                Create("UIStroke", {Color = CurrentTheme.Border, Thickness = 1, Parent = ColorPreview})

                local ColorMenu = Create("Frame", {
                    Parent = ColorPreview,
                    Size = UDim2.new(0, 140, 0, 0),
                    Position = UDim2.new(0, -80, 0, 28),
                    BackgroundColor3 = CurrentTheme.Background,
                    BorderSizePixel = 0,
                    ClipsDescendants = true,
                    Visible = false,
                    ZIndex = 30
                })
                Create("UICorner", {CornerRadius = UDim.new(0, 8), Parent = ColorMenu})
                Create("UIStroke", {Color = CurrentTheme.Border, Thickness = 1, Parent = ColorMenu})

                local RInput = Create("TextBox", {
                    Parent = ColorMenu,
                    Size = UDim2.new(0, 40, 0, 22),
                    Position = UDim2.new(0, 8, 0, 8),
                    BackgroundColor3 = CurrentTheme.Element,
                    Text = tostring(math.round(default.R * 255)),
                    TextColor3 = CurrentTheme.Text,
                    TextSize = 11,
                    Font = Enum.Font.Gotham,
                    ZIndex = 31
                })
                Create("UICorner", {CornerRadius = UDim.new(0, 4), Parent = RInput})

                local GInput = Create("TextBox", {
                    Parent = ColorMenu,
                    Size = UDim2.new(0, 40, 0, 22),
                    Position = UDim2.new(0, 50, 0, 8),
                    BackgroundColor3 = CurrentTheme.Element,
                    Text = tostring(math.round(default.G * 255)),
                    TextColor3 = CurrentTheme.Text,
                    TextSize = 11,
                    Font = Enum.Font.Gotham,
                    ZIndex = 31
                })
                Create("UICorner", {CornerRadius = UDim.new(0, 4), Parent = GInput})

                local BInput = Create("TextBox", {
                    Parent = ColorMenu,
                    Size = UDim2.new(0, 40, 0, 22),
                    Position = UDim2.new(0, 92, 0, 8),
                    BackgroundColor3 = CurrentTheme.Element,
                    Text = tostring(math.round(default.B * 255)),
                    TextColor3 = CurrentTheme.Text,
                    TextSize = 11,
                    Font = Enum.Font.Gotham,
                    ZIndex = 31
                })
                Create("UICorner", {CornerRadius = UDim.new(0, 4), Parent = BInput})

                local ApplyBtn = Create("TextButton", {
                    Parent = ColorMenu,
                    Size = UDim2.new(1, -16, 0, 22),
                    Position = UDim2.new(0, 8, 0, 36),
                    BackgroundColor3 = CurrentTheme.Accent,
                    Text = "Apply",
                    TextColor3 = CurrentTheme.Text,
                    TextSize = 11,
                    Font = Enum.Font.GothamBold,
                    ZIndex = 31
                })
                Create("UICorner", {CornerRadius = UDim.new(0, 4), Parent = ApplyBtn})

                local colorOpen = false
                ColorPreview.MouseButton1Click:Connect(function()
                    colorOpen = not colorOpen
                    if colorOpen then
                        ColorMenu.Visible = true
                        Tween(ColorMenu, {Size = UDim2.new(0, 140, 0, 66)}, 0.2)
                    else
                        Tween(ColorMenu, {Size = UDim2.new(0, 140, 0, 0)}, 0.2).Completed:Connect(function()
                            ColorMenu.Visible = false
                        end)
                    end
                end)

                ApplyBtn.MouseButton1Click:Connect(function()
                    local r = math.clamp(tonumber(RInput.Text) or 255, 0, 255)
                    local g = math.clamp(tonumber(GInput.Text) or 255, 0, 255)
                    local b = math.clamp(tonumber(BInput.Text) or 255, 0, 255)
                    local newColor = Color3.fromRGB(r, g, b)
                    ColorPreview.BackgroundColor3 = newColor
                    callback(newColor)
                    colorOpen = false
                    Tween(ColorMenu, {Size = UDim2.new(0, 140, 0, 0)}, 0.2).Completed:Connect(function()
                        ColorMenu.Visible = false
                    end)
                end)

                ListenTheme(function(theme)
                    PickerFrame.BackgroundColor3 = theme.Background
                    ColorMenu.BackgroundColor3 = theme.Background
                    RInput.BackgroundColor3 = theme.Element
                    GInput.BackgroundColor3 = theme.Element
                    BInput.BackgroundColor3 = theme.Element
                    ApplyBtn.BackgroundColor3 = theme.Accent
                end)

                return {
                    Set = function(c)
                        ColorPreview.BackgroundColor3 = c
                        RInput.Text = tostring(math.round(c.R * 255))
                        GInput.Text = tostring(math.round(c.G * 255))
                        BInput.Text = tostring(math.round(c.B * 255))
                        callback(c)
                    end,
                    Get = function() return ColorPreview.BackgroundColor3 end
                }
            end

            function SectionAPI:CreateDivider()
                local Divider = Create("Frame", {
                    Parent = SectionItems,
                    Size = UDim2.new(1, -10, 0, 1),
                    Position = UDim2.new(0, 5, 0, 0),
                    BackgroundColor3 = CurrentTheme.Border,
                    BorderSizePixel = 0,
                    LayoutOrder = #SectionItems:GetChildren(),
                    ZIndex = 18
                })

                ListenTheme(function(theme)
                    Divider.BackgroundColor3 = theme.Border
                end)

                return Divider
            end

            function SectionAPI:CreateStatus(statusData)
                statusData = statusData or {}
                local statusText = statusData.Text or "Status"
                local statusIcon = statusData.Icon or "Check"
                local statusColor = statusData.Color or CurrentTheme.Success

                local StatusFrame = Create("Frame", {
                    Parent = SectionItems,
                    Size = UDim2.new(1, 0, 0, 28),
                    BackgroundColor3 = CurrentTheme.Background,
                    BorderSizePixel = 0,
                    LayoutOrder = #SectionItems:GetChildren(),
                    ZIndex = 18
                })
                Create("UICorner", {CornerRadius = UDim.new(0, 6), Parent = StatusFrame})

                local Dot = Create("Frame", {
                    Parent = StatusFrame,
                    Size = UDim2.new(0, 8, 0, 8),
                    Position = UDim2.new(0, 12, 0.5, -4),
                    BackgroundColor3 = statusColor,
                    BorderSizePixel = 0,
                    ZIndex = 19
                })
                Create("UICorner", {CornerRadius = UDim.new(1, 0), Parent = Dot})

                Create("ImageLabel", {
                    Parent = StatusFrame,
                    Size = UDim2.new(0, 14, 0, 14),
                    Position = UDim2.new(0, 26, 0.5, -7),
                    BackgroundTransparency = 1,
                    Image = GetIcon(statusIcon),
                    ImageColor3 = statusColor,
                    ZIndex = 19
                })

                local StatusLabel = Create("TextLabel", {
                    Parent = StatusFrame,
                    Size = UDim2.new(0, 300, 0, 28),
                    Position = UDim2.new(0, 44, 0, 0),
                    BackgroundTransparency = 1,
                    Text = statusText,
                    TextColor3 = CurrentTheme.Text,
                    TextSize = 12,
                    Font = Enum.Font.Gotham,
                    TextXAlignment = Enum.TextXAlignment.Left,
                    ZIndex = 19
                })

                ListenTheme(function(theme)
                    StatusFrame.BackgroundColor3 = theme.Background
                    StatusLabel.TextColor3 = theme.Text
                end)

                return {
                    SetText = function(t) StatusLabel.Text = t end,
                    SetColor = function(c) Dot.BackgroundColor3 = c end
                }
            end

            return SectionAPI
        end

        return TabAPI
    end

    return WindowAPI
end

return Quantum
