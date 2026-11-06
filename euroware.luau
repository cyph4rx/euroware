-- EUROWARE UI LIBRARY
-- MADE BY TOPIT, EDITED BY CYPH4R

-- warning: comments are mostly retarded / useless
-- some shit makes no sense but idc enough to fix it

-- started on 5/18/22

local inputService = game:GetService('UserInputService')
local renderService = game:GetService('RunService')
local tweenService = game:GetService('TweenService')
local guiService = game:GetService('GuiService')

-- tween(object, {Property = 'value'}, 0.2, 1)
local tween
do
    local styleEnum = Enum.EasingStyle
    local dirEnum = Enum.EasingDirection
    
    local direction = dirEnum.Out
    local styles = {styleEnum.Exponential, styleEnum.Linear}
    
    
    function tween(object, shit, duration, style) 
        local tweenInfo = TweenInfo.new(duration, styles[style], direction)
        local tween = tweenService:Create(object, tweenInfo, shit)
        tween:Play()
        return tween 
    end
end

-- ui config shit
local args = {...}
local theme
local rounding
local animSpeed = 1e-12

-- theme 
do
    if (#args > 0 and typeof(args[1]) == 'table') then
        local settings = args[1]
        theme = settings.theme
        rounding = settings.rounding
        if (settings.smoothDragging == nil) then 
            settings.smoothDragging = true 
        end
        animSpeed = settings.smoothDragging and 1e-12 or 0
        if (typeof(theme) == 'string') then
            if (theme == 'cherry') then          -- red
                theme = {
                    Primary = Color3.fromRGB(249, 22, 52);
                    Secondary = Color3.fromRGB(247, 22, 149);
                    
                    Window1 = Color3.fromRGB(11, 11, 11);
                    Window2 = Color3.fromRGB(5, 5, 5);
                    Window3 = Color3.fromRGB(8, 8, 8);
                    
                    Button1 = Color3.fromRGB(12, 12, 12);
                    Button2 = Color3.fromRGB(15, 15, 15);
                    Button3 = Color3.fromRGB(21, 21, 21);
                    Button4 = Color3.fromRGB(24, 24, 24);
                    
                    Stroke = Color3.fromRGB(30, 30, 30);
                    StrokeHover = Color3.fromRGB(83, 23, 31);
                    
                    Inset1 = Color3.fromRGB(3, 3, 3);
                    Inset2 = Color3.fromRGB(1, 1, 1);
                    Inset3 = Color3.fromRGB(2, 2, 2);
                    
                    TextPrimary = Color3.fromRGB(255, 255, 255);
                    TextStroke = Color3.fromRGB(0, 0, 0);
                    TextDim = Color3.fromRGB(164, 164, 164);
                    
                    ControlGradient1 = Color3.fromRGB(255, 255, 255);
                    ControlGradient2 = Color3.fromRGB(200, 200, 200);
                }
            elseif (theme == 'orange') then      -- orange
                theme = {
                    Primary = Color3.fromRGB(244, 148, 22);
                    Secondary = Color3.fromRGB(247, 37, 22);
                    
                    Window1 = Color3.fromRGB(20, 20, 22);
                    Window2 = Color3.fromRGB(10, 10, 12);
                    Window3 = Color3.fromRGB(15, 15, 17);
                    
                    Button1 = Color3.fromRGB(18, 18, 20);
                    Button2 = Color3.fromRGB(20, 20, 22);
                    Button3 = Color3.fromRGB(28, 28, 30);
                    Button4 = Color3.fromRGB(30, 30, 32);
                    
                    Stroke = Color3.fromRGB(60, 60, 60);
                    StrokeHover = Color3.fromRGB(110, 110, 110);
                    
                    Inset1 = Color3.fromRGB(10, 10, 12);
                    Inset2 = Color3.fromRGB(0, 0, 2);
                    Inset3 = Color3.fromRGB(5, 5, 7);
                    
                    TextPrimary = Color3.fromRGB(255, 255, 255);
                    TextStroke = Color3.fromRGB(0, 0, 0);
                    TextDim = Color3.fromRGB(192, 192, 192);
                    
                    ControlGradient1 = Color3.fromRGB(255, 255, 255);
                    ControlGradient2 = Color3.fromRGB(192, 192, 192);
                }
            elseif (theme == 'lemon') then       -- yellow
                theme = {
                    Primary = Color3.fromRGB(220, 255, 66);
                    Secondary = Color3.fromRGB(232, 173, 25);
                    
                    Window1 = Color3.fromRGB(30, 30, 30);
                    Window2 = Color3.fromRGB(20, 20, 20);
                    Window3 = Color3.fromRGB(25, 25, 25);
                    
                    Button1 = Color3.fromRGB(35, 35, 35);
                    Button2 = Color3.fromRGB(40, 40, 40);
                    Button3 = Color3.fromRGB(50, 50, 50);
                    Button4 = Color3.fromRGB(55, 55, 55);
                    
                    Stroke = Color3.fromRGB(55, 55, 55);
                    StrokeHover = Color3.fromRGB(80, 80, 80);
                    
                    Inset1 = Color3.fromRGB(18, 18, 18);
                    Inset2 = Color3.fromRGB(8, 8, 8);
                    Inset3 = Color3.fromRGB(13, 13, 13);
                    
                    TextPrimary = Color3.fromRGB(255, 255, 255);
                    TextStroke = Color3.fromRGB(0, 0, 0);
                    TextDim = Color3.fromRGB(192, 192, 192);
                    
                    ControlGradient1 = Color3.fromRGB(255, 255, 255);
                    ControlGradient2 = Color3.fromRGB(192, 192, 192);
                }
            elseif (theme == 'lime') then        -- green
                theme = {
                    Primary = Color3.fromRGB(33, 255, 120);
                    Secondary = Color3.fromRGB(120, 255, 33);
                    
                    Window1 = Color3.fromRGB(30, 30, 32);
                    Window2 = Color3.fromRGB(24, 24, 26);
                    Window3 = Color3.fromRGB(28, 28, 30);
                    
                    Button1 = Color3.fromRGB(36, 36, 38);
                    Button2 = Color3.fromRGB(40, 40, 42);
                    Button3 = Color3.fromRGB(46, 46, 48);
                    Button4 = Color3.fromRGB(50, 50, 52);
                    
                    Stroke = Color3.fromRGB(60, 60, 60);
                    StrokeHover = Color3.fromRGB(110, 110, 110);
                    
                    Inset1 = Color3.fromRGB(20, 20, 22);
                    Inset2 = Color3.fromRGB(14, 14, 16);
                    Inset3 = Color3.fromRGB(18, 18, 20);
                    
                    TextPrimary = Color3.fromRGB(255, 255, 255);
                    TextStroke = Color3.fromRGB(0, 0, 0);
                    TextDim = Color3.fromRGB(192, 192, 192);
                    
                    ControlGradient1 = Color3.fromRGB(255, 255, 255);
                    ControlGradient2 = Color3.fromRGB(192, 192, 192);
                }
            elseif (theme == 'raspberry') then   -- cyan
                theme = {
                    Primary = Color3.fromRGB(0, 190, 255);
                    Secondary = Color3.fromRGB(0, 255, 190);
                    
                    Window1 = Color3.fromRGB(25, 25, 27);
                    Window2 = Color3.fromRGB(19, 19, 21);
                    Window3 = Color3.fromRGB(23, 23, 25);
                    
                    Button1 = Color3.fromRGB(24, 24, 26);
                    Button2 = Color3.fromRGB(28, 28, 30);
                    Button3 = Color3.fromRGB(34, 40, 42);
                    Button4 = Color3.fromRGB(38, 44, 46);
                    
                    Stroke = Color3.fromRGB(60, 60, 60);
                    StrokeHover = Color3.fromRGB(110, 110, 110);
                    
                    Inset1 = Color3.fromRGB(20, 20, 22);
                    Inset2 = Color3.fromRGB(14, 14, 16);
                    Inset3 = Color3.fromRGB(18, 18, 20);
                    
                    TextPrimary = Color3.fromRGB(255, 255, 255);
                    TextStroke = Color3.fromRGB(0, 0, 0);
                    TextDim = Color3.fromRGB(192, 192, 192);
                    
                    ControlGradient1 = Color3.fromRGB(255, 255, 255);
                    ControlGradient2 = Color3.fromRGB(192, 192, 192);
                }
            elseif (theme == 'blueberry') then   -- blue
                theme = {
                    Primary = Color3.fromRGB(91, 77, 249);
                    Secondary = Color3.fromRGB(130, 76, 247);
                    
                    Window1 = Color3.fromRGB(20, 20, 23);
                    Window2 = Color3.fromRGB(12, 12, 15);
                    Window3 = Color3.fromRGB(15, 15, 18);
                    
                    Button1 = Color3.fromRGB(18, 18, 21);
                    Button2 = Color3.fromRGB(21, 21, 24);
                    Button3 = Color3.fromRGB(38, 38, 41);
                    Button4 = Color3.fromRGB(41, 41, 44);
                    
                    Stroke = Color3.fromRGB(50, 50, 53);
                    StrokeHover = Color3.fromRGB(60, 60, 63);
                    
                    Inset1 = Color3.fromRGB(15, 15, 18);
                    Inset2 = Color3.fromRGB(7, 7, 10);
                    Inset3 = Color3.fromRGB(13, 13, 16);
                    
                    TextPrimary = Color3.fromRGB(255, 255, 255);
                    TextStroke = Color3.fromRGB(0, 0, 0);
                    TextDim = Color3.fromRGB(168, 168, 168);
                    
                    ControlGradient1 = Color3.fromRGB(255, 255, 255);
                    ControlGradient2 = Color3.fromRGB(192, 192, 192);
                }
            elseif (theme == 'grape') then       -- purple
                
                theme = {
                    Primary = Color3.fromRGB(134, 53, 255);
                    Secondary = Color3.fromRGB(211, 53, 255);
                    
                    Window1 = Color3.fromRGB(20, 20, 20);
                    Window2 = Color3.fromRGB(10, 10, 10);
                    Window3 = Color3.fromRGB(15, 15, 15);
                    
                    Button1 = Color3.fromRGB(15, 15, 15);
                    Button2 = Color3.fromRGB(20, 20, 20);
                    Button3 = Color3.fromRGB(35, 35, 35);
                    Button4 = Color3.fromRGB(40, 40, 40);
                    
                    Stroke = Color3.fromRGB(34, 34, 34);
                    StrokeHover = Color3.fromRGB(89, 49, 150);
                    
                    Inset1 = Color3.fromRGB(5, 5, 5);
                    Inset2 = Color3.fromRGB(0, 0, 0);
                    Inset3 = Color3.fromRGB(3, 3, 3);
                    
                    TextPrimary = Color3.fromRGB(255, 255, 255);
                    TextStroke = Color3.fromRGB(0, 0, 0);
                    TextDim = Color3.fromRGB(74, 42, 122);
                    
                    ControlGradient1 = Color3.fromRGB(255, 255, 255);
                    ControlGradient2 = Color3.fromRGB(192, 192, 192);
                }
            elseif (theme == 'watermelon') then  -- legacy red-aqua
                theme = nil
            end
        end
    end
    
    
    
    if (rounding == nil) then
        rounding = true 
    end
    if (typeof(theme) ~= 'table') then
        theme = {
            Primary = Color3.fromRGB(38, 233, 195); -- primary accent
            Secondary = Color3.fromRGB(233, 38, 115); -- secondary accent
            
            Window1 = Color3.fromRGB(30, 30, 35); -- window headers (the tool bar w/ title and min/max buttons)
            Window2 = Color3.fromRGB(20, 20, 25); -- window background
            Window3 = Color3.fromRGB(25, 25, 30); -- sidebar, section header, tooltip header
            
            Button1 = Color3.fromRGB(35, 35, 40); -- idle disabled button
            Button2 = Color3.fromRGB(45, 45, 50); -- disabled button focused
            Button3 = Color3.fromRGB(65, 65, 70); -- idle enabled button
            Button4 = Color3.fromRGB(75, 75, 80); -- enabled button focused
            
            Stroke = Color3.fromRGB(50, 50, 55); -- stroke for everything
            StrokeHover = Color3.fromRGB(70, 70, 75); -- stroke for everything
            
            Inset1 = Color3.fromRGB(20, 20, 25); -- inner stroke of Window1
            Inset2 = Color3.fromRGB(10, 10, 15); -- inner stroke of Window2
            Inset3 = Color3.fromRGB(15, 15, 20); -- inner stroke of Window3
            
            TextPrimary = Color3.fromRGB(255, 255, 255); -- primary text color
            TextStroke = Color3.fromRGB(0, 0, 0); -- text stroke
            TextDim = Color3.fromRGB(164, 164, 164); -- dim text color
            
            ControlGradient1 = Color3.fromRGB(255, 255, 255); -- top color for extra gradient effects
            ControlGradient2 = Color3.fromRGB(192, 192, 192); -- bottom color for extra gradient effects
        }
    end
end


-- screen gui 
local uiScreen = Instance.new('ScreenGui') do 
    -- Privileged OnTopOfCoreBlur is unnecessary in PlayerGui.
    uiScreen.DisplayOrder = 10000
    uiScreen.ResetOnSpawn = false
    uiScreen.IgnoreGuiInset = true
    uiScreen.ZIndexBehavior = 'Global'
    
    
    local str = ''
    for i = 1, 8 do
        str = str .. utf8.char(math.random(97, 2500))
    end
    uiScreen.Name = str
    str = nil 
    
    if (typeof(syn) == 'table' and typeof(syn.protect_gui) == 'function') then
        --syn.protect_gui(uiScreen)
    end
    local settings = type(args[1]) == 'table' and args[1] or {}
    local player = game:GetService('Players').LocalPlayer
    if settings.parent then
        uiScreen.Parent = settings.parent
    elseif player then
        uiScreen.Parent = player:WaitForChild('PlayerGui')
    elseif type(gethui) == 'function' then
        uiScreen.Parent = gethui()
    else
        uiScreen.Parent = game:GetService('CoreGui')
    end
    
    local notifContainer = Instance.new('Frame') do 
        notifContainer.Active = false 
        notifContainer.BackgroundTransparency = 1
        notifContainer.Name = '#notif-container'
        notifContainer.Position = UDim2.new(1, -250, 0, -50)
        notifContainer.Size = UDim2.new(0, 200, 1, 0)
        notifContainer.ZIndex = 0
        
        notifContainer.Parent = uiScreen
    end
end

-- tooltip
local tooltip = {} do 
    do
        local instances = {}
        
        local main = Instance.new('Frame')
        main.BackgroundColor3 = theme.Window2
        main.BorderColor3 = theme.Inset2
        main.BorderMode = 'Inset'
        main.Name = '#main'
        main.Size = UDim2.fromOffset(140, 60)
        main.Visible = false
        main.ZIndex = 3800
        
        main.Parent = uiScreen
        
        do 
            local stroke = Instance.new('UIStroke') do 
                stroke.ApplyStrokeMode = 'Border'
                stroke.Color = theme.Stroke
                stroke.LineJoinMode = 'Round'
                stroke.Thickness = 1 
                stroke.Name = '#stroke'
                
                stroke.Parent = main
            end
            
            local shadow = Instance.new('ImageLabel') do 
                shadow.AnchorPoint = Vector2.new(0.5, 0.5)
                shadow.BackgroundTransparency = 1
                shadow.BorderSizePixel = 0 
                shadow.Image = 'rbxassetid://7331400934'
                shadow.ImageColor3 = Color3.fromRGB(0, 0, 5)
                shadow.Name = '#shadow'
                shadow.Position = UDim2.fromScale(0.5, 0.5)
                shadow.ScaleType = 'Slice'
                shadow.Size = UDim2.new(1, 50, 1, 50)
                shadow.SliceCenter = Rect.new(40, 40, 260, 260)
                shadow.SliceScale = 1
                shadow.ZIndex = 3799
                
                shadow.Parent = main
            end
            
            local trim = Instance.new('Frame') do 
                trim.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                trim.BackgroundTransparency = 0
                trim.BorderSizePixel = 0 
                trim.Name = '#trim'
                trim.Position = UDim2.fromOffset(0, -2)
                trim.Size = UDim2.new(1, 0, 0, 1)
                trim.ZIndex = 3805
                
                trim.Parent = main
                
                local gradient = Instance.new('UIGradient') do 
                    gradient.Color = ColorSequence.new(
                        theme.Primary, 
                        theme.Secondary
                    )
                    gradient.Enabled = true
                    gradient.Name = '#gradient'
                    gradient.Rotation = 0
                    
                    gradient.Parent = trim
                end
            end
            
            local titleBar = Instance.new('Frame') do 
                titleBar.BackgroundColor3 = theme.Window3
                titleBar.BackgroundTransparency = 0 
                titleBar.BorderColor3 = theme.Inset3
                titleBar.BorderSizePixel = 1
                titleBar.BorderMode = 'Inset'
                titleBar.Name = '#title-bar'
                titleBar.Size = UDim2.new(1, 2, 0, 16)
                titleBar.Position = UDim2.fromOffset(-1, 0)
                titleBar.Visible = true
                titleBar.ZIndex = 3801
                
                titleBar.Parent = main
                
                local stroke = Instance.new('UIStroke') do 
                    stroke.ApplyStrokeMode = 'Border'
                    stroke.Color = theme.Stroke
                    stroke.LineJoinMode = 'Round'
                    stroke.Thickness = 1 
                    stroke.Name = '#stroke'
                    
                    stroke.Parent = titleBar
                end
                
                local title = Instance.new('TextLabel') do 
                    title.BackgroundTransparency = 1
                    title.Font = 'SourceSans'
                    title.Name = '#title'
                    title.RichText = true
                    title.Size = UDim2.fromScale(1, 1)
                    title.Text = 'tooltip'
                    title.TextColor3 = theme.TextPrimary
                    title.TextSize = 14
                    title.TextStrokeColor3 = theme.TextStroke
                    title.TextStrokeTransparency = 0.8
                    title.TextTransparency = 0
                    title.TextWrapped = false
                    title.TextXAlignment = 'Left'
                    title.TextYAlignment = 'Center'
                    title.Visible = true
                    title.ZIndex = 3801
                    
                    title.Parent = titleBar
                    
                    local padding = Instance.new('UIPadding') do 
                        padding.Name = '#padding'
                        padding.PaddingLeft = UDim.new(0, 4)
                        
                        padding.Parent = title
                    end
                    
                    instances.title = title 
                end
            end
            
            local menu = Instance.new('Frame') do 
                menu.BackgroundColor3 = theme.Window2
                menu.BorderColor3 = theme.Inset2
                menu.BorderMode = 'Inset'
                menu.BorderSizePixel = 1
                menu.ClipsDescendants = true 
                menu.Name = '#menu'
                menu.Position = UDim2.fromOffset(-1, 17)
                menu.Size = UDim2.new(1, 2, 1, -16)
                menu.Visible = true
                menu.ZIndex = 3801
                 
                menu.Parent = main
                
                local desc = Instance.new('TextLabel') do 
                    desc.BackgroundTransparency = 1
                    desc.Font = 'SourceSans'
                    desc.Name = '#desc'
                    desc.RichText = true
                    desc.Size = UDim2.fromScale(1, 1)
                    desc.Text = 'tooltip description'
                    desc.TextColor3 = theme.TextPrimary
                    desc.TextSize = 14
                    desc.TextStrokeColor3 = theme.TextStroke
                    desc.TextStrokeTransparency = 0.8
                    desc.TextTransparency = 0
                    desc.TextWrapped = true
                    desc.TextXAlignment = 'Left'
                    desc.TextYAlignment = 'Top'
                    desc.Visible = true
                    desc.ZIndex = 3801
                    
                    desc.Parent = menu
                    
                    local padding = Instance.new('UIPadding') do 
                        padding.Name = '#padding'
                        padding.PaddingLeft = UDim.new(0, 4)
                        padding.PaddingTop = UDim.new(0, 2)
                        
                        padding.Parent = desc
                    end
                    
                    instances.desc = desc 
                end
            end
        end
        
        
        instances.main = main
        tooltip.instances = instances
    end
    
    tooltip.handle = nil 
    tooltip.showing = false
    tooltip.update = nil
end

-- hint 
local hint = {} do 
    do
        local instances = {}
        
        local main = Instance.new('Frame')
        main.BackgroundColor3 = theme.Window2
        main.BorderColor3 = theme.Inset2
        main.BorderMode = 'Inset'
        main.Name = '#main'
        main.Size = UDim2.fromOffset(140, 84)
        main.Visible = false
        main.ZIndex = 3900
        
        main.Parent = uiScreen
        
        do 
            local stroke = Instance.new('UIStroke') do 
                stroke.ApplyStrokeMode = 'Border'
                stroke.Color = theme.Stroke
                stroke.LineJoinMode = 'Round'
                stroke.Thickness = 1 
                stroke.Name = '#stroke'
                
                stroke.Parent = main
            end
            
            local shadow = Instance.new('ImageLabel') do 
                shadow.AnchorPoint = Vector2.new(0.5, 0.5)
                shadow.BackgroundTransparency = 1
                shadow.BorderSizePixel = 0 
                shadow.Image = 'rbxassetid://7331400934'
                shadow.ImageColor3 = Color3.fromRGB(0, 0, 5)
                shadow.Name = '#shadow'
                shadow.Position = UDim2.fromScale(0.5, 0.5)
                shadow.ScaleType = 'Slice'
                shadow.Size = UDim2.new(1, 50, 1, 50)
                shadow.SliceCenter = Rect.new(40, 40, 260, 260)
                shadow.SliceScale = 1
                shadow.ZIndex = 3899
                
                shadow.Parent = main
            end
            
            local trim = Instance.new('Frame') do 
                trim.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                trim.BackgroundTransparency = 0
                trim.BorderSizePixel = 0 
                trim.Name = '#trim'
                trim.Position = UDim2.fromOffset(0, -2)
                trim.Size = UDim2.new(1, 0, 0, 1)
                trim.ZIndex = 3905
                
                trim.Parent = main
                
                local gradient = Instance.new('UIGradient') do 
                    gradient.Color = ColorSequence.new(
                        theme.Primary, 
                        theme.Secondary
                    )
                    gradient.Enabled = true
                    gradient.Name = '#gradient'
                    gradient.Rotation = 0
                    
                    gradient.Parent = trim
                end
            end
            
            local menu = Instance.new('Frame') do 
                menu.BackgroundColor3 = theme.Window2
                menu.BorderColor3 = theme.Inset2
                menu.BorderMode = 'Inset'
                menu.BorderSizePixel = 1
                menu.ClipsDescendants = true 
                menu.Name = '#menu'
                menu.Position = UDim2.fromOffset(0, 0)
                menu.Size = UDim2.fromScale(1, 1)
                menu.Visible = true
                menu.ZIndex = 3901
                 
                menu.Parent = main
                
                do
                    local selectionFrame = Instance.new('Frame') do 
                        selectionFrame.BackgroundColor3 = theme.Button2
                        selectionFrame.BorderSizePixel = 0
                        selectionFrame.Name = '#select'
                        selectionFrame.Size = UDim2.new(1, 0, 0, 16)
                        selectionFrame.Visible = true
                        selectionFrame.ZIndex = 3902
                        
                        selectionFrame.Parent = menu
                        
                        instances.optionHighlight = selectionFrame
                    end
                    
                    local hintContainer = Instance.new('ScrollingFrame') do 
                        hintContainer.AutomaticCanvasSize = 'Y'
                        hintContainer.BackgroundTransparency = 1
                        hintContainer.BorderSizePixel = 0
                        hintContainer.Name = '#container'
                        hintContainer.ScrollBarImageTransparency = 1
                        hintContainer.ScrollingEnabled = false 
                        hintContainer.Size = UDim2.fromScale(1, 1)
                        hintContainer.Visible = true
                        hintContainer.ZIndex = 3902
                        
                        hintContainer.Parent = menu
                        
                        do
                            local layout = Instance.new('UIListLayout') do 
                                layout.FillDirection = 'Vertical'
                                layout.HorizontalAlignment = 'Left'
                                layout.SortOrder = 'Name'
                                layout.VerticalAlignment = 'Top'
                                
                                layout.Parent = hintContainer
                            end
                            
                            local hintOption = Instance.new('TextLabel') do 
                                hintOption.BackgroundTransparency = 1
                                --hintOption.Font = 'SourceSansItalic'
                                hintOption.Name = '#hint'
                                hintOption.RichText = true
                                hintOption.Size = UDim2.new(1, 0, 0, 16)
                                hintOption.Text = 'no suggestions'
                                hintOption.TextColor3 = theme.TextPrimary
                                hintOption.TextSize = 14
                                hintOption.TextStrokeColor3 = theme.TextStroke
                                hintOption.TextStrokeTransparency = 0.8
                                hintOption.TextWrapped = false
                                hintOption.TextXAlignment = 'Left'
                                hintOption.TextYAlignment = 'Center'
                                hintOption.Visible = false
                                hintOption.ZIndex = 3902
                                
                                hintOption.Parent = hintContainer
                                
                                local padding = Instance.new('UIPadding') do 
                                    padding.Name = '#padding'
                                    padding.PaddingLeft = UDim.new(0, 4)
                                    padding.PaddingBottom = UDim.new(0, 2)
                                    
                                    padding.Parent = hintOption
                                end
                                
                                instances.hintTemplate = hintOption
                            end
                        end
                    end
                end
            end
        end
        
        
        instances.main = main
        hint.instances = instances
    end
    
    hint.selection = 1
    hint.handle = nil 
    hint.hintCount = 0
    hint.showing = false
    hint.updateCn = nil
    hint.inputCn = nil
    hint.previousHint = ''
    hint.hints = {}
end


local defaultWinPos = UDim2.fromScale(0.6, 0.6)

local ui = {}

-- classes
local elemClasses = {} 
do 
    -- GLOBAL
    do 
        local baseElement = {} do 
            baseElement.__index = baseElement
            baseElement.bindToEvent = function(self, event, callback) 
                self.binds[event] = callback
                
                return self
            end
            baseElement.fireEvent = function(self, event, ...) 
                local t = self.binds[event]
                if (t) then task.spawn(t, ...) end
                
                return self
            end
            
            baseElement.name = '' 
            baseElement.tooltip = nil
            baseElement.setTooltip = function(self, tooltip) 
                self.tooltip = tostring(tooltip)
                return self
            end
            baseElement.showTooltip = function(self) 
                if (self.tooltip) then 
                    tooltip.showing = true
                    tooltip.handle = self
                    local desc, title, main = tooltip.instances.desc, tooltip.instances.title, tooltip.instances.main
                    
                    title.Text = self.name
                    main.Size = UDim2.fromOffset(140, 20)
                    desc.Text = self.tooltip 
                    
                    local c = 0
                    while (true) do 
                        c += 1 
                        main.Size += UDim2.fromOffset(0, 20)
                        if (c > 30) then
                            desc.Text = 'stop fucking spamming the tooltip jesus christ'
                            main.Size = UDim2.fromOffset(140, 60)
                            break
                        end
                        local _ = desc.TextFits -- for some fucking reason this is needed or else tooltips won't resize properly
                        if (desc.TextFits == true) then break end 
                    end
                    
                    main.Visible = true
                    
                    tooltip.update = renderService.RenderStepped:Connect(function() 
                        local mpos = inputService:GetMouseLocation()
                        main.Position = UDim2.fromOffset(mpos.X,mpos.Y)
                    end)
                end
                return self
            end
            baseElement.hideTooltip = function(self) 
                if (tooltip.handle == self) then 
                    tooltip.showing = false
                    tooltip.handle = nil
                    tooltip.update:Disconnect()
                    
                    tooltip.instances.main.Visible = false
                end
                return self
            end
        end
        elemClasses.baseElement = baseElement
    end
    -- WINDOW
    do
        -- init window class
        local window = {} do 
            window.__index = window
            setmetatable(window, elemClasses.baseElement)
            
            window.class = 'window'
            
            
            window.minimized = false -- is minimized
            window.size = UDim2.fromOffset(450, 350) -- current win size
            window.icon = nil--'rbxassetid://9651932657'
            window.minFocused = false
            
            local instances = {} do 
                local mainFrame = Instance.new('Frame') do 
                    mainFrame.BackgroundColor3 = theme.Window2
                    mainFrame.BackgroundTransparency = 0
                    mainFrame.BorderSizePixel = 0
                    mainFrame.Name = '#main_frame'
                    mainFrame.Position = UDim2.fromScale(0.6, 0.6)
                    mainFrame.Size = UDim2.fromOffset(500, 350)
                    mainFrame.Visible = true
                    mainFrame.ZIndex = 5 
                    
                    --mainFrame.Parent = uiScreen
                end
                
                local scale = Instance.new('UIScale') do 
                    scale.Scale = 1 
                    scale.Name = '#scale'
                    scale.Parent = mainFrame
                end
                
                local backgroundFrame = Instance.new('Frame') do 
                    
                    backgroundFrame.BackgroundTransparency = 0 
                    backgroundFrame.BackgroundColor3 = theme.Window2
                    backgroundFrame.BorderSizePixel = 0 
                    backgroundFrame.Name = '#background'
                    backgroundFrame.Position = UDim2.fromOffset(0, 0)
                    backgroundFrame.Size = UDim2.fromScale(1, 1)
                    backgroundFrame.Visible = true 
                    backgroundFrame.ZIndex = 4
                    backgroundFrame.Parent = mainFrame
                end
                local stroke = Instance.new('UIStroke') do 
                    stroke.ApplyStrokeMode = 'Border'
                    stroke.Color = theme.Stroke
                    stroke.LineJoinMode = 'Round'
                    stroke.Thickness = 1 
                    stroke.Name = '#stroke'
                    
                    stroke.Parent = mainFrame
                end
                local shadow = Instance.new('ImageLabel') do 
                    shadow.AnchorPoint = Vector2.new(0.5, 0.5)
                    shadow.BackgroundTransparency = 1
                    shadow.BorderSizePixel = 0 
                    shadow.Image = 'rbxassetid://7331400934'
                    shadow.ImageColor3 = Color3.fromRGB(0, 0, 5)
                    shadow.Name = '#shadow'
                    shadow.Position = UDim2.fromScale(0.5, 0.5)
                    shadow.ScaleType = 'Slice'
                    shadow.Size = UDim2.new(1, 50, 1, 50)
                    shadow.SliceCenter = Rect.new(40, 40, 260, 260)
                    shadow.SliceScale = 1
                    shadow.ZIndex = 4
                    
                    shadow.Parent = mainFrame
                end
                -- the shitty line at the top
                local trimLine = Instance.new('Frame') do 
                    trimLine.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    trimLine.BackgroundTransparency = 0
                    trimLine.BorderSizePixel = 0 
                    trimLine.Name = '#trim'
                    trimLine.Position = UDim2.fromOffset(0, -1)
                    trimLine.Size = UDim2.new(1, 0, 0, 1)
                    trimLine.ZIndex = 64
                    
                    
                    trimLine.Parent = mainFrame
                    
                    local gradient = Instance.new('UIGradient') do 
                        gradient.Color = ColorSequence.new(
                            theme.Primary, 
                            theme.Secondary
                        )
                        gradient.Enabled = true
                        gradient.Name = '#gradient'
                        gradient.Rotation = 0
                        
                        gradient.Parent = trimLine
                    end
                end
                -- title bar
                local titleBar = Instance.new('Frame') do 
                    titleBar.Active = true
                    titleBar.BackgroundColor3 = theme.Window1
                    titleBar.BackgroundTransparency = 0
                    titleBar.BorderColor3 = theme.Inset1
                    titleBar.BorderMode = 'Inset'
                    titleBar.BorderSizePixel = 1
                    titleBar.ClipsDescendants = true
                    titleBar.Name = '#title-bar'
                    titleBar.Selectable = true
                    titleBar.Size = UDim2.new(1, 0, 0, 26)
                    titleBar.ZIndex = 50
                    
                    titleBar.Parent = mainFrame 
                    
                    local stroke = Instance.new('UIStroke') do 
                        stroke.ApplyStrokeMode = 'Border'
                        stroke.Color = theme.Stroke
                        stroke.LineJoinMode = 'Round'
                        stroke.Thickness = 1 
                        stroke.Name = '#stroke'
                        
                        stroke.Parent = titleBar
                    end
                    
                    local fade = Instance.new('Frame') do 
                        fade.BackgroundColor3 = theme.Window1
                        fade.BackgroundTransparency = 1
                        fade.BorderColor3 = theme.Inset1
                        fade.BorderMode = 'Inset'
                        fade.BorderSizePixel = 1
                        fade.Name = '#fade'
                        fade.Size = UDim2.new(1, 4, 1, 4)
                        fade.Position = UDim2.fromOffset(-2, -2)
                        fade.Visible = false
                        fade.ZIndex = 60
                        
                        fade.Parent = titleBar
                    end
                    
                    local buttonClose = Instance.new('TextButton') do 
                        buttonClose.AnchorPoint = Vector2.new(1, 0)
                        buttonClose.AutoButtonColor = false
                        buttonClose.BackgroundColor3 = theme.Button1
                        buttonClose.BorderSizePixel = 0
                        buttonClose.Name = '#button-close'
                        buttonClose.Position = UDim2.new(1, -3, 0, 2)
                        buttonClose.Size = UDim2.fromOffset(20, 20)
                        buttonClose.Visible = true
                        buttonClose.ZIndex = 52 
                        buttonClose.Text = ''
                        
                        buttonClose.Parent = titleBar
                        
                        local round = Instance.new('UICorner') do 
                            round.CornerRadius = UDim.new(0, rounding and 2 or 0)
                            round.Name = '#round'
                            
                            round.Parent = buttonClose
                        end
                        
                        local stroke = Instance.new('UIStroke') do 
                            stroke.ApplyStrokeMode = 'Border'
                            stroke.Color = theme.Stroke
                            stroke.LineJoinMode = 'Round'
                            stroke.Name = '#stroke'
                            stroke.Thickness = 1 
                            
                            stroke.Parent = buttonClose
                        end
                        
                        local icon = Instance.new('ImageLabel') do 
                            icon.Active = false
                            icon.BackgroundTransparency = 1
                            icon.BorderSizePixel = 0
                            icon.Image = 'rbxassetid://9801460300'
                            icon.ImageColor3 = Color3.fromRGB(255, 255, 255)
                            icon.Name = '#icon'
                            icon.Position = UDim2.fromOffset(0, 0)
                            icon.Size = UDim2.fromScale(1, 1)
                            icon.Visible = true
                            icon.ZIndex = 52 
                            
                            icon.Parent = buttonClose
                            
                            local gradient = Instance.new('UIGradient') do 
                                gradient.Color = ColorSequence.new(
                                    theme.ControlGradient1, 
                                    theme.ControlGradient2
                                )
                                gradient.Rotation = 90
                                gradient.Enabled = true
                                gradient.Name = '#gradient'
                                
                                gradient.Parent = icon
                            end
                        end
                    end
                    
                    local buttonMin = Instance.new('TextButton') do 
                        buttonMin.AnchorPoint = Vector2.new(1, 0)
                        buttonMin.AutoButtonColor = false
                        buttonMin.BackgroundColor3 = theme.Button1
                        buttonMin.BorderSizePixel = 0
                        buttonMin.Name = '#button-min'
                        buttonMin.Position = UDim2.new(1, -27, 0, 2)
                        buttonMin.Size = UDim2.fromOffset(20, 20)
                        buttonMin.Visible = true
                        buttonMin.ZIndex = 52 
                        buttonMin.Text = ''
                        
                        buttonMin.Parent = titleBar
                        
                        local round = Instance.new('UICorner') do 
                            round.CornerRadius = UDim.new(0, rounding and 2 or 0)
                            round.Name = '#round'
                            
                            round.Parent = buttonMin
                        end
                        
                        local stroke = Instance.new('UIStroke') do 
                            stroke.ApplyStrokeMode = 'Border'
                            stroke.Color = theme.Stroke
                            stroke.LineJoinMode = 'Round'
                            stroke.Name = '#stroke'
                            stroke.Thickness = 1 
                            
                            stroke.Parent = buttonMin
                        end
                        
                        local icon = Instance.new('ImageLabel') do 
                            icon.Active = false
                            icon.BackgroundTransparency = 1
                            icon.BorderSizePixel = 0
                            icon.Image = 'rbxassetid://9801458532'
                            icon.ImageColor3 = Color3.fromRGB(255, 255, 255)
                            icon.Name = '#icon'
                            icon.Position = UDim2.fromOffset(0, 0)
                            icon.Size = UDim2.fromScale(1, 1)
                            icon.Visible = true
                            icon.ZIndex = 52 
                            
                            icon.Parent = buttonMin
                            
                            local gradient = Instance.new('UIGradient') do 
                                gradient.Color = ColorSequence.new(
                                    theme.ControlGradient1, 
                                    theme.ControlGradient2
                                )
                                gradient.Rotation = 90
                                gradient.Enabled = true
                                gradient.Name = '#gradient'
                                
                                gradient.Parent = icon
                            end
                        end
                    end
                    
                    local icon = Instance.new('ImageLabel') do 
                        icon.BackgroundTransparency = 1
                        icon.BorderSizePixel = 0
                        icon.Image = 'rbxassetid://10152328589'
                        icon.ImageColor3 = Color3.fromRGB(255, 255, 255)
                        icon.ImageTransparency = 0
                        icon.Name = '#icon'
                        icon.Position = UDim2.fromOffset(2, 1)
                        icon.Size = UDim2.fromOffset(22, 22)
                        icon.Visible = true
                        icon.ZIndex = 51
                        
                        icon.Parent = titleBar
                    end
                    
                    local title = Instance.new('TextLabel') do 
                        title.BackgroundTransparency = 1
                        title.BorderSizePixel = 0
                        title.Font = 'RobotoCondensed'
                        title.Name = '#title'
                        title.Position = UDim2.fromOffset(24, 0)
                        title.RichText = true
                        title.Size = UDim2.new(1, -74, 1, 0)
                        title.Text = 'j'
                        title.TextColor3 = theme.TextPrimary
                        title.TextScaled = false
                        title.TextSize = 17
                        title.TextStrokeColor3 = theme.TextStroke
                        title.TextStrokeTransparency = 0.8 -- tstroke 
                        title.TextTransparency = 0
                        title.TextXAlignment = 'Left'
                        title.TextYAlignment = 'Center'
                        title.Visible = true
                        title.ZIndex = 52 
                        
                        title.Parent = titleBar
                        
                        local padding = Instance.new('UIPadding') do 
                            padding.PaddingLeft = UDim.new(0, 4)
                            padding.Name = '#padding'
                            
                            padding.Parent = title
                        end
                    end
                end
                -- page region
                local pageRegion = Instance.new('Frame') do 
                    pageRegion.BackgroundColor3 = theme.Window2
                    pageRegion.BackgroundTransparency = 0
                    pageRegion.BorderColor3 = theme.Inset2
                    pageRegion.BorderMode = 'Inset'
                    pageRegion.BorderSizePixel = 1
                    pageRegion.ClipsDescendants = true 
                    pageRegion.Name = '#page-region'
                    --pageRegion.Position = UDim2.new(0.25, 1, 0, 27)
                    --pageRegion.Size = UDim2.new(0.75, -1, 1, -27)
                    pageRegion.Position = UDim2.new(0, 126, 0, 27)
                    pageRegion.Size = UDim2.new(1, -126, 1, -27)
                    pageRegion.Visible = true
                    pageRegion.ZIndex = 30
                    
                    pageRegion.Parent = mainFrame
                    --[[
                    local shadowLeft = Instance.new('Frame') do 
                        shadowLeft.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
                        shadowLeft.BackgroundTransparency = 0
                        shadowLeft.BorderSizePixel = 0
                        shadowLeft.Name = '#shadow-left'
                        shadowLeft.Position = UDim2.fromOffset(1, 0)
                        shadowLeft.Size = UDim2.new(0, 5, 1, 0)
                        shadowLeft.Visible = true
                        shadowLeft.ZIndex = 48
                        
                        shadowLeft.Parent = pageRegion
                        
                        local gradient = Instance.new('UIGradient') do 
                            gradient.Name = '#gradient'
                            gradient.Transparency = NumberSequence.new({
                                NumberSequenceKeypoint.new(0, 0.75), 
                                NumberSequenceKeypoint.new(1, 1)
                            })
                            gradient.Parent = shadowLeft
                        end
                    end
                    
                    local shadowTop = Instance.new('Frame') do 
                        shadowTop.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
                        shadowTop.BackgroundTransparency = 0
                        shadowTop.BorderSizePixel = 0
                        shadowTop.Name = '#shadow-top'
                        shadowTop.Position = UDim2.fromOffset(1, 0)
                        shadowTop.Size = UDim2.new(0, 5, 1, 0)
                        shadowTop.Visible = true
                        shadowTop.ZIndex = 48
                        
                        shadowTop.Parent = pageRegion
                        
                        local gradient = Instance.new('UIGradient') do 
                            gradient.Name = '#gradient'
                            gradient.Transparency = NumberSequence.new({
                                NumberSequenceKeypoint.new(0, 0.75), 
                                NumberSequenceKeypoint.new(1, 1)
                            })
                            gradient.Rotation = 90
                            
                            gradient.Parent = shadowTop
                        end
                    end]]
                end
                
                -- sidebar
                local sideBar = Instance.new('Frame') do 
                    sideBar.BackgroundColor3 = theme.Window3
                    sideBar.BackgroundTransparency = 0 
                    sideBar.BorderColor3 = theme.Inset3
                    sideBar.BorderMode = 'Inset'
                    sideBar.BorderSizePixel = 1
                    sideBar.Name = '#sidebar'
                    sideBar.Position = UDim2.fromOffset(0, 27)
                    --sideBar.Size = UDim2.new(0.25, 0, 1, -27)
                    sideBar.Size = UDim2.new(0, 125, 1, -27)
                    sideBar.Visible = true
                    sideBar.ZIndex = 50
                    
                    sideBar.Parent = mainFrame
                    
                    local stroke = Instance.new('UIStroke') do 
                        stroke.ApplyStrokeMode = 'Border'
                        stroke.Color = theme.Stroke
                        stroke.LineJoinMode = 'Round'
                        stroke.Name = '#stroke'
                        stroke.Thickness = 1 
                        
                        stroke.Parent = sideBar
                    end

                    
                    local menu = Instance.new('ScrollingFrame') do 
                        menu.AutomaticCanvasSize = 'Y'
                        menu.BackgroundTransparency = 1
                        menu.BorderSizePixel = 0
                        menu.BottomImage = 'rbxassetid://9416839567'
                        menu.CanvasSize = UDim2.fromOffset(0, 0)
                        menu.MidImage = 'rbxassetid://9416839567'
                        menu.Name = '#menu'
                        menu.Position = UDim2.fromOffset(1, 1)
                        menu.ScrollBarImageColor3 = Color3.fromRGB(255, 255, 255)
                        menu.ScrollBarImageTransparency = 0.9
                        menu.ScrollBarThickness = 1
                        menu.ScrollingDirection = 'Y'
                        menu.ScrollingEnabled = true
                        menu.Size = UDim2.new(1, -2, 1, -2)
                        menu.TopImage = 'rbxassetid://9416839567'
                        menu.Visible = true
                        menu.ZIndex = 51
                        
                        menu.Parent = sideBar
                        
                        local layout = Instance.new('UIListLayout') do 
                            layout.FillDirection = 'Vertical'
                            layout.HorizontalAlignment = 'Center'
                            layout.Name = '#layout'
                            layout.Padding = UDim.new(0, 6)
                            layout.SortOrder = 'LayoutOrder'
                            layout.VerticalAlignment = 'Top'
                            
                            layout.Parent = menu
                        end
                        
                        local padding = Instance.new('UIPadding') do 
                            padding.Name = '#padding'
                            padding.PaddingTop = UDim.new(0, 5)
                            
                            padding.Parent = menu
                        end
                    end
                end
                
                -- resize handle
                local resizeHandle = Instance.new('ImageLabel') do 
                    resizeHandle.BackgroundTransparency = 1
                    resizeHandle.Image = 'rbxassetid://9995727737'
                    resizeHandle.ImageColor3 = theme.Primary
                    resizeHandle.Name = '#resize-handle'
                    resizeHandle.Position = UDim2.new(1, -10, 1, -10)
                    resizeHandle.Size = UDim2.fromOffset(10, 10)
                    resizeHandle.ZIndex = 34
                    
                    resizeHandle.Parent = mainFrame
                end
                
                instances.mainFrame = mainFrame
            end
            window.instances = instances 
            window.signals = {
                buttonClose = {
                    MouseEnter = function(self) 
                        tween(self, {BackgroundColor3 = theme.Button2}, 0.2, 1)
                        tween(self['#stroke'], {Color = theme.StrokeHover}, 0.2, 1)
                    end,
                    MouseLeave = function(self) 
                        tween(self, {BackgroundColor3 = theme.Button1}, 0.2, 1)
                        tween(self['#stroke'], {Color = theme.Stroke}, 0.2, 1)
                    end,
                    MouseButton1Click = function(_, self) 
                        self:destroy()
                    end
                },
                buttonMin = {
                    MouseEnter = function(self, w) 
                        w.minFocused = true
                        
                        if (w.minimized) then
                            tween(self, {BackgroundColor3 = theme.Button4}, 0.2, 1)
                        else
                            tween(self, {BackgroundColor3 = theme.Button2}, 0.2, 1)
                        end
                        tween(self['#stroke'], {Color = theme.StrokeHover}, 0.2, 1)
                    end,
                    MouseLeave = function(self, w) 
                        w.minFocused = false
                        
                        if (w.minimized) then
                            tween(self, {BackgroundColor3 = theme.Button3}, 0.2, 1)
                        else
                            tween(self, {BackgroundColor3 = theme.Button1}, 0.2, 1)
                        end
                        tween(self['#stroke'], {Color = theme.Stroke}, 0.2, 1)
                    end,
                    MouseButton1Click = function(_, self) 
                        self:minimize()
                    end
                }
            }
            
            
            
            window.destroy = function(self) 
                
                if (ui.autoDisableToggles) then 
                    for _, menu in ipairs(self.menus) do 
                        for _, section in ipairs(menu.sections) do 
                            for _, control in ipairs(section.controls) do 
                                if (control.class == 'picker') then
                                    if (control.chromaCon) then 
                                        control.chromaCon:Disconnect()
                                    end
                                    local pwin = control.pickerWindow
                                    if (pwin) then
                                        if (pwin.chromaCon) then 
                                            pwin.chromaCon:Disconnect()
                                        end
                                        pwin:bindToEvent('close',nil)
                                        pwin:destroy()
                                    end
                                elseif (control.class == 'toggle') then 
                                    if (control.toggled) then
                                        control:disable()
                                    end
                                end
                            end
                        end
                    end
                end
                local mainFrame = self.instances.mainFrame
                task.spawn(function()
                    --tween(mainFrame, {Position = UDim2.new(0, mainFrame.AbsolutePosition.X, 1, mainFrame.AbsoluteSize.Y)}, 1, 1)
                    local animCon
                    
                    task.spawn(function() 
                        
                        
                        local backgroundTransparency = {}
                        local scrollBarImageTransparency = {}
                        local imageTransparency = {}
                        local transparency = {}
                        local textTransparency = {}
                        
                        local s = {
                            Frame = {backgroundTransparency}, 
                            ImageButton = {backgroundTransparency, imageTransparency},
                            ImageLabel = {backgroundTransparency, imageTransparency},
                            TextButton = {backgroundTransparency, textTransparency},
                            TextLabel = {backgroundTransparency, textTransparency},
                            TextBox = {backgroundTransparency, textTransparency},
                            ScrollingFrame = {backgroundTransparency, scrollBarImageTransparency},
                            UIStroke = {transparency},
                        }
                        local d = mainFrame:GetDescendants()
                        table.insert(d, mainFrame)
                        
                        for i, v in ipairs(d) do 
                            local a = s[v.ClassName]
                            if (a) then
                                for i = 1, #a do 
                                    table.insert(a[i], v)
                                end
                            end
                        end
                        
                        for i,v in ipairs(transparency) do
                            v.Transparency = 1
                        end
                        for i,v in ipairs(scrollBarImageTransparency) do 
                            v.ScrollBarImageTransparency = 1 
                        end
                        
                        transparency = nil
                        scrollBarImageTransparency = nil
                        animCon = renderService.RenderStepped:Connect(function(dt) 
                            dt *= 8
                            for i= 1, #backgroundTransparency do 
                                backgroundTransparency[i].BackgroundTransparency += dt
                            end
                            for i= 1, #imageTransparency do 
                                imageTransparency[i].ImageTransparency += dt
                            end
                            for i= 1, #textTransparency do 
                                textTransparency[i].TextTransparency += dt
                            end
                        end)
                    end)
                    tween(mainFrame['#scale'], {Scale = 0.6}, 0.5, 1).Completed:Wait()--{Size = UDim2.fromOffset(mainFrame.AbsoluteSize.X, 0)}, 0.5, 1).Completed:Wait()
                    animCon:Disconnect()
                    mainFrame:Destroy()
                end)
                
                table.remove(ui.windows, table.find(ui.windows, self))
                if (#ui.windows == 0) then
                    wait(0.3)
                    ui.destroy(true) 
                end
                
                self:fireEvent('destroyInternal')
                return self 
            end
            window.setTitle = function(self, title) 
                self.instances.title.Text = tostring(title)
                return self 
            end
            window.setIcon = function(self, newIcon) 
                self.instances.mainFrame['#title-bar']['#icon'].Image = newIcon
                return self
            end
            window.setPosition = function(self, newPosition)
                -- type coercion :money
                if (typeof(newPosition) == 'Vector2') then
                    newPosition = UDim2.fromOffset(newPosition.X, newPosition.Y)
                elseif (typeof(newPosition) ~= 'UDim2') then
                    return error('expected type UDim2 or Vector2', 2)
                end
                self.instances.mainFrame.Position = newPosition
                return self 
                
            end
            window.setSize = function(self, size)
                -- type coercion :money
                if (typeof(size) == 'Vector2') then
                    size = UDim2.fromOffset(size.X, size.Y)
                elseif (typeof(size) ~= 'UDim2') then
                    return error('expected type UDim2 or Vector2', 2)
                end
                self.size = size
                self.instances.mainFrame.Size = size
                return self 
            end
            
            window.getPosition = function(self) 
                return self.instances.mainFrame.Position
            end
            window.getSize = function(self, targetSize) 
                return targetSize and self.size or self.instances.mainFrame.Size
            end
            
            window.new = function(self, resize) 
                -- inherit some functions and stuff
                local new = setmetatable({}, self)
                new.menus = {}
                new.binds = {}
                table.insert(ui.windows, new)
                
                local instances = {}
                -- copy the main gui 
                instances.mainFrame = self.instances.mainFrame:Clone()
                
                
                -- scuffed
                --[[
                local idx = #ui.windows * 200
                for i,v in ipairs(instances.mainFrame:GetDescendants()) do 
                    if (v:IsA('GuiObject')) then
                        v.ZIndex += idx
                    end
                end]]
                
                local titleBar = instances.mainFrame['#title-bar']
                
                instances.buttonClose = titleBar['#button-close']
                instances.buttonMin = titleBar['#button-min']
                instances.titleBar = titleBar
                instances.title = titleBar['#title']
                instances.gradient = instances.mainFrame['#trim']['#gradient']
                instances.sideBar = instances.mainFrame['#sidebar']
                instances.tabMenu = instances.sideBar['#menu']
                instances.pageRegion = instances.mainFrame['#page-region']
                instances.resizeHandle = instances.mainFrame['#resize-handle']
                
                -- setup signals
                for i, signals in pairs(self.signals) do 
                    local inst = instances[i]
                    for signal, func in pairs(signals) do
                        local h = inst[signal]:Connect(function() 
                            func(inst, new)
                        end)
                    end
                end
                
                -- dragging
                do 
                    local dCon
                    local aCon
                    local mainFrame = instances.mainFrame
                    local targetPos
                    
                    titleBar.InputBegan:Connect(function(io) 
                        if (io.UserInputType.Value == 0) then
                            local rootPos = mainFrame.AbsolutePosition
                            local startPos = io.Position
                            
                            startPos = Vector2.new(startPos.X, startPos.Y)
                            
                            targetPos = UDim2.fromOffset(rootPos.X, rootPos.Y)
                            aCon = renderService.RenderStepped:Connect(function(dt) 
                                mainFrame.Position = mainFrame.Position:lerp(targetPos, 1 - animSpeed^dt)-- 1 - 1e-12^dt)
                            end)
                            
                            dCon = inputService.InputChanged:Connect(function(io) 
                                if (io.UserInputType.Value == 4) then
                                    local curPos = io.Position
                                    curPos = Vector2.new(curPos.X, curPos.Y) 
                                    
                                    local dest = rootPos + (curPos - startPos)
                                    targetPos = UDim2.fromOffset(dest.X, dest.Y)
                                end
                            end)
                            
                        end
                    end)
                    titleBar.InputEnded:Connect(function(io)
                        if (io.UserInputType.Value == 0) then
                            dCon:Disconnect()
                            aCon:Disconnect()
                            
                            tween(mainFrame, {Position = targetPos}, 0.2, 1)
                        end
                    end)
                end
                -- resizing
                if (resize) then
                    local dCon
                    local aCon
                    local mainFrame = instances.mainFrame
                    local resizeHandle = instances.resizeHandle
                    
                    local targetSize
                    
                    resizeHandle.InputBegan:Connect(function(io) 
                        if (io.UserInputType.Value == 0 and not new.minimized) then
                            local rootSize = mainFrame.AbsoluteSize
                            local startPos = io.Position
                            
                            startPos = Vector2.new(startPos.X, startPos.Y)
                            
                            targetSize = UDim2.fromOffset(rootSize.X, rootSize.Y)
                            aCon = renderService.RenderStepped:Connect(function(dt) 
                                mainFrame.Size = mainFrame.Size:lerp(targetSize, 1 - animSpeed^dt)-- 1 - 1e-12^dt)
                                new.size = mainFrame.Size
                            end)
                            
                            dCon = inputService.InputChanged:Connect(function(io) 
                                if (io.UserInputType.Value == 4) then
                                    local curPos = io.Position
                                    curPos = Vector2.new(curPos.X, curPos.Y) 
                                    
                                    local dest = rootSize + (curPos - startPos)
                                    targetSize = UDim2.fromOffset(math.clamp(dest.X, 400, 800), math.clamp(dest.Y, 300, 600))
                                end
                            end)
                            
                        end
                    end)
                    resizeHandle.InputEnded:Connect(function(io)
                        if (io.UserInputType.Value == 0 and not new.minimized) then
                            dCon:Disconnect()
                            aCon:Disconnect()
                            
                            tween(mainFrame, {Size = targetSize}, 0.2, 1)
                            new.size = targetSize
                        end
                    end)
                else
                    instances.resizeHandle.Visible = false
                end
                -- finalize stuff
                instances.mainFrame.Parent = uiScreen
                new.instances = instances
                return new
            end
            window.minimize = function(self) 
                local newState = not self.minimized
                local mf = self.instances.mainFrame
                local bmin = mf['#title-bar']['#button-min']
                local bminIcon = bmin['#icon']
                
                
                if (newState) then
                    tween(mf, {Size = UDim2.fromOffset(self.size.X.Offset, 26)}, 0.3, 1)
                    bminIcon.Image = 'rbxassetid://9642646619'
                    
                    tween(bminIcon, {
                        Rotation = 45,
                        ImageColor3 = theme.Primary
                    }, 0.3, 1)
                    if (self.minFocused) then
                        tween(bmin, {BackgroundColor3 = theme.Button4}, 0.2, 1)
                    else
                        tween(bmin, {BackgroundColor3 = theme.Button3}, 0.2, 1)
                    end
                    
                    mf['#page-region'].Visible = false
                    mf['#sidebar'].Visible = false
                else
                    tween(mf, {Size = self.size}, 0.3, 1)
                    bminIcon.Image = 'rbxassetid://9642680675'
                    tween(bminIcon, {
                        Rotation = 0,
                        ImageColor3 = Color3.fromRGB(255, 255, 255)
                    }, 0.3, 1)
                    
                    if (self.minFocused) then
                        tween(bmin, {BackgroundColor3 = theme.Button2}, 0.2, 1)
                    else
                        tween(bmin, {BackgroundColor3 = theme.Button1}, 0.2, 1)
                    end
                    
                    mf['#page-region'].Visible = true
                    mf['#sidebar'].Visible = true
                end
                self.minimized = newState
            end            
            
        end
        -- add the window class
        elemClasses.window = window
    end
    -- Upstream picker retained as an uncalled factory; upgraded popup is lazy.
    local function initializeLegacyPicker() 
        local function polarToCart(r, theta) 
            return r * math.cos(theta), r * math.sin(theta)
        end
        
        local function cartToPolar(x, y) 
            return math.sqrt((x^2) + (y^2)), math.atan2(y, x)
        end
        
        local pickerWindow = {} do 
            pickerWindow.__index = pickerWindow
            setmetatable(pickerWindow, elemClasses.baseElement)
            
            pickerWindow.class = 'pickerWindow'
            
            pickerWindow.minimized = false -- is minimized
            pickerWindow.minFocused = false
            
            
            pickerWindow.hue = 0
            pickerWindow.sat = 0
            pickerWindow.val = 1
            
            pickerWindow.red = 255
            pickerWindow.green = 255
            pickerWindow.blue = 255
            
            pickerWindow.color = Color3.fromHSV(0, 0, 1)
            
            pickerWindow.chromaEnabled = false
            pickerWindow.chromaFocused = false
            
            pickerWindow.pickerMoving = false
            
            pickerWindow.toggleChroma = function(self) 
                local newState = not self.chromaEnabled
                local chromaButton = self.instances.chromaButton
                
                if (newState) then
                    

                    if (self.chromaFocused) then
                        tween(chromaButton, {BackgroundColor3 = theme.Button4}, 0.2, 1)
                    else
                        tween(chromaButton, {BackgroundColor3 = theme.Button2}, 0.2, 1)
                    end
                    tween(chromaButton['#icon'], {Rotation = 360}, 0.5, 1)
                    tween(self.instances.speedSlider, {Position = UDim2.new(0, 4, 1, -24)}, 0.5, 1)
                    
                    chromaButton['#icon'].Image = 'rbxassetid://9840988620'
                    self:fireEvent('chroma', true)
                    
                else
                    if (self.chromaFocused) then
                        tween(chromaButton, {BackgroundColor3 = theme.Button3}, 0.2, 1)
                    else
                        tween(chromaButton, {BackgroundColor3 = theme.Button1}, 0.2, 1)
                    end
                    tween(chromaButton['#icon'], {Rotation = 0}, 0.5, 1)
                    tween(self.instances.speedSlider, {Position = UDim2.new(0, -44, 1, -24)}, 0.5, 1)
                    chromaButton['#icon'].Image = 'rbxassetid://9841673199'
                    
                    self:fireEvent('chroma', false)
                end
                
                
                self.chromaEnabled = newState 
                return newState
            end
            
            pickerWindow.displayRGB = function(self) 
                local r, g, b = self.red, self.green, self.blue
                self.color = Color3.fromRGB(r, g, b)
                
                local hue, sat, val = self.color:ToHSV()
                
                self.hue = hue
                self.sat = sat
                self.val = val
                
                local radius = sat / 2
                local theta = (hue * (math.pi * 2)) - (math.pi * 2)
                
                local x, y = radius * math.cos(theta), radius * math.sin(theta)
                
                self.instances.valSlider['#slider-container'].BackgroundColor3 = Color3.fromHSV(hue, sat, 1)
                
                tween(self.instances.valCursor, {Position = UDim2.fromScale(val, 0)}, 0.3, 1)
                tween(self.instances.pickerCursor, {Position = UDim2.fromScale(x+0.5, y+0.5)}, 0.3, 1)
                
                self:fireEvent('newColor', self.color, {hue, sat, val})
            end
            
            pickerWindow.displayHSV = function(self, moveCursor) 
                local hue, sat, val = self.hue, self.sat, self.val
                self.color = Color3.fromHSV(hue, sat, val)
                local r, g, b = self.color.R * 255, self.color.G * 255, self.color.B * 255
                
                self.red = r
                self.green = g
                self.blue = b
                
                
                local instances = self.instances 
                
                instances.valSlider['#slider-container'].BackgroundColor3 = Color3.fromHSV(hue, sat, 1)
                tween(instances.redFill, {Size = UDim2.fromScale(r/255, 1)}, 0.3, 1)
                tween(instances.greenFill, {Size = UDim2.fromScale(g/255, 1)}, 0.3, 1)
                tween(instances.blueFill, {Size = UDim2.fromScale(b/255, 1)}, 0.3, 1)
                
                instances.redSlider['#val'].Text = math.floor(r)
                instances.greenSlider['#val'].Text = math.floor(g)
                instances.blueSlider['#val'].Text = math.floor(b)
                
                if (moveCursor) then
                    local radius = sat / 2
                    local theta = (hue * (math.pi * 2)) - (math.pi * 2)
                    
                    local x, y = radius * math.cos(theta), radius * math.sin(theta)
                                        
                    tween(instances.valCursor, {Position = UDim2.fromScale(val, 0)}, 0.3, 1)
                    tween(instances.pickerCursor, {Position = UDim2.fromScale(x+0.5, y+0.5)}, 0.3, 1)
                end
                
                self:fireEvent('newColor', self.color, {hue, sat, val})
            end
            
            
            
            
            local instances = {} do 
                local main = Instance.new('Frame') do 
                    main.BackgroundColor3 = theme.Window2
                    main.BackgroundTransparency = 0
                    main.BorderSizePixel = 0
                    main.Name = '#main_frame'
                    main.Size = UDim2.fromOffset(300, 300)
                    main.Visible = true
                    main.ZIndex = 100
                end
                
                local scale = Instance.new('UIScale') do 
                    scale.Scale = 1 
                    scale.Name = '#scale'
                    scale.Parent = main
                end
                
                local backgroundFrame = Instance.new('Frame') do 
                    backgroundFrame.BackgroundTransparency = 0 
                    backgroundFrame.BackgroundColor3 = theme.Window2
                    backgroundFrame.BorderSizePixel = 0 
                    backgroundFrame.Name = '#background'
                    backgroundFrame.Size = UDim2.fromScale(1, 1)
                    backgroundFrame.Visible = true 
                    backgroundFrame.ZIndex = 99
                    
                    backgroundFrame.Parent = trim
                end
                local stroke = Instance.new('UIStroke') do 
                    stroke.ApplyStrokeMode = 'Border'
                    stroke.Color = theme.Stroke
                    stroke.LineJoinMode = 'Round'
                    stroke.Thickness = 1 
                    stroke.Name = '#stroke'
                    
                    stroke.Parent = main
                end
                local shadow = Instance.new('ImageLabel') do 
                    shadow.AnchorPoint = Vector2.new(0.5, 0.5)
                    shadow.BackgroundTransparency = 1
                    shadow.BorderSizePixel = 0 
                    shadow.Image = 'rbxassetid://7331400934'
                    shadow.ImageColor3 = Color3.fromRGB(0, 0, 5)
                    shadow.Name = '#shadow'
                    shadow.Position = UDim2.fromScale(0.5, 0.5)
                    shadow.ScaleType = 'Slice'
                    shadow.Size = UDim2.new(1, 50, 1, 50)
                    shadow.SliceCenter = Rect.new(40, 40, 260, 260)
                    shadow.SliceScale = 1
                    shadow.ZIndex = 98
                    
                    shadow.Parent = main
                end

                local trim = Instance.new('Frame') do 
                    trim.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    trim.BackgroundTransparency = 0
                    trim.BorderSizePixel = 0 
                    trim.Name = '#trim'
                    trim.Position = UDim2.fromOffset(0, -1)
                    trim.Size = UDim2.new(1, 0, 0, 1)
                    trim.ZIndex = 111
                    
                    trim.Parent = main
                    
                    local gradient = Instance.new('UIGradient') do 
                        gradient.Color = ColorSequence.new(
                            theme.Primary, 
                            theme.Secondary
                        )
                        gradient.Enabled = true
                        gradient.Name = '#gradient'
                        gradient.Rotation = 0
                        
                        gradient.Parent = trim
                    end
                end

                local titleBar = Instance.new('Frame') do 
                    titleBar.Active = true
                    titleBar.BackgroundColor3 = theme.Window1
                    titleBar.BackgroundTransparency = 0
                    titleBar.BorderColor3 = theme.Inset1
                    titleBar.BorderMode = 'Inset'
                    titleBar.BorderSizePixel = 1
                    titleBar.ClipsDescendants = true
                    titleBar.Name = '#title-bar'
                    titleBar.Selectable = true
                    titleBar.Size = UDim2.new(1, 0, 0, 26)
                    titleBar.ZIndex = 101
                    
                    titleBar.Parent = main 
                    
                    local stroke = Instance.new('UIStroke') do 
                        stroke.ApplyStrokeMode = 'Border'
                        stroke.Color = theme.Stroke
                        stroke.LineJoinMode = 'Round'
                        stroke.Thickness = 1 
                        stroke.Name = '#stroke'
                        
                        stroke.Parent = titleBar
                    end
                    
                    local fade = Instance.new('Frame') do 
                        fade.BackgroundColor3 = theme.Window1
                        fade.BackgroundTransparency = 1
                        fade.BorderColor3 = theme.Inset1
                        fade.BorderMode = 'Inset'
                        fade.BorderSizePixel = 1
                        fade.Name = '#fade'
                        fade.Size = UDim2.new(1, 4, 1, 4)
                        fade.Position = UDim2.fromOffset(-2, -2)
                        fade.Visible = false
                        fade.ZIndex = 110
                        
                        fade.Parent = titleBar
                    end
                    
                    local buttonClose = Instance.new('TextButton') do 
                        buttonClose.AnchorPoint = Vector2.new(1, 0)
                        buttonClose.AutoButtonColor = false
                        buttonClose.BackgroundColor3 = theme.Button1
                        buttonClose.BorderSizePixel = 0
                        buttonClose.Name = '#button-close'
                        buttonClose.Position = UDim2.new(1, -3, 0, 2)
                        buttonClose.Size = UDim2.fromOffset(20, 20)
                        buttonClose.Visible = true
                        buttonClose.ZIndex = 102 
                        buttonClose.Text = ''
                        
                        buttonClose.Parent = titleBar
                        
                        local round = Instance.new('UICorner') do 
                            round.CornerRadius = UDim.new(0, rounding and 2 or 0)
                            round.Name = '#round'
                            
                            round.Parent = buttonClose
                        end
                        
                        local stroke = Instance.new('UIStroke') do 
                            stroke.ApplyStrokeMode = 'Border'
                            stroke.Color = theme.Stroke
                            stroke.LineJoinMode = 'Round'
                            stroke.Name = '#stroke'
                            stroke.Thickness = 1 
                            
                            stroke.Parent = buttonClose
                        end
                        
                        local icon = Instance.new('ImageLabel') do 
                            icon.Active = false
                            icon.BackgroundTransparency = 1
                            icon.BorderSizePixel = 0
                            icon.Image = 'rbxassetid://9801460300'
                            icon.ImageColor3 = Color3.fromRGB(255, 255, 255)
                            icon.Name = '#icon'
                            icon.Position = UDim2.fromOffset(0, 0)
                            icon.Size = UDim2.fromScale(1, 1)
                            icon.Visible = true
                            icon.ZIndex = 102
                            
                            icon.Parent = buttonClose
                            
                            local gradient = Instance.new('UIGradient') do 
                                gradient.Color = ColorSequence.new(
                                    theme.ControlGradient1,
                                    theme.ControlGradient2
                                )
                                gradient.Rotation = 90
                                gradient.Enabled = true
                                gradient.Name = '#gradient'
                                
                                gradient.Parent = icon
                            end
                        end
                    end
                    
                    local buttonMin = Instance.new('TextButton') do 
                        buttonMin.AnchorPoint = Vector2.new(1, 0)
                        buttonMin.AutoButtonColor = false
                        buttonMin.BackgroundColor3 = theme.Button1
                        buttonMin.BorderSizePixel = 0
                        buttonMin.Name = '#button-min'
                        buttonMin.Position = UDim2.new(1, -27, 0, 2)
                        buttonMin.Size = UDim2.fromOffset(20, 20)
                        buttonMin.Visible = true
                        buttonMin.ZIndex = 102 
                        buttonMin.Text = ''
                        
                        buttonMin.Parent = titleBar
                        
                        local round = Instance.new('UICorner') do 
                            round.CornerRadius = UDim.new(0, rounding and 2 or 0)
                            round.Name = '#round'
                            
                            round.Parent = buttonMin
                        end
                        
                        local stroke = Instance.new('UIStroke') do 
                            stroke.ApplyStrokeMode = 'Border'
                            stroke.Color = theme.Stroke
                            stroke.LineJoinMode = 'Round'
                            stroke.Name = '#stroke'
                            stroke.Thickness = 1 
                            
                            stroke.Parent = buttonMin
                        end
                        
                        local icon = Instance.new('ImageLabel') do 
                            icon.Active = false
                            icon.BackgroundTransparency = 1
                            icon.BorderSizePixel = 0
                            icon.Image = 'rbxassetid://9801458532'
                            icon.ImageColor3 = Color3.fromRGB(255, 255, 255)
                            icon.Name = '#icon'
                            icon.Position = UDim2.fromOffset(0, 0)
                            icon.Size = UDim2.fromScale(1, 1)
                            icon.Visible = true
                            icon.ZIndex = 102 
                            
                            icon.Parent = buttonMin
                            
                            local gradient = Instance.new('UIGradient') do 
                                gradient.Color = ColorSequence.new(
                                    theme.ControlGradient1,
                                    theme.ControlGradient2
                                )
                                gradient.Rotation = 90
                                gradient.Enabled = true
                                gradient.Name = '#gradient'
                                
                                gradient.Parent = icon
                            end
                        end
                    end
                    
                    local icon = Instance.new('ImageLabel') do 
                        icon.BackgroundTransparency = 1
                        icon.BorderSizePixel = 0
                        icon.Image = 'rbxassetid://9658988382'
                        icon.ImageColor3 = Color3.fromRGB(255, 255, 255)
                        icon.ImageTransparency = 0
                        icon.Name = '#icon'
                        icon.Position = UDim2.fromOffset(2, 2)
                        icon.Size = UDim2.fromOffset(22, 22)
                        icon.Visible = true
                        icon.ZIndex = 103
                        
                        icon.Parent = titleBar
                    end
                    
                    local title = Instance.new('TextLabel') do 
                        title.BackgroundTransparency = 1
                        title.BorderSizePixel = 0
                        title.Font = 'RobotoCondensed'
                        title.Name = '#title'
                        title.Position = UDim2.fromOffset(24, 0)
                        title.RichText = true
                        title.Size = UDim2.new(1, -74, 1, 0)
                        title.Text = 'color picker'
                        title.TextColor3 = theme.TextPrimary
                        title.TextScaled = false
                        title.TextSize = 17
                        title.TextStrokeColor3 = theme.TextStroke
                        title.TextStrokeTransparency = 0.8 -- tstroke 
                        title.TextTransparency = 0
                        title.TextXAlignment = 'Left'
                        title.TextYAlignment = 'Center'
                        title.Visible = true
                        title.ZIndex = 102 
                        
                        title.Parent = titleBar
                        
                        local padding = Instance.new('UIPadding') do 
                            padding.PaddingLeft = UDim.new(0, 4)
                            padding.Name = '#padding'
                            
                            padding.Parent = title
                        end
                    end
                end

                local region = Instance.new('Frame') do 
                    region.BackgroundColor3 = theme.Window2
                    region.BackgroundTransparency = 0
                    region.BorderColor3 = theme.Inset2
                    region.BorderMode = 'Inset'
                    region.BorderSizePixel = 1
                    region.ClipsDescendants = true 
                    region.Name = '#region'
                    region.Position = UDim2.fromOffset(0, 27)
                    region.Size = UDim2.new(1, 0, 1, -27)
                    region.Visible = true
                    region.ZIndex = 102
                    
                    region.Parent = main
                    
                    local pickerRegion = Instance.new('Frame') do 
                        pickerRegion.BackgroundColor3 = theme.Window2
                        pickerRegion.BackgroundTransparency = 0
                        pickerRegion.BorderColor3 = theme.Inset2
                        pickerRegion.BorderMode = 'Inset'
                        pickerRegion.BorderSizePixel = 1 
                        pickerRegion.ClipsDescendants = true
                        pickerRegion.Name = '#region-picker'
                        pickerRegion.Position = UDim2.fromOffset(2, 2)
                        pickerRegion.Size = UDim2.new(1, -4, 0.75, -4)
                        pickerRegion.Visible = true 
                        pickerRegion.ZIndex = 102
                        
                        pickerRegion.Parent = region 
                        
                        local stroke = Instance.new('UIStroke') do 
                            stroke.ApplyStrokeMode = 'Border'
                            stroke.Color = theme.Stroke
                            stroke.LineJoinMode = 'Round'
                            stroke.Name = '#stroke'
                            stroke.Thickness = 1 
                            
                            stroke.Parent = pickerRegion
                        end
                        
                        local picker = Instance.new('ImageLabel') do 
                            picker.AnchorPoint = Vector2.new(0.5, 0.5)
                            picker.BackgroundTransparency = 1
                            picker.Image = 'rbxassetid://9801454501'
                            picker.Name = '#picker'
                            picker.Position = UDim2.fromScale(0.5, 0.5)
                            picker.Size = UDim2.fromScale(0.7, 0.7)
                            picker.SizeConstraint = 'RelativeYY'
                            picker.Visible = true
                            picker.ZIndex = 104
                            
                            picker.Parent = pickerRegion
                        
                            local cursorInner = Instance.new('Frame') do 
                                cursorInner.AnchorPoint = Vector2.new(0.5, 0.5)
                                cursorInner.BackgroundTransparency = 1
                                cursorInner.Name = '#cursor-inner'
                                cursorInner.Position = UDim2.fromScale(0.5, 0.5)
                                cursorInner.Size = UDim2.fromOffset(8, 8)
                                cursorInner.Visible = true
                                cursorInner.ZIndex = 106 
                                
                                cursorInner.Parent = picker 
                                
                                local round = Instance.new('UICorner') do 
                                    round.CornerRadius = UDim.new(1, 0)
                                    round.Name = '#round'
                                    
                                    round.Parent = cursorInner
                                end
                                
                                local stroke = Instance.new('UIStroke') do 
                                    stroke.ApplyStrokeMode = 'Border'
                                    stroke.Color = Color3.fromRGB(255, 255, 255)
                                    stroke.LineJoinMode = 'Round'
                                    stroke.Name = '#stroke'
                                    stroke.Thickness = 1
                                    
                                    stroke.Parent = cursorInner
                                end
                                
                                local cursorOuter = Instance.new('Frame') do 
                                    cursorOuter.BackgroundTransparency = 1
                                    cursorOuter.Name = '#cursor-outer'
                                    cursorOuter.Position = UDim2.fromOffset(-1, -1)
                                    cursorOuter.Size = UDim2.fromOffset(10, 10)
                                    cursorOuter.Visible = true
                                    cursorOuter.ZIndex = 106 
                                    
                                    cursorOuter.Parent = cursorInner 
                                    
                                    local round = Instance.new('UICorner') do 
                                        round.CornerRadius = UDim.new(1, 0)
                                        round.Name = '#round'
                                        
                                        round.Parent = cursorOuter
                                    end
                                    
                                    local stroke = Instance.new('UIStroke') do 
                                        stroke.ApplyStrokeMode = 'Border'
                                        stroke.Color = Color3.fromRGB(0, 0, 5)
                                        stroke.LineJoinMode = 'Round'
                                        stroke.Name = '#stroke'
                                        stroke.Thickness = 1
                                        
                                        stroke.Parent = cursorOuter
                                    end
                                end
                            end
                            
                            local outline = Instance.new('Frame') do 
                                outline.BackgroundColor3 = theme.Stroke
                                outline.BorderSizePixel = 0
                                outline.Name = '#outline'
                                outline.Position = UDim2.fromOffset(1,1)
                                outline.Size = UDim2.new(1, -2, 1, -2)
                                outline.SizeConstraint = 'RelativeYY'
                                outline.Visible = true
                                outline.ZIndex = 103
                                
                                outline.Parent = picker
                                
                                local round = Instance.new('UICorner') do 
                                    round.CornerRadius = UDim.new(1, 0)
                                    round.Name = '#round'
                                    
                                    round.Parent = outline
                                end
                                
                                local stroke = Instance.new('UIStroke') do 
                                    stroke.ApplyStrokeMode = 'Border'
                                    stroke.Color = theme.Stroke
                                    stroke.LineJoinMode = 'Round'
                                    stroke.Name = '#stroke'
                                    stroke.Thickness = 2 
                                    
                                    stroke.Parent = outline
                                end
                            end
                        end
                        
                        local valueSlider = Instance.new('Frame') do 
                            valueSlider.AnchorPoint = Vector2.new(0.5, 1)
                            valueSlider.BackgroundTransparency = 1
                            valueSlider.Name = '#value-slider'
                            valueSlider.Position = UDim2.fromScale(0.5, 1)
                            valueSlider.Size = UDim2.new(0.8, 0, 0, 24)
                            valueSlider.ZIndex = 103
                            valueSlider.Visible = true
                            
                            valueSlider.Parent = pickerRegion
                            
                            local sliderContainer = Instance.new('Frame') do 
                                sliderContainer.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                                sliderContainer.Position = UDim2.fromOffset(3, 6)
                                sliderContainer.Size = UDim2.new(1, -6, 0, 12)
                                sliderContainer.Visible = true
                                sliderContainer.ZIndex = 103
                                sliderContainer.Name = '#slider-container'
                                
                                sliderContainer.Parent = valueSlider
                                
                                local round = Instance.new('UICorner') do 
                                    round.CornerRadius = UDim.new(0, rounding and 2 or 0)
                                    round.Name = '#round'
                                    
                                    round.Parent = sliderContainer
                                end
                                
                                local stroke = Instance.new('UIStroke') do 
                                    stroke.ApplyStrokeMode = 'Border'
                                    stroke.Color = theme.Stroke
                                    stroke.LineJoinMode = 'Round'
                                    stroke.Name = '#stroke'
                                    stroke.Thickness = 1 
                                    
                                    stroke.Parent = sliderContainer
                                end
                                
                                local valueGradient = Instance.new('Frame') do 
                                    valueGradient.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                                    valueGradient.BackgroundTransparency = 0
                                    valueGradient.Name = '#value-gradient'
                                    valueGradient.Size = UDim2.fromScale(1, 1)
                                    valueGradient.Visible = true
                                    valueGradient.ZIndex = 104 
                                    
                                    valueGradient.Parent = sliderContainer
                                    
                                    local gradient = Instance.new('UIGradient') do 
                                        gradient.Color = ColorSequence.new(
                                            Color3.fromRGB(0, 0, 0)
                                        )
                                        gradient.Enabled = true
                                        gradient.Name = '#gradient'
                                        gradient.Rotation = 180
                                        gradient.Transparency = NumberSequence.new({
                                            NumberSequenceKeypoint.new(0, 1), 
                                            NumberSequenceKeypoint.new(1, 0)
                                        })
                                        
                                        gradient.Parent = valueGradient
                                    end
                                    
                                    local round = Instance.new('UICorner') do 
                                        round.CornerRadius = UDim.new(0, rounding and 2 or 0)
                                        round.Name = '#round'
                                        
                                        round.Parent = valueGradient
                                    end
                                    
                                    local stroke = Instance.new('UIStroke') do 
                                        stroke.ApplyStrokeMode = 'Border'
                                        stroke.Color = theme.Stroke
                                        stroke.LineJoinMode = 'Round'
                                        stroke.Name = '#stroke'
                                        stroke.Thickness = 1 
                                        
                                        stroke.Parent = valueGradient
                                    end
                                end
                                
                                local cursorInner = Instance.new('Frame') do 
                                    cursorInner.AnchorPoint = Vector2.new(0.5, 0)
                                    cursorInner.BackgroundTransparency = 1
                                    cursorInner.Name = '#cursor-inner'
                                    cursorInner.Position = UDim2.fromScale(1, 0)
                                    cursorInner.Size = UDim2.fromOffset(4, 12)
                                    cursorInner.Visible = true
                                    cursorInner.ZIndex = 104 
                                    
                                    cursorInner.Parent = sliderContainer 
                                    
                                    local round = Instance.new('UICorner') do 
                                        round.CornerRadius = UDim.new(0, rounding and 2 or 0)
                                        round.Name = '#round'
                                        
                                        round.Parent = cursorInner
                                    end
                                    
                                    local stroke = Instance.new('UIStroke') do 
                                        stroke.ApplyStrokeMode = 'Border'
                                        stroke.Color = Color3.fromRGB(255, 255, 255)
                                        stroke.LineJoinMode = 'Round'
                                        stroke.Name = '#stroke'
                                        stroke.Thickness = 1
                                        
                                        stroke.Parent = cursorInner
                                    end
                                    
                                    local cursorOuter = Instance.new('Frame') do 
                                        cursorOuter.AnchorPoint = Vector2.new(0.5, 0.5)
                                        cursorOuter.BackgroundTransparency = 1
                                        cursorOuter.Name = '#cursor-outer'
                                        cursorOuter.Position = UDim2.fromScale(0.5, 0.5)
                                        cursorOuter.Size = UDim2.new(1, 2, 1, 2)
                                        cursorOuter.Visible = true
                                        cursorOuter.ZIndex = 104 
                                        
                                        cursorOuter.Parent = cursorInner 
                                        
                                        local round = Instance.new('UICorner') do 
                                            round.CornerRadius = UDim.new(0, rounding and 2 or 0)
                                            round.Name = '#round'
                                            
                                            round.Parent = cursorOuter
                                        end
                                        
                                        local stroke = Instance.new('UIStroke') do 
                                            stroke.ApplyStrokeMode = 'Border'
                                            stroke.Color = Color3.fromRGB(0, 0, 5)
                                            stroke.LineJoinMode = 'Round'
                                            stroke.Name = '#stroke'
                                            stroke.Thickness = 1
                                            
                                            stroke.Parent = cursorOuter
                                        end
                                    end
                                end
                            end
                        end
                        
                        local speedSlider = Instance.new('Frame') do 
                            speedSlider.AnchorPoint = Vector2.new(0, 1)
                            speedSlider.BackgroundTransparency = 1
                            speedSlider.Name = '#speed-slider'
                            speedSlider.Position = UDim2.new(0, -40, 1, -24)
                            speedSlider.Size = UDim2.new(0, 24, 1, -26)
                            speedSlider.ZIndex = 103
                            speedSlider.Visible = true
                            
                            speedSlider.Parent = pickerRegion
                            
                            local sliderContainer = Instance.new('Frame') do 
                                sliderContainer.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                                sliderContainer.Position = UDim2.fromOffset(6, 3)
                                sliderContainer.Size = UDim2.new(0, 12, 1, -6)
                                sliderContainer.Visible = true
                                sliderContainer.ZIndex = 103
                                sliderContainer.Name = '#slider-container'
                                
                                sliderContainer.Parent = speedSlider
                                
                                local round = Instance.new('UICorner') do 
                                    round.CornerRadius = UDim.new(0, rounding and 2 or 0)
                                    round.Name = '#round'
                                    
                                    round.Parent = sliderContainer
                                end
                                
                                local stroke = Instance.new('UIStroke') do 
                                    stroke.ApplyStrokeMode = 'Border'
                                    stroke.Color = theme.Stroke
                                    stroke.LineJoinMode = 'Round'
                                    stroke.Name = '#stroke'
                                    stroke.Thickness = 1 
                                    
                                    stroke.Parent = sliderContainer
                                end
                                
                                local speedGradient = Instance.new('Frame') do 
                                    speedGradient.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                                    speedGradient.BackgroundTransparency = 0
                                    speedGradient.Name = '#speed-gradient'
                                    speedGradient.Size = UDim2.fromScale(1, 1)
                                    speedGradient.Visible = true
                                    speedGradient.ZIndex = 104 
                                    
                                    speedGradient.Parent = sliderContainer
                                    
                                    local gradient = Instance.new('UIGradient') do 
                                        gradient.Color = ColorSequence.new(
                                            Color3.fromRGB(0, 0, 0)
                                        )
                                        gradient.Enabled = true
                                        gradient.Name = '#gradient'
                                        gradient.Rotation = 90
                                        gradient.Transparency = NumberSequence.new({
                                            NumberSequenceKeypoint.new(0, 1), 
                                            NumberSequenceKeypoint.new(1, 0)
                                        })
                                        
                                        gradient.Parent = speedGradient
                                    end
                                    
                                    local round = Instance.new('UICorner') do 
                                        round.CornerRadius = UDim.new(0, rounding and 2 or 0)
                                        round.Name = '#round'
                                        
                                        round.Parent = speedGradient
                                    end
                                
                                    local stroke = Instance.new('UIStroke') do 
                                        stroke.ApplyStrokeMode = 'Border'
                                        stroke.Color = theme.Stroke
                                        stroke.LineJoinMode = 'Round'
                                        stroke.Name = '#stroke'
                                        stroke.Thickness = 1 
                                        
                                        stroke.Parent = speedGradient
                                    end
                                end
                                
                                local cursorInner = Instance.new('Frame') do 
                                    cursorInner.AnchorPoint = Vector2.new(0, 0.5)
                                    cursorInner.BackgroundTransparency = 1
                                    cursorInner.Name = '#cursor-inner'
                                    cursorInner.Position = UDim2.fromScale(0, 0)
                                    cursorInner.Size = UDim2.fromOffset(12, 4)
                                    cursorInner.Visible = true
                                    cursorInner.ZIndex = 104 
                                    
                                    cursorInner.Parent = sliderContainer 
                                    
                                    local round = Instance.new('UICorner') do 
                                        round.CornerRadius = UDim.new(0, rounding and 2 or 0)
                                        round.Name = '#round'
                                        
                                        round.Parent = cursorInner
                                    end
                                    
                                    local stroke = Instance.new('UIStroke') do 
                                        stroke.ApplyStrokeMode = 'Border'
                                        stroke.Color = Color3.fromRGB(255, 255, 255)
                                        stroke.LineJoinMode = 'Round'
                                        stroke.Name = '#stroke'
                                        stroke.Thickness = 1
                                        
                                        stroke.Parent = cursorInner
                                    end
                                    
                                    local cursorOuter = Instance.new('Frame') do 
                                        cursorOuter.AnchorPoint = Vector2.new(0.5, 0.5)
                                        cursorOuter.BackgroundTransparency = 1
                                        cursorOuter.Name = '#cursor-outer'
                                        cursorOuter.Position = UDim2.fromScale(0.5, 0.5)
                                        cursorOuter.Size = UDim2.new(1, 2, 1, 2)
                                        cursorOuter.Visible = true
                                        cursorOuter.ZIndex = 104 
                                        
                                        cursorOuter.Parent = cursorInner 
                                        
                                        local round = Instance.new('UICorner') do 
                                            round.CornerRadius = UDim.new(0, rounding and 2 or 0)
                                            round.Name = '#round'
                                            
                                            round.Parent = cursorOuter
                                        end
                                        
                                        local stroke = Instance.new('UIStroke') do 
                                            stroke.ApplyStrokeMode = 'Border'
                                            stroke.Color = Color3.fromRGB(0, 0, 5)
                                            stroke.LineJoinMode = 'Round'
                                            stroke.Name = '#stroke'
                                            stroke.Thickness = 1
                                            
                                            stroke.Parent = cursorOuter
                                        end
                                    end
                                end
                            end
                        end
                        
                        
                        local chroma = Instance.new('TextButton') do 
                            chroma.Active = true
                            chroma.AnchorPoint = Vector2.new(0, 1)
                            chroma.AutoButtonColor = false
                            chroma.BackgroundColor3 = theme.Button1
                            chroma.Name = '#chroma'
                            chroma.Position = UDim2.new(0, 8, 1, -4)
                            chroma.Size = UDim2.fromOffset(16, 16)
                            chroma.Text = ''
                            chroma.Visible = true
                            chroma.ZIndex = 103
                            
                            chroma.Parent = pickerRegion
                            
                            local round = Instance.new('UICorner') do 
                                round.CornerRadius = UDim.new(0, rounding and 2 or 0)
                                round.Name = '#round'
                                
                                round.Parent = chroma
                            end
                        
                            local stroke = Instance.new('UIStroke') do 
                                stroke.ApplyStrokeMode = 'Border'
                                stroke.Color = theme.Stroke
                                stroke.LineJoinMode = 'Round'
                                stroke.Name = '#stroke'
                                stroke.Thickness = 1 
                                
                                stroke.Parent = chroma
                            end
                            
                            local icon = Instance.new('ImageLabel') do 
                                icon.Active = false
                                icon.BackgroundTransparency = 1
                                icon.BorderSizePixel = 0
                                icon.Image = 'rbxassetid://9841673199'--'rbxassetid://9840988620'
                                icon.ImageColor3 = Color3.fromRGB(255, 255, 255)
                                icon.Name = '#icon'
                                icon.Position = UDim2.fromOffset(0, 0)
                                icon.Rotation = 0
                                icon.Size = UDim2.fromScale(1, 1)
                                icon.Visible = true
                                icon.ZIndex = 103 
                                
                                icon.Parent = chroma
                            end
                        end
                    end
                    
                    local inputRegion = Instance.new('Frame') do 
                        inputRegion.BackgroundColor3 = theme.Window2
                        inputRegion.BackgroundTransparency = 0
                        inputRegion.BorderColor3 = theme.Inset2
                        inputRegion.BorderMode = 'Inset'
                        inputRegion.BorderSizePixel = 1 
                        inputRegion.ClipsDescendants = true
                        inputRegion.Name = '#region-input'
                        inputRegion.Position = UDim2.new(0, 2, 0.75, 2)
                        inputRegion.Size = UDim2.new(1, -4, 0.25, -4)
                        inputRegion.Visible = true 
                        inputRegion.ZIndex = 102
                        
                        inputRegion.Parent = region 
                        
                        local stroke = Instance.new('UIStroke') do 
                            stroke.ApplyStrokeMode = 'Border'
                            stroke.Color = theme.Stroke
                            stroke.LineJoinMode = 'Round'
                            stroke.Name = '#stroke'
                            stroke.Thickness = 1 
                            
                            stroke.Parent = inputRegion
                        end
                        
                        
                        local redSlider = Instance.new('Frame') do 
                            redSlider.BackgroundTransparency = 1
                            redSlider.Name = '#red-slider'
                            redSlider.Position = UDim2.fromOffset(0, -1)
                            redSlider.Size = UDim2.new(1, 0, 0, 24)
                            redSlider.ZIndex = 103
                            redSlider.Visible = true
                            
                            redSlider.Parent = inputRegion
                            
                            local sliderContainer = Instance.new('Frame') do 
                                sliderContainer.BackgroundColor3 = theme.Button1
                                sliderContainer.Position = UDim2.fromOffset(3, 6)
                                sliderContainer.Size = UDim2.new(1, -6, 0, 12)
                                sliderContainer.Visible = true
                                sliderContainer.ZIndex = 103
                                sliderContainer.Name = '#slider-container'
                                
                                sliderContainer.Parent = redSlider
                                
                                local round = Instance.new('UICorner') do 
                                    round.CornerRadius = UDim.new(0, rounding and 2 or 0)
                                    round.Name = '#round'
                                    
                                    round.Parent = sliderContainer
                                end
                                
                                local stroke = Instance.new('UIStroke') do 
                                    stroke.ApplyStrokeMode = 'Border'
                                    stroke.Color = theme.Stroke
                                    stroke.LineJoinMode = 'Round'
                                    stroke.Name = '#stroke'
                                    stroke.Thickness = 1 
                                    
                                    stroke.Parent = sliderContainer
                                end
                                local sliderFill = Instance.new('Frame') do 
                                    sliderFill.Active = false
                                    sliderFill.BackgroundColor3 = theme.Primary
                                    sliderFill.BackgroundTransparency = 0.6
                                    sliderFill.BorderSizePixel = 0
                                    sliderFill.Name = '#slider-fill'
                                    sliderFill.Size = UDim2.fromScale(1, 1)
                                    sliderFill.Visible = true
                                    sliderFill.ZIndex = 104
                                    
                                    sliderFill.Parent = sliderContainer
                                    
                                    local round = Instance.new('UICorner') do 
                                        round.CornerRadius = UDim.new(0, rounding and 2 or 0)
                                        round.Name = '#round'
                                        
                                        round.Parent = sliderFill
                                    end
                                    
                                    local gradient = Instance.new('UIGradient') do 
                                        gradient.Color = ColorSequence.new(
                                            theme.ControlGradient1,
                                            theme.ControlGradient2
                                        )
                                        gradient.Rotation = 90
                                        gradient.Enabled = true
                                        gradient.Name = '#gradient'
                                        
                                        gradient.Parent = sliderFill
                                    end
                                end
                                
                                local inputBox = Instance.new('TextBox') do 
                                    inputBox.Active = true 
                                    inputBox.BackgroundColor3 = theme.Window1
                                    inputBox.BackgroundTransparency = 0.1
                                    inputBox.ClearTextOnFocus = true
                                    inputBox.ClipsDescendants = true
                                    inputBox.Font = 'SourceSans'
                                    inputBox.Name = '#input-box'
                                    inputBox.PlaceholderColor3 = theme.TextDim
                                    inputBox.PlaceholderText = 'enter value'
                                    inputBox.Size = UDim2.fromScale(1, 1)
                                    inputBox.Text = 'enter value'
                                    inputBox.TextColor3 = theme.TextPrimary
                                    inputBox.TextSize = 14
                                    inputBox.TextStrokeColor3 = theme.TextStroke
                                    inputBox.TextStrokeTransparency = 0.8
                                    inputBox.TextWrapped = true
                                    inputBox.TextXAlignment = 'Center'
                                    inputBox.TextYAlignment = 'Center'
                                    inputBox.Visible = false
                                    inputBox.ZIndex = 105
                                    
                                    inputBox.Parent = sliderContainer
                                    
                                    local round = Instance.new('UICorner') do 
                                        round.CornerRadius = UDim.new(0, rounding and 2 or 0)
                                        round.Name = '#round'
                                        
                                        round.Parent = inputBox
                                    end
                                
                                    local stroke = Instance.new('UIStroke') do 
                                        stroke.ApplyStrokeMode = 'Border'
                                        stroke.Color = theme.Stroke
                                        stroke.LineJoinMode = 'Round'
                                        stroke.Name = '#stroke'
                                        stroke.Thickness = 1 
                                        
                                        stroke.Parent = inputBox
                                    end
                                    
                                    local padding = Instance.new('UIPadding') do 
                                        padding.PaddingLeft = UDim.new(0, 4)
                                        padding.Name = '#padding'
                                        
                                        padding.Parent = inputBox
                                    end
                                end
                            end
                            
                            local title = Instance.new('TextLabel') do 
                                title.BackgroundTransparency = 1
                                title.Font = 'SourceSans'
                                title.Name = '#title'
                                title.Size = UDim2.new(1, 0, 1, -1)
                                title.Text = 'red'
                                title.TextColor3 = theme.TextPrimary
                                title.TextSize = 14
                                title.TextStrokeColor3 = theme.TextStroke
                                title.TextStrokeTransparency = 0.8
                                title.TextTransparency = 0
                                title.TextWrapped = false
                                title.TextXAlignment = 'Left'
                                title.TextYAlignment = 'Center'
                                title.Visible = true
                                title.ZIndex = 104
                                
                                title.Parent = redSlider
                                
                                local padding = Instance.new('UIPadding') do 
                                    padding.PaddingLeft = UDim.new(0, 6)
                                    
                                    padding.Parent = title
                                end
                            end
                            
                            local val = Instance.new('TextLabel') do 
                                val.BackgroundTransparency = 1
                                val.Font = 'SourceSans'
                                val.Name = '#val'
                                val.Size = UDim2.new(1, 0, 1, -1)
                                val.Text = '255'
                                val.TextColor3 = theme.TextPrimary
                                val.TextSize = 14
                                val.TextStrokeColor3 = theme.TextStroke
                                val.TextStrokeTransparency = 0.8
                                val.TextTransparency = 0
                                val.TextWrapped = false
                                val.TextXAlignment = 'Right'
                                val.TextYAlignment = 'Center'
                                val.Visible = true
                                val.ZIndex = 104
                                
                                val.Parent = redSlider
                                
                                local padding = Instance.new('UIPadding') do 
                                    padding.PaddingRight = UDim.new(0, 6)
                                    
                                    padding.Parent = val
                                end
                            end
                        end

                        local greenSlider = Instance.new('Frame') do 
                            greenSlider.BackgroundTransparency = 1
                            greenSlider.Name = '#green-slider'
                            greenSlider.Position = UDim2.fromOffset(0, 19)
                            greenSlider.Size = UDim2.new(1, 0, 0, 24)
                            greenSlider.ZIndex = 103
                            greenSlider.Visible = true
                            
                            greenSlider.Parent = inputRegion
                            
                            local sliderContainer = Instance.new('Frame') do 
                                sliderContainer.BackgroundColor3 = theme.Button1
                                sliderContainer.Position = UDim2.fromOffset(3, 6)
                                sliderContainer.Size = UDim2.new(1, -6, 0, 12)
                                sliderContainer.Visible = true
                                sliderContainer.ZIndex = 103
                                sliderContainer.Name = '#slider-container'
                                
                                sliderContainer.Parent = greenSlider
                                
                                local round = Instance.new('UICorner') do 
                                    round.CornerRadius = UDim.new(0, rounding and 2 or 0)
                                    round.Name = '#round'
                                    
                                    round.Parent = sliderContainer
                                end
                            
                                local stroke = Instance.new('UIStroke') do 
                                    stroke.ApplyStrokeMode = 'Border'
                                    stroke.Color = theme.Stroke
                                    stroke.LineJoinMode = 'Round'
                                    stroke.Name = '#stroke'
                                    stroke.Thickness = 1 
                                    
                                    stroke.Parent = sliderContainer
                                end
                                
                                local sliderFill = Instance.new('Frame') do 
                                    sliderFill.Active = false
                                    sliderFill.BackgroundColor3 = theme.Primary
                                    sliderFill.BackgroundTransparency = 0.6
                                    sliderFill.BorderSizePixel = 0
                                    sliderFill.Name = '#slider-fill'
                                    sliderFill.Size = UDim2.fromScale(1, 1)
                                    sliderFill.Visible = true
                                    sliderFill.ZIndex = 104
                                    
                                    sliderFill.Parent = sliderContainer
                                    
                                    local round = Instance.new('UICorner') do 
                                        round.CornerRadius = UDim.new(0, rounding and 2 or 0)
                                        round.Name = '#round'
                                        
                                        round.Parent = sliderFill
                                    end
                                    
                                    local gradient = Instance.new('UIGradient') do 
                                        gradient.Color = ColorSequence.new(
                                            theme.ControlGradient1,
                                            theme.ControlGradient2
                                        )
                                        gradient.Rotation = 90
                                        gradient.Enabled = true
                                        gradient.Name = '#gradient'
                                        
                                        gradient.Parent = sliderFill
                                    end
                                end
                                

                                local inputBox = Instance.new('TextBox') do 
                                    inputBox.Active = true 
                                    inputBox.BackgroundColor3 = theme.Window1
                                    inputBox.BackgroundTransparency = 0.1
                                    inputBox.ClearTextOnFocus = true
                                    inputBox.ClipsDescendants = true
                                    inputBox.Font = 'SourceSans'
                                    inputBox.Name = '#input-box'
                                    inputBox.PlaceholderColor3 = theme.TextDim
                                    inputBox.PlaceholderText = 'enter value'
                                    inputBox.Size = UDim2.fromScale(1, 1)
                                    inputBox.Text = 'enter value'
                                    inputBox.TextColor3 = theme.TextPrimary
                                    inputBox.TextSize = 14
                                    inputBox.TextStrokeColor3 = theme.TextStroke
                                    inputBox.TextStrokeTransparency = 0.8
                                    inputBox.TextWrapped = true
                                    inputBox.TextXAlignment = 'Center'
                                    inputBox.TextYAlignment = 'Center'
                                    inputBox.Visible = false
                                    inputBox.ZIndex = 105
                                    
                                    inputBox.Parent = sliderContainer
                                    
                                    local round = Instance.new('UICorner') do 
                                        round.CornerRadius = UDim.new(0, rounding and 2 or 0)
                                        round.Name = '#round'
                                        
                                        round.Parent = inputBox
                                    end
                                    
                                    local stroke = Instance.new('UIStroke') do 
                                        stroke.ApplyStrokeMode = 'Border'
                                        stroke.Color = theme.Stroke
                                        stroke.LineJoinMode = 'Round'
                                        stroke.Name = '#stroke'
                                        stroke.Thickness = 1 
                                        
                                        stroke.Parent = inputBox
                                    end
                                end
                            end
                            
                            local title = Instance.new('TextLabel') do 
                                title.BackgroundTransparency = 1
                                title.Font = 'SourceSans'
                                title.Name = '#title'
                                title.Size = UDim2.new(1, 0, 1, -1)
                                title.Text = 'green'
                                title.TextColor3 = theme.TextPrimary
                                title.TextSize = 14
                                title.TextStrokeColor3 = theme.TextStroke
                                title.TextStrokeTransparency = 0.8
                                title.TextTransparency = 0
                                title.TextWrapped = false
                                title.TextXAlignment = 'Left'
                                title.TextYAlignment = 'Center'
                                title.Visible = true
                                title.ZIndex = 104
                                
                                title.Parent = greenSlider
                                
                                local padding = Instance.new('UIPadding') do 
                                    padding.PaddingLeft = UDim.new(0, 6)
                                    
                                    padding.Parent = title
                                end
                            end
                            
                            local val = Instance.new('TextLabel') do 
                                val.BackgroundTransparency = 1
                                val.Font = 'SourceSans'
                                val.Name = '#val'
                                val.Size = UDim2.new(1, 0, 1, -1)
                                val.Text = '255'
                                val.TextColor3 = theme.TextPrimary
                                val.TextSize = 14
                                val.TextStrokeColor3 = theme.TextStroke
                                val.TextStrokeTransparency = 0.8
                                val.TextTransparency = 0
                                val.TextWrapped = false
                                val.TextXAlignment = 'Right'
                                val.TextYAlignment = 'Center'
                                val.Visible = true
                                val.ZIndex = 104
                                
                                val.Parent = greenSlider
                                
                                local padding = Instance.new('UIPadding') do 
                                    padding.PaddingRight = UDim.new(0, 6)
                                    
                                    padding.Parent = val
                                end
                            end
                        end
                        
                        local blueSlider = Instance.new('Frame') do 
                            blueSlider.BackgroundTransparency = 1
                            blueSlider.Name = '#blue-slider'
                            blueSlider.Position = UDim2.fromOffset(0, 39)
                            blueSlider.Size = UDim2.new(1, 0, 0, 24)
                            blueSlider.ZIndex = 103
                            blueSlider.Visible = true
                            
                            blueSlider.Parent = inputRegion
                            
                            local sliderContainer = Instance.new('Frame') do 
                                sliderContainer.BackgroundColor3 = theme.Button1
                                sliderContainer.Position = UDim2.fromOffset(3, 6)
                                sliderContainer.Size = UDim2.new(1, -6, 0, 12)
                                sliderContainer.Visible = true
                                sliderContainer.ZIndex = 103
                                sliderContainer.Name = '#slider-container'
                                
                                sliderContainer.Parent = blueSlider
                                
                                local round = Instance.new('UICorner') do 
                                    round.CornerRadius = UDim.new(0, rounding and 2 or 0)
                                    round.Name = '#round'
                                    
                                    round.Parent = sliderContainer
                                end
                            
                                local stroke = Instance.new('UIStroke') do 
                                    stroke.ApplyStrokeMode = 'Border'
                                    stroke.Color = theme.Stroke
                                    stroke.LineJoinMode = 'Round'
                                    stroke.Name = '#stroke'
                                    stroke.Thickness = 1 
                                    
                                    stroke.Parent = sliderContainer
                                end
                                
                                local sliderFill = Instance.new('Frame') do 
                                    sliderFill.Active = false
                                    sliderFill.BackgroundColor3 = theme.Primary
                                    sliderFill.BackgroundTransparency = 0.6
                                    sliderFill.BorderSizePixel = 0
                                    sliderFill.Name = '#slider-fill'
                                    sliderFill.Size = UDim2.fromScale(1, 1)
                                    sliderFill.Visible = true
                                    sliderFill.ZIndex = 104
                                    
                                    sliderFill.Parent = sliderContainer
                                    
                                    local round = Instance.new('UICorner') do 
                                        round.CornerRadius = UDim.new(0, rounding and 2 or 0)
                                        round.Name = '#round'
                                        
                                        round.Parent = sliderFill
                                    end
                                    
                                    local gradient = Instance.new('UIGradient') do 
                                        gradient.Color = ColorSequence.new(
                                            theme.ControlGradient1,
                                            theme.ControlGradient2
                                        )
                                        gradient.Rotation = 90
                                        gradient.Enabled = true
                                        gradient.Name = '#gradient'
                                        
                                        gradient.Parent = sliderFill
                                    end
                                end
                                

                                local inputBox = Instance.new('TextBox') do 
                                    inputBox.Active = true 
                                    inputBox.BackgroundColor3 = theme.Window1
                                    inputBox.BackgroundTransparency = 0.1
                                    inputBox.ClearTextOnFocus = true
                                    inputBox.ClipsDescendants = true
                                    inputBox.Font = 'SourceSans'
                                    inputBox.Name = '#input-box'
                                    inputBox.PlaceholderColor3 = theme.TextDim
                                    inputBox.PlaceholderText = 'enter value'
                                    inputBox.Size = UDim2.fromScale(1, 1)
                                    inputBox.Text = 'enter value'
                                    inputBox.TextColor3 = theme.TextPrimary
                                    inputBox.TextSize = 14
                                    inputBox.TextStrokeColor3 = theme.TextStroke
                                    inputBox.TextStrokeTransparency = 0.8
                                    inputBox.TextWrapped = true
                                    inputBox.TextXAlignment = 'Center'
                                    inputBox.TextYAlignment = 'Center'
                                    inputBox.Visible = false
                                    inputBox.ZIndex = 105
                                    
                                    inputBox.Parent = sliderContainer
                                    
                                    local round = Instance.new('UICorner') do 
                                        round.CornerRadius = UDim.new(0, rounding and 2 or 0)
                                        round.Name = '#round'
                                        
                                        round.Parent = inputBox
                                    end
                                    
                                    local stroke = Instance.new('UIStroke') do 
                                        stroke.ApplyStrokeMode = 'Border'
                                        stroke.Color = theme.Stroke
                                        stroke.LineJoinMode = 'Round'
                                        stroke.Name = '#stroke'
                                        stroke.Thickness = 1 
                                        
                                        stroke.Parent = inputBox
                                    end
                                end
                            end
                            
                            local title = Instance.new('TextLabel') do 
                                title.BackgroundTransparency = 1
                                title.Font = 'SourceSans'
                                title.Name = '#title'
                                title.Size = UDim2.new(1, 0, 1, -1)
                                title.Text = 'blue'
                                title.TextColor3 = theme.TextPrimary
                                title.TextSize = 14
                                title.TextStrokeColor3 = theme.TextStroke
                                title.TextStrokeTransparency = 0.8
                                title.TextTransparency = 0
                                title.TextWrapped = false
                                title.TextXAlignment = 'Left'
                                title.TextYAlignment = 'Center'
                                title.Visible = true
                                title.ZIndex = 104
                                
                                title.Parent = blueSlider
                                
                                local padding = Instance.new('UIPadding') do 
                                    padding.PaddingLeft = UDim.new(0, 6)
                                    
                                    padding.Parent = title
                                end
                            end
                            
                            local val = Instance.new('TextLabel') do 
                                val.BackgroundTransparency = 1
                                val.Font = 'SourceSans'
                                val.Name = '#val'
                                val.Size = UDim2.new(1, 0, 1, -1)
                                val.Text = '255'
                                val.TextColor3 = theme.TextPrimary
                                val.TextSize = 14
                                val.TextStrokeColor3 = theme.TextStroke
                                val.TextStrokeTransparency = 0.8
                                val.TextTransparency = 0
                                val.TextWrapped = false
                                val.TextXAlignment = 'Right'
                                val.TextYAlignment = 'Center'
                                val.Visible = true
                                val.ZIndex = 104
                                
                                val.Parent = blueSlider
                                
                                local padding = Instance.new('UIPadding') do 
                                    padding.PaddingRight = UDim.new(0, 6)
                                    
                                    padding.Parent = val
                                end
                            end
                        end
                    end
                end
                
                instances.main = main
            end
            pickerWindow.instances = instances 
            pickerWindow.signals = {
                buttonClose = {
                    MouseEnter = function(inst, win) 
                        tween(inst, {BackgroundColor3 = theme.Button2}, 0.2, 1)
                        tween(inst['#stroke'], {Color = theme.StrokeHover}, 0.2, 1)
                    end,
                    MouseLeave = function(inst, win) 
                        tween(inst, {BackgroundColor3 = theme.Button1}, 0.2, 1)
                        tween(inst['#stroke'], {Color = theme.Stroke}, 0.2, 1)
                    end,
                    MouseButton1Click = function(inst, win) 
                        win:destroy()
                    end
                },
                buttonMin = {
                    MouseEnter = function(inst, win) 
                        win.minFocused = true
                        
                        if (win.minimized) then
                            tween(inst, {BackgroundColor3 = theme.Button4}, 0.2, 1)
                        else
                            tween(inst, {BackgroundColor3 = theme.Button2}, 0.2, 1)
                        end
                        tween(inst['#stroke'], {Color = theme.StrokeHover}, 0.2, 1)
                    end,
                    MouseLeave = function(inst, win) 
                        win.minFocused = false
                        
                        if (win.minimized) then
                            tween(inst, {BackgroundColor3 = theme.Button3}, 0.2, 1)
                        else
                            tween(inst, {BackgroundColor3 = theme.Button1}, 0.2, 1)
                        end
                        tween(inst['#stroke'], {Color = theme.Stroke}, 0.2, 1)
                    end,
                    MouseButton1Click = function(_, self) 
                        self:minimize()
                    end
                },
                redSlider = {
                    MouseEnter = function(inst, win) 
                        local sliderCont = inst['#slider-container']
                        tween(sliderCont, {BackgroundColor3 = theme.Button2}, 0.2, 1)
                        tween(sliderCont['#stroke'], {Color = theme.StrokeHover}, 0.2, 1)
                    end,
                    MouseLeave = function(inst, win) 
                        local sliderCont = inst['#slider-container']
                        tween(sliderCont, {BackgroundColor3 = theme.Button1}, 0.2, 1)
                        tween(sliderCont['#stroke'], {Color = theme.Stroke}, 0.2, 1)
                    end
                },
                greenSlider = {
                    MouseEnter = function(inst, win) 
                        local sliderCont = inst['#slider-container']
                        tween(sliderCont, {BackgroundColor3 = theme.Button2}, 0.2, 1)
                        tween(sliderCont['#stroke'], {Color = theme.StrokeHover}, 0.2, 1)
                    end,
                    MouseLeave = function(inst, win) 
                        local sliderCont = inst['#slider-container']
                        tween(sliderCont, {BackgroundColor3 = theme.Button1}, 0.2, 1)
                        tween(sliderCont['#stroke'], {Color = theme.Stroke}, 0.2, 1)
                    end
                },
                blueSlider = {
                    MouseEnter = function(inst, win) 
                        local sliderCont = inst['#slider-container']
                        tween(sliderCont, {BackgroundColor3 = theme.Button2}, 0.2, 1)
                        tween(sliderCont['#stroke'], {Color = theme.StrokeHover}, 0.2, 1)
                    end,
                    MouseLeave = function(inst, win) 
                        local sliderCont = inst['#slider-container']
                        tween(sliderCont, {BackgroundColor3 = theme.Button1}, 0.2, 1)
                        tween(sliderCont['#stroke'], {Color = theme.Stroke}, 0.2, 1)
                    end
                },
                chromaButton = {
                    MouseEnter = function(inst, win) 
                        win.chromaFocused = true
                        if (win.chromaEnabled) then
                            tween(inst, {BackgroundColor3 = theme.Button4}, 0.2, 1)
                        else
                            tween(inst, {BackgroundColor3 = theme.Button2}, 0.2, 1)
                        end
                        tween(inst['#stroke'], {Color = theme.StrokeHover}, 0.2, 1)
                    end,
                    MouseLeave = function(inst, win) 
                        win.chromaFocused = false
                        
                        if (win.chromaEnabled) then
                            tween(inst, {BackgroundColor3 = theme.Button3}, 0.2, 1)
                        else
                            tween(inst, {BackgroundColor3 = theme.Button1}, 0.2, 1)
                        end
                        tween(inst['#stroke'], {Color = theme.Stroke}, 0.2, 1)
                    end,
                    MouseButton1Click = function(inst, win) 
                        win:toggleChroma()
                    end
                }
            }
            --[[
            if (self.focused) then
                button.BackgroundColor3 = theme.Button4
                tween(button, {BackgroundColor3 = theme.Button2}, 1, 1)
            else
                button.BackgroundColor3 = theme.Button3
                tween(button, {BackgroundColor3 = theme.Button1}, 1, 1)
            end]]
            
            pickerWindow.destroy = function(self) 
                self:fireEvent('close')
                
                local main = self.instances.main
                task.spawn(function()
                    local animCon
                    
                    task.spawn(function() 
                        local backgroundTransparency = {}
                        local imageTransparency = {}
                        local transparency = {}
                        local textTransparency = {}
                        
                        local s = {
                            Frame = {backgroundTransparency}, 
                            ImageButton = {backgroundTransparency, imageTransparency},
                            ImageLabel = {backgroundTransparency, imageTransparency},
                            TextButton = {backgroundTransparency, textTransparency},
                            TextLabel = {backgroundTransparency, textTransparency},
                            UIStroke = {transparency},
                        }
                        local d = main:GetDescendants()
                        table.insert(d, main)
                        
                        for i, v in ipairs(d) do 
                            local a = s[v.ClassName]
                            if (a) then
                                for i = 1, #a do 
                                    table.insert(a[i], v)
                                end
                            end
                        end
                        
                        for i,v in ipairs(transparency) do
                            v.Transparency = 1
                        end
                        
                        transparency = nil
                        scrollBarImageTransparency = nil
                        animCon = renderService.RenderStepped:Connect(function(dt) 
                            dt *= 8
                            for i= 1, #backgroundTransparency do 
                                backgroundTransparency[i].BackgroundTransparency += dt
                            end
                            for i= 1, #imageTransparency do 
                                imageTransparency[i].ImageTransparency += dt
                            end
                            for i= 1, #textTransparency do 
                                textTransparency[i].TextTransparency += dt
                            end
                        end)
                    end)
                    tween(main['#scale'], {Scale = 0.6}, 0.5, 1).Completed:Wait()--{Size = UDim2.fromOffset(mainFrame.AbsoluteSize.X, 0)}, 0.5, 1).Completed:Wait()
                    animCon:Disconnect()
                    main:Destroy()
                end)

                return self 
            end
            pickerWindow.setTitle = function(self, title) 
                self.instances.title.Text = tostring(title)
                return self 
            end
            pickerWindow.setPosition = function(self, newPosition)
                -- type coercion :money
                if (typeof(newPosition) == 'Vector2') then
                    newPosition = UDim2.fromOffset(newPosition.X, newPosition.Y)
                elseif (typeof(newPosition) ~= 'UDim2') then
                    return error('expected type UDim2 or Vector2', 2)
                end
                self.instances.main.Position = newPosition
                return self 
            end
            pickerWindow.new = function(self, resize) 
                local new = setmetatable({}, self)
                new.binds = {}
                table.insert(ui.pickerWindows, new)
                
                local instances = {}

                instances.main = self.instances.main:Clone()

                local titleBar = instances.main['#title-bar']
                instances.buttonClose = titleBar['#button-close']
                instances.buttonMin = titleBar['#button-min']
                instances.titleBar = titleBar
                instances.title = titleBar['#title']
                
                instances.pickerRegion = instances.main['#region']['#region-picker']
                instances.inputRegion = instances.main['#region']['#region-input']
                
                instances.colorPicker = instances.pickerRegion['#picker']
                instances.pickerCursor = instances.colorPicker['#cursor-inner']
                
                
                instances.valSlider = instances.pickerRegion['#value-slider']
                instances.valCursor = instances.valSlider['#slider-container']['#cursor-inner']
                
                instances.speedSlider = instances.pickerRegion['#speed-slider']
                instances.speedCursor = instances.speedSlider['#slider-container']['#cursor-inner']
                
                instances.redSlider = instances.inputRegion['#red-slider']
                instances.greenSlider = instances.inputRegion['#green-slider']
                instances.blueSlider = instances.inputRegion['#blue-slider']
                
                instances.redFill = instances.inputRegion['#red-slider']['#slider-container']['#slider-fill']
                instances.greenFill = instances.inputRegion['#green-slider']['#slider-container']['#slider-fill']
                instances.blueFill = instances.inputRegion['#blue-slider']['#slider-container']['#slider-fill']
                
                instances.chromaButton = instances.pickerRegion['#chroma']
                
                -- setup signals
                for i, signals in pairs(self.signals) do 
                    local inst = instances[i]
                    for signal, func in pairs(signals) do
                        local h = inst[signal]:Connect(function() 
                            func(inst, new)
                        end)
                    end
                end
                
                -- dragging
                do 
                    local dCon
                    local aCon
                    local mainFrame = instances.main
                    local targetPos
                    
                    titleBar.InputBegan:Connect(function(io) 
                        if (io.UserInputType.Value == 0) then
                            local rootPos = mainFrame.AbsolutePosition
                            local startPos = io.Position
                            
                            startPos = Vector2.new(startPos.X, startPos.Y)
                            
                            targetPos = UDim2.fromOffset(rootPos.X, rootPos.Y)
                            aCon = renderService.RenderStepped:Connect(function(dt) 
                                mainFrame.Position = mainFrame.Position:lerp(targetPos, 1 - animSpeed^dt)-- 1 - 1e-12^dt)
                            end)
                            
                            dCon = inputService.InputChanged:Connect(function(io) 
                                if (io.UserInputType.Value == 4) then
                                    local curPos = io.Position
                                    curPos = Vector2.new(curPos.X, curPos.Y) 
                                    
                                    local dest = rootPos + (curPos - startPos)
                                    targetPos = UDim2.fromOffset(dest.X, dest.Y)
                                end
                            end)
                            
                        end
                    end)
                    titleBar.InputEnded:Connect(function(io)
                        if (io.UserInputType.Value == 0) then
                            dCon:Disconnect()
                            aCon:Disconnect()
                            
                            tween(mainFrame, {Position = targetPos}, 0.2, 1)
                        end
                    end)
                end
                
                -- red slider
                do 
                    local slider = instances.redSlider
                    local container = slider['#slider-container']
                    local fill = container['#slider-fill'] 
                    local val = slider['#val']
                    
                    local inputbox = container['#input-box']
                    
                    local dcon
                    local acon
                    
                    inputbox.FocusLost:Connect(function(enter, io) 
                        local tx = inputbox.Text
                        local n = tonumber(tx)
                        if (n) then
                            inputbox.Visible = false

                            local fixed = math.clamp(n / 255, 0, 1)
                            local rounded = math.floor((fixed) * 255) / 255
                            
                            local newVal = rounded * 255
                            tween(fill, {Size = UDim2.fromScale(rounded, 1)}, 0.3, 1)
                            
                            val.Text = newVal
                            new.red = newVal
                            
                            new:displayRGB()
                        elseif (tx == '') then
                            inputbox.Visible = false
                        else
                            inputbox.Text = 'not a valid number'
                            wait(1)
                            inputbox:CaptureFocus()
                        end
                    end)
                    
                    
                    local targetSize
                    container.InputBegan:Connect(function(io) 
                        local inputName = io.UserInputType.Name
                        if (inputName == 'MouseButton1') then
                            local containerPos = container.AbsolutePosition
                            local containerWidth = container.AbsoluteSize.X
                            local startInput do 
                                local position = io.Position
                                startInput = Vector2.new(position.X, position.Y)
                            end
                            
                            local rawValue = math.clamp((startInput - containerPos).X / containerWidth, 0, 1)
                            local roundedValue = math.floor((rawValue) * 255) / 255
                            local newValue = roundedValue * 255 
                            targetSize = UDim2.fromScale(roundedValue, 1)
                            
                            val.Text = newValue
                            new.red = newValue
                            
                            new:displayRGB()
                            
                            acon = renderService.RenderStepped:Connect(function(dt) 
                                fill.Size = fill.Size:lerp(targetSize, 1 - 1e-12^dt)
                            end)
                            
                            --fill.Size = UDim2.fromScale(rawValue, 1)
                            dcon = inputService.InputChanged:Connect(function(io) 
                                if (io.UserInputType.Name == 'MouseMovement') then
                                    local curInput do 
                                        local position = io.Position
                                        curInput = Vector2.new(position.X, position.Y)
                                    end
                                    
                                    local rawValue = math.clamp((curInput - containerPos).X / containerWidth, 0, 1)
                                    local roundedValue = math.floor((rawValue) * 255) / 255
                                    local newValue = roundedValue * 255 
                                    targetSize = UDim2.fromScale(roundedValue, 1)
                                    
                                    val.Text = newValue
                                    new.red = newValue
                                    
                                    new:displayRGB()
                                end
                            end)
                        elseif (inputName == 'MouseButton2') then
                            inputbox.Visible = true
                            inputbox:CaptureFocus()
                        end
                    end)
                    
                    container.InputEnded:Connect(function(io) 
                        if (io.UserInputType.Name == 'MouseButton1') then
                            dcon:Disconnect()
                            acon:Disconnect()
                            
                            tween(fill, {Size = targetSize}, 0.2, 1)
                        end
                    end)
                end
                
                -- green slider
                do 
                    local slider = instances.greenSlider
                    local container = slider['#slider-container']
                    local fill = container['#slider-fill'] 
                    local val = slider['#val']
                    
                    local inputbox = container['#input-box']
                    
                    local dcon
                    local acon
                    
                    inputbox.FocusLost:Connect(function(enter, io) 
                        local tx = inputbox.Text
                        local n = tonumber(tx)
                        if (n) then
                            inputbox.Visible = false

                            local fixed = math.clamp(n / 255, 0, 1)
                            local rounded = math.floor((fixed) * 255) / 255
                            
                            local newVal = rounded * 255
                            tween(fill, {Size = UDim2.fromScale(rounded, 1)}, 0.3, 1)
                            
                            val.Text = newVal
                            new.green = newVal
                            
                            new:displayRGB()
                        elseif (tx == '') then
                            inputbox.Visible = false
                        else
                            inputbox.Text = 'not a valid number'
                            wait(1)
                            inputbox:CaptureFocus()
                        end
                    end)
                    
                    local targetSize
                    container.InputBegan:Connect(function(io) 
                        local inputName = io.UserInputType.Name
                        if (inputName == 'MouseButton1') then
                            local containerPos = container.AbsolutePosition
                            local containerWidth = container.AbsoluteSize.X
                            local startInput do 
                                local position = io.Position
                                startInput = Vector2.new(position.X, position.Y)
                            end
                            
                            local rawValue = math.clamp((startInput - containerPos).X / containerWidth, 0, 1)
                            local roundedValue = math.floor((rawValue) * 255) / 255
                            local newValue = roundedValue * 255 
                            targetSize = UDim2.fromScale(roundedValue, 1)
                            
                            val.Text = newValue
                            new.green = newValue
                            
                            new:displayRGB()
                            
                            acon = renderService.RenderStepped:Connect(function(dt) 
                                fill.Size = fill.Size:lerp(targetSize, 1 - 1e-12^dt)
                            end)
                            
                            --fill.Size = UDim2.fromScale(rawValue, 1)
                            dcon = inputService.InputChanged:Connect(function(io) 
                                if (io.UserInputType.Name == 'MouseMovement') then
                                    local curInput do 
                                        local position = io.Position
                                        curInput = Vector2.new(position.X, position.Y)
                                    end
                                    
                                    local rawValue = math.clamp((curInput - containerPos).X / containerWidth, 0, 1)
                                    local roundedValue = math.floor((rawValue) * 255) / 255
                                    local newValue = roundedValue * 255 
                                    targetSize = UDim2.fromScale(roundedValue, 1)
                                    
                                    val.Text = newValue
                                    new.green = newValue
                                    
                                    new:displayRGB()
                                end
                            end)
                        elseif (inputName == 'MouseButton2') then
                            inputbox.Visible = true
                            inputbox:CaptureFocus()
                        end
                    end)
                    
                    container.InputEnded:Connect(function(io) 
                        if (io.UserInputType.Name == 'MouseButton1') then
                            dcon:Disconnect()
                            acon:Disconnect()
                            
                            tween(fill, {Size = targetSize}, 0.2, 1)
                        end
                    end)
                end
                
                -- blue slider
                do 
                    local slider = instances.blueSlider
                    local container = slider['#slider-container']
                    local fill = container['#slider-fill'] 
                    local val = slider['#val']
                    
                    local inputbox = container['#input-box']
                    
                    local dcon
                    local acon
                    
                    inputbox.FocusLost:Connect(function(enter, io) 
                        local tx = inputbox.Text
                        local n = tonumber(tx)
                        if (n) then
                            inputbox.Visible = false

                            local fixed = math.clamp(n / 255, 0, 1)
                            local rounded = math.floor((fixed) * 255) / 255
                            
                            local newVal = rounded * 255
                            tween(fill, {Size = UDim2.fromScale(rounded, 1)}, 0.3, 1)
                            
                            val.Text = newVal
                            new.blue = newVal
                            
                            new:displayRGB()
                        elseif (tx == '') then
                            inputbox.Visible = false
                        else
                            inputbox.Text = 'not a valid number'
                            wait(1)
                            inputbox:CaptureFocus()
                        end
                    end)
                    
                    local targetSize
                    container.InputBegan:Connect(function(io) 
                        local inputName = io.UserInputType.Name
                        if (inputName == 'MouseButton1') then
                            local containerPos = container.AbsolutePosition
                            local containerWidth = container.AbsoluteSize.X
                            local startInput do 
                                local position = io.Position
                                startInput = Vector2.new(position.X, position.Y)
                            end
                            
                            local rawValue = math.clamp((startInput - containerPos).X / containerWidth, 0, 1)
                            local roundedValue = math.floor((rawValue) * 255) / 255
                            local newValue = roundedValue * 255 
                            targetSize = UDim2.fromScale(roundedValue, 1)
                            
                            val.Text = newValue
                            new.blue = newValue
                            
                            new:displayRGB()
                            
                            acon = renderService.RenderStepped:Connect(function(dt) 
                                fill.Size = fill.Size:lerp(targetSize, 1 - 1e-12^dt)
                            end)
                            
                            --fill.Size = UDim2.fromScale(rawValue, 1)
                            dcon = inputService.InputChanged:Connect(function(io) 
                                if (io.UserInputType.Name == 'MouseMovement') then
                                    local curInput do 
                                        local position = io.Position
                                        curInput = Vector2.new(position.X, position.Y)
                                    end
                                    
                                    local rawValue = math.clamp((curInput - containerPos).X / containerWidth, 0, 1)
                                    local roundedValue = math.floor((rawValue) * 255) / 255
                                    local newValue = roundedValue * 255 
                                    targetSize = UDim2.fromScale(roundedValue, 1)
                                    
                                    val.Text = newValue
                                    new.blue = newValue
                                    
                                    new:displayRGB()
                                end
                            end)
                        elseif (inputName == 'MouseButton2') then
                            inputbox.Visible = true
                            inputbox:CaptureFocus()
                        end
                    end)
                    
                    container.InputEnded:Connect(function(io) 
                        if (io.UserInputType.Name == 'MouseButton1') then
                            dcon:Disconnect()
                            acon:Disconnect()
                            
                            tween(fill, {Size = targetSize}, 0.2, 1)
                        end
                    end)
                end
                
                -- value slider
                do 
                    local slider = instances.valSlider
                    local container = slider['#slider-container']
                    local cursor = container['#cursor-inner']
                    local dcon
                    local acon
                    
                    
                    local targetPos
                    container.InputBegan:Connect(function(io) 
                        if (io.UserInputType.Name == 'MouseButton1') then
                            local containerPos = container.AbsolutePosition
                            local containerWidth = container.AbsoluteSize.X
                            local startInput do 
                                local position = io.Position
                                startInput = Vector2.new(position.X, position.Y)
                            end
                            
                            local rawValue = math.clamp((startInput - containerPos).X / containerWidth, 0, 1)
                            targetPos = UDim2.fromScale(rawValue, 0)
                            
                            new.val = rawValue
                            new:displayHSV()
                            
                            acon = renderService.RenderStepped:Connect(function(dt) 
                                cursor.Position = cursor.Position:lerp(targetPos, 1 - 1e-12^dt)
                            end)
                            
                            dcon = inputService.InputChanged:Connect(function(io) 
                                if (io.UserInputType.Name == 'MouseMovement') then
                                    local curInput do 
                                        local position = io.Position
                                        curInput = Vector2.new(position.X, position.Y)
                                    end
                                    
                                    local rawValue = math.clamp((curInput - containerPos).X / containerWidth, 0, 1)
                                    targetPos = UDim2.fromScale(rawValue, 0)

                                    new.val = rawValue
                                    new:displayHSV()
                                end
                            end)
                        end
                    end)
                    
                    container.InputEnded:Connect(function(io) 
                        if (io.UserInputType.Name == 'MouseButton1') then
                            dcon:Disconnect()
                            acon:Disconnect()
                            
                            
                            tween(cursor, {Position = targetPos}, 0.2, 1)
                        end
                    end)
                    
                    container.MouseEnter:Connect(function() 
                        tween(container['#stroke'], {Color = theme.StrokeHover}, 0.2, 1)
                        tween(container['#value-gradient']['#stroke'], {Color = theme.StrokeHover}, 0.2, 1)
                        tween(cursor['#stroke'], {Color = theme.Primary}, 0.2, 1)
                    end)
                    container.MouseLeave:Connect(function() 
                        tween(container['#stroke'], {Color = theme.Stroke}, 0.2, 1)
                        tween(container['#value-gradient']['#stroke'], {Color = theme.Stroke}, 0.2, 1)
                        tween(cursor['#stroke'], {Color = Color3.fromRGB(255, 255, 255)}, 0.2, 1)
                    end)
                end
                
                -- speed slider 
                do 
                    local slider = instances.speedSlider
                    local container = slider['#slider-container']
                    local cursor = container['#cursor-inner']
                    local dcon
                    local acon
                    
                    
                    local targetPos
                    container.InputBegan:Connect(function(io) 
                        if (io.UserInputType.Name == 'MouseButton1') then
                            local containerPos = container.AbsolutePosition
                            local containerHeight = container.AbsoluteSize.Y
                            local startInput do 
                                local position = io.Position
                                startInput = Vector2.new(position.X, position.Y)
                            end
                            
                            local rawValue = math.clamp((startInput - containerPos).Y / containerHeight, 0, 1)
                            targetPos = UDim2.fromScale(0, rawValue)
                            
                            new.linkedPicker.chromaSpeed = 1 - rawValue
                            
                            acon = renderService.RenderStepped:Connect(function(dt) 
                                cursor.Position = cursor.Position:lerp(targetPos, 1 - 1e-12^dt)
                            end)
                            
                            dcon = inputService.InputChanged:Connect(function(io) 
                                if (io.UserInputType.Name == 'MouseMovement') then
                                    local curInput do 
                                        local position = io.Position
                                        curInput = Vector2.new(position.X, position.Y)
                                    end
                                    
                                    local rawValue = math.clamp((curInput - containerPos).Y / containerHeight, 0, 1)
                                    targetPos = UDim2.fromScale(0, rawValue)

                                    new.linkedPicker.chromaSpeed = 1 - rawValue
                                end
                            end)
                        end
                    end)
                    
                    container.InputEnded:Connect(function(io) 
                        if (io.UserInputType.Name == 'MouseButton1') then
                            dcon:Disconnect()
                            acon:Disconnect()
                            
                            
                            tween(cursor, {Position = targetPos}, 0.2, 1)
                        end
                    end)
                    
                    container.MouseEnter:Connect(function() 
                        tween(container['#stroke'], {Color = theme.StrokeHover}, 0.2, 1)
                        tween(container['#speed-gradient']['#stroke'], {Color = theme.StrokeHover}, 0.2, 1)
                        tween(cursor['#stroke'], {Color = theme.Primary}, 0.2, 1)
                    end)
                    container.MouseLeave:Connect(function() 
                        tween(container['#stroke'], {Color = theme.Stroke}, 0.2, 1)
                        tween(container['#speed-gradient']['#stroke'], {Color = theme.Stroke}, 0.2, 1)
                        tween(cursor['#stroke'], {Color = Color3.fromRGB(255, 255, 255)}, 0.2, 1)
                    end)
                end
                
                -- color picker
                do 
                    local picker = instances.colorPicker
                    local cursor = instances.pickerCursor
                    
                    local center = Vector2.new(0.5, 0.5)
                    
                    local targetPos
                    
                    local oldRadius
                    local oldTheta
                    
                    picker.InputBegan:Connect(function(io) 
                        if (io.UserInputType.Name == 'MouseButton1') then
                            new.pickerMoving = true
                            local pickerPos = picker.AbsolutePosition
                            local pickerWidth = picker.AbsoluteSize.X
                            

                            local curInput do 
                                local position = io.Position
                                curInput = Vector2.new(position.X, position.Y)
                            end
                            
                            local x, y do 
                                local fixedPos = curInput - pickerPos
                                x, y = fixedPos.X / pickerWidth, fixedPos.Y / pickerWidth
                            end
                            
                            local radius, theta = cartToPolar(x-0.5, y-0.5)
                            local centerMag = (Vector2.new(x, y) - center).Magnitude
                            
                            if (centerMag > 0.5) then
                                x,y = polarToCart(radius - (centerMag - 0.5), theta)
                                x += 0.5
                                y += 0.5
                                
                                centerMag = (Vector2.new(x, y) - center).Magnitude
                            end
                            
                            targetPos = UDim2.fromScale(x, y)
                            
                            new.hue  = ((theta/math.pi + 2) / 2) % 1
                            new.sat = math.clamp(centerMag*2, 0, 1)
                            
                            new:displayHSV()
                            
                            if (acon) then acon:Disconnect() end
                            acon = renderService.RenderStepped:Connect(function(dt) 
                                cursor.Position = cursor.Position:lerp(targetPos, 1 - 1e-12^dt)
                            end)
                            
                            if (dcon) then dcon:Disconnect() end
                            dcon = inputService.InputChanged:Connect(function(io) 
                                if (io.UserInputType.Name == 'MouseMovement') then
                                    
                                    
                                    do 
                                        local curInput do 
                                            local position = io.Position
                                            curInput = Vector2.new(position.X, position.Y)
                                        end
                                        
                                        local x, y do 
                                            local fixedPos = curInput - pickerPos
                                            x, y = fixedPos.X / pickerWidth, fixedPos.Y / pickerWidth
                                        end
                                        
                                        local radius, theta = cartToPolar(x-0.5, y-0.5)
                                        local centerMag = (Vector2.new(x, y) - center).Magnitude
                                        
                                        if (centerMag > 0.5) then
                                            x,y = polarToCart(radius - (centerMag - 0.5), theta)
                                            x += 0.5
                                            y += 0.5
                                            
                                            centerMag = (Vector2.new(x, y) - center).Magnitude
                                        end
                                        
                                        targetPos = UDim2.fromScale(x, y)
                                        
                                        new.hue  = ((theta/math.pi + 2) / 2) % 1
                                        new.sat = math.clamp(centerMag*2, 0, 1)
                                        
                                        new:displayHSV()
                                    end
                                end
                            end)
                        end
                    end)
                    
                    picker.InputEnded:Connect(function(io) 
                        if (io.UserInputType.Name == 'MouseButton1') then
                            new.pickerMoving = false
                            dcon:Disconnect()
                            acon:Disconnect()
                            
                            tween(cursor, {Position = targetPos}, 0.2, 1)
                        end
                    end)
                end

                -- finalize stuff
                instances.main.Parent = uiScreen
                new.instances = instances
                return new
            end
            pickerWindow.minimize = function(self) 
                
                local newState = not self.minimized
                local mf = self.instances.main
                local bmin = mf['#title-bar']['#button-min']
                local bminIcon = bmin['#icon']
                
                
                if (newState) then
                    tween(mf, {Size = UDim2.fromOffset(300, 26)}, 0.3, 1)
                    bminIcon.Image = 'rbxassetid://9642646619'
                    
                    tween(bminIcon, {
                        Rotation = 45,
                        ImageColor3 = theme.Primary
                    }, 0.3, 1)
                    if (self.minFocused) then
                        tween(bmin, {BackgroundColor3 = theme.Button4}, 0.2, 1)
                    else
                        tween(bmin, {BackgroundColor3 = theme.Button3}, 0.2, 1)
                    end
                    
                    mf['#region'].Visible = false
                else
                    tween(mf, {Size = UDim2.fromOffset(300, 300)}, 0.3, 1)
                    bminIcon.Image = 'rbxassetid://9642680675'
                    tween(bminIcon, {
                        Rotation = 0,
                        ImageColor3 = Color3.fromRGB(255, 255, 255)
                    }, 0.3, 1)
                    
                    if (self.minFocused) then
                        tween(bmin, {BackgroundColor3 = theme.Button2}, 0.2, 1)
                    else
                        tween(bmin, {BackgroundColor3 = theme.Button1}, 0.2, 1)
                    end
                    
                    mf['#region'].Visible = true
                end
                self.minimized = newState
            end
        end
        -- add the window class
        elemClasses.pickerWindow = pickerWindow
    end
    -- MENU
    do 
        -- init menu class
        local menu = {} do 
            menu.__index = menu
            setmetatable(menu, elemClasses.baseElement)
            
            menu.class = 'menu'
            
            menu.selectorFocused = false
            menu.selected = false
            
            local instances = {} do 
                local menuFrame = Instance.new('ScrollingFrame') do 
                    menuFrame.AutomaticCanvasSize = 'Y'
                    menuFrame.BackgroundTransparency = 1
                    menuFrame.BorderSizePixel = 0 
                    menuFrame.BottomImage = 'rbxassetid://9416839567'
                    menuFrame.MidImage = 'rbxassetid://9416839567'
                    menuFrame.Name = '#menuFrame'
                    menuFrame.Position = UDim2.fromOffset(1, 1)
                    menuFrame.ScrollBarImageTransparency = 0.9
                    menuFrame.ScrollBarThickness = 1 
                    menuFrame.ScrollingDirection = 'Y'
                    menuFrame.ScrollingEnabled = true
                    menuFrame.Size = UDim2.new(1, -2, 1, -2)
                    menuFrame.TopImage = 'rbxassetid://9416839567'
                    menuFrame.Visible = true
                    menuFrame.ZIndex = 30
                    
                    instances.menuFrame = menuFrame
                    
                    local leftRegion = Instance.new('Frame') do 
                        leftRegion.AutomaticSize = 'Y'
                        leftRegion.BackgroundTransparency = 1 
                        leftRegion.BorderSizePixel = 0
                        leftRegion.Name = '#left-region'
                        leftRegion.Size = UDim2.fromScale(0.5, 0)
                        leftRegion.Visible = true
                        leftRegion.ZIndex = 31
                        
                        leftRegion.Parent = menuFrame
                        
                        local layout = Instance.new('UIListLayout') do 
                            layout.Name = '#layout'
                            layout.Padding = UDim.new(0, 4)
                            layout.FillDirection = 'Vertical'
                            layout.HorizontalAlignment = 'Center'
                            layout.VerticalAlignment = 'Top'
                            
                            layout.Parent = leftRegion
                        end
                        
                        local padding = Instance.new('UIPadding') do 
                            padding.PaddingLeft = UDim.new(0, 1)
                            padding.PaddingTop = UDim.new(0, 3)
                            padding.PaddingBottom = UDim.new(0, 3)
                            
                            padding.Parent = leftRegion
                        end
                    end
                    
                    local rightRegion = Instance.new('Frame') do 
                        rightRegion.BackgroundTransparency = 1 
                        rightRegion.BorderSizePixel = 0
                        rightRegion.Name = '#right-region'
                        rightRegion.Size = UDim2.fromScale(0.5, 1)
                        rightRegion.Position = UDim2.fromScale(0.5, 0)
                        rightRegion.Visible = true
                        rightRegion.ZIndex = 31
                        
                        rightRegion.Parent = menuFrame
                        
                        local layout = Instance.new('UIListLayout') do 
                            layout.Name = '#layout'
                            layout.Padding = UDim.new(0, 4)
                            layout.FillDirection = 'Vertical'
                            layout.HorizontalAlignment = 'Center'
                            layout.VerticalAlignment = 'Top'
                            
                            layout.Parent = rightRegion
                        end
                        
                        local padding = Instance.new('UIPadding') do 
                            padding.PaddingRight = UDim.new(0, 1)
                            padding.PaddingTop = UDim.new(0, 3)
                            padding.PaddingBottom = UDim.new(0, 3)
                            
                            padding.Parent = rightRegion
                        end
                    end

                end
                
                local pageSelector = Instance.new('TextButton') do 
                    pageSelector.AutoButtonColor = false
                    pageSelector.BackgroundColor3 = theme.Button1
                    pageSelector.BackgroundTransparency = 0
                    pageSelector.Font = 'SourceSans'
                    pageSelector.Name = '#page-selector'
                    pageSelector.Size = UDim2.new(1, -8, 0, 20)
                    pageSelector.Text = ''
                    pageSelector.TextColor3 = theme.TextPrimary
                    pageSelector.TextSize = 17
                    pageSelector.TextStrokeColor3 = theme.TextStroke
                    pageSelector.TextStrokeTransparency = 0.8
                    pageSelector.TextXAlignment = 'Center'
                    pageSelector.TextYAlignment = 'Center'
                    pageSelector.Visible = true
                    pageSelector.ZIndex = 52 
                    
                    instances.pageSelector = pageSelector
                    
                    local round = Instance.new('UICorner') do 
                        round.CornerRadius = UDim.new(0, rounding and 2 or 0)
                        round.Name = '#round'
                        
                        round.Parent = pageSelector
                    end
                    
                    local stroke = Instance.new('UIStroke') do 
                        stroke.ApplyStrokeMode = 'Border'
                        stroke.Color = theme.Stroke
                        stroke.LineJoinMode = 'Round'
                        stroke.Name = '#stroke'
                        stroke.Thickness = 1 
                        
                        stroke.Parent = pageSelector
                    end
                end
            end
            menu.instances = instances 
            
            menu.select = function(self) 
                for i, m in ipairs(self.window.menus) do 
                    tween(m.instances.menuFrame, {Position = UDim2.new(0, 1, m.id - self.id, 1)}, 0.5, 1)
                    if (m ~= self) then 
                        
                        m:deselect()
                    end
                end
                
                self.selected = true
                if (self.selectorFocused) then
                    tween(self.instances.pageSelector, {
                        BackgroundColor3 = theme.Button4,
                        TextColor3 = theme.Primary
                    }, 0.2, 1)
                else
                    tween(self.instances.pageSelector, {
                        BackgroundColor3 = theme.Button3,
                        TextColor3 = theme.Primary
                    }, 0.2, 1)
                end
                
            end
            -- add 10 for hover
            -- add 30 for selection
            -- additions compound
            
            menu.deselect = function(self) 
                self.selected = false
                if (self.selectorFocused) then
                    tween(self.instances.pageSelector, {
                        BackgroundColor3 = theme.Button2,
                        TextColor3 = theme.TextPrimary
                    }, 0.2, 1)
                else
                    tween(self.instances.pageSelector, {
                        BackgroundColor3 = theme.Button1,
                        TextColor3 = theme.TextPrimary
                    }, 0.2, 1)
                end
            end
            
            menu.signals = {
                pageSelector = {
                    MouseEnter = function(inst, self) 
                        self.selectorFocused = true
                        
                        local pageSelector = self.instances.pageSelector
                        
                        if (self.selected) then
                            tween(pageSelector, {BackgroundColor3 = theme.Button4}, 0.2, 1)
                        else
                            tween(pageSelector, {BackgroundColor3 = theme.Button2}, 0.2, 1)
                        end
                        tween(pageSelector['#stroke'], {Color = theme.StrokeHover}, 0.2, 1)
                    end,
                    MouseLeave = function(inst, self) 
                        self.selectorFocused = false 
                        
                        local pageSelector = self.instances.pageSelector
                        
                        if (self.selected) then
                            tween(pageSelector, {BackgroundColor3 = theme.Button3}, 0.2, 1)
                        else
                            tween(pageSelector, {BackgroundColor3 = theme.Button1}, 0.2, 1)
                        end
                        tween(pageSelector['#stroke'], {Color = theme.Stroke}, 0.2, 1)
                    end
                }
            }
            
            menu.new = function(self) 
                -- inherit some functions and stuff
                local new = setmetatable({}, self)
                new.sections = {}
                new.binds = {}
                
                local instances = {}
                -- copy the main gui 
                instances.menuFrame = self.instances.menuFrame:Clone()
                instances.leftRegion = instances.menuFrame['#left-region']
                instances.rightRegion = instances.menuFrame['#right-region']
                
                instances.pageSelector = self.instances.pageSelector:Clone()
                
                -- setup signals
                for i, signals in pairs(self.signals) do 
                    local inst = instances[i]
                    for signal, func in pairs(signals) do
                        local h = inst[signal]:Connect(function() 
                            func(inst, new)
                        end)
                    end
                end
                
                -- finalize stuff
                new.instances = instances
                return new
            end
            
            elemClasses.window.addMenu = function(self, settings) 
                if (not typeof(settings) == 'table') then
                    return error('expected table for settings', 2) 
                end
                
                local s_text = settings.text or 'nil'
                
                local menu = menu:new()
                menu.window = self
                menu.name = s_text
                table.insert(self.menus, menu)
                
                
                menu.id = #self.menus
                if (menu.id == 1) then
                    menu:select()
                end
                
                local menuTab = menu.instances.pageSelector
                local menuFrame = menu.instances.menuFrame
                
                menuTab.MouseButton1Click:Connect(function() 
                    menu:select()
                end)
                menuTab.Text = s_text
                menuFrame.Position = UDim2.new(0, 1, menu.id - 1, 1)
                
                
                menuTab.Parent = self.instances.tabMenu
                menuFrame.Parent = self.instances.pageRegion
                
                return menu
            end
            
        end
        -- add the menu class
        elemClasses.menu = menu
    end
    -- SECTION
    do 
        local section = {} do 
            section.__index = section 
            setmetatable(section, elemClasses.baseElement)
            
            section.class = 'section'
            
            section.minimized = false
            section.minFocused = false
            
            local instances = {} do 
                local sectionFrame = Instance.new('Frame')
                sectionFrame.BackgroundColor3 = theme.Window2
                sectionFrame.BorderColor3 = theme.Inset2
                sectionFrame.BorderMode = 'Inset'
                sectionFrame.BorderSizePixel = 0
                sectionFrame.Name = '#section'
                sectionFrame.AutomaticSize = 'Y'
                sectionFrame.Size = UDim2.new(1, -4, 0, 16)
                sectionFrame.Visible = true
                sectionFrame.ZIndex = 32
                
                instances.sectionFrame = sectionFrame
                
                local stroke = Instance.new('UIStroke') do 
                    stroke.ApplyStrokeMode = 'Border'
                    stroke.Color = theme.Stroke
                    stroke.LineJoinMode = 'Round'
                    stroke.Name = '#stroke'
                    stroke.Thickness = 1 
                    
                    stroke.Parent = sectionFrame
                end
                
                local menu = Instance.new('Frame') do 
                    menu.AutomaticSize = 'Y'
                    menu.BackgroundColor3 = theme.Window2
                    menu.BorderColor3 = theme.Inset2
                    menu.BorderMode = 'Inset'
                    menu.BorderSizePixel = 1
                    menu.Name = '#menu'
                    menu.Visible = true
                    menu.ZIndex = 33
                    menu.Position = UDim2.fromOffset(0, 17)
                    menu.Size = UDim2.fromScale(1, 0)
                    
                    menu.Parent = sectionFrame
                                        
                    local layout = Instance.new('UIListLayout') do 
                        layout.FillDirection = 'Vertical'
                        layout.HorizontalAlignment = 'Center'
                        layout.Padding = UDim.new(0, 4)
                        layout.VerticalAlignment = 'Top'
                        
                        layout.Parent = menu
                    end
                    
                    local padding = Instance.new('UIPadding') do 
                        padding.PaddingTop = UDim.new(0, 3)
                        padding.PaddingBottom = UDim.new(0, 3)
                        
                        padding.Parent = menu 
                    end
                end
                
                local titleBar = Instance.new('Frame') do 
                    titleBar.BackgroundColor3 = theme.Window3
                    titleBar.BorderColor3 = theme.Inset3
                    titleBar.BorderMode = 'Inset'
                    titleBar.BorderSizePixel = 1
                    titleBar.Name = '#title-bar'
                    titleBar.Size = UDim2.new(1, 0, 0, 16)
                    titleBar.Visible = true
                    titleBar.ZIndex = 33
                    
                    titleBar.Parent = sectionFrame
                    
                    local stroke = Instance.new('UIStroke') do 
                        stroke.ApplyStrokeMode = 'Border'
                        stroke.Color = theme.Stroke
                        stroke.LineJoinMode = 'Round'
                        stroke.Name = '#stroke'
                        stroke.Thickness = 1 
                        
                        stroke.Parent = titleBar
                    end
                    local minimize = Instance.new('TextButton') do 
                        minimize.Active = true
                        minimize.AnchorPoint = Vector2.new(1, 0)
                        minimize.AutoButtonColor = false
                        minimize.BackgroundColor3 = theme.Button1
                        minimize.BackgroundTransparency = 0
                        minimize.BorderSizePixel = 0
                        minimize.Name = '#min'
                        minimize.Position = UDim2.new(1, -1, 0, 1)
                        minimize.Size = UDim2.fromOffset(12, 12)
                        minimize.Text = ''
                        minimize.Visible = true
                        minimize.ZIndex = 35
                        
                        minimize.Parent = titleBar
                        
                        local round = Instance.new('UICorner') do 
                            round.CornerRadius = UDim.new(0, rounding and 2 or 0)
                            round.Name = '#round'
                            
                            round.Parent = minimize
                        end
                        
                        local stroke = Instance.new('UIStroke') do 
                            stroke.ApplyStrokeMode = 'Border'
                            stroke.Color = theme.Stroke
                            stroke.LineJoinMode = 'Round'
                            stroke.Name = '#stroke'
                            stroke.Thickness = 1 
                            
                            stroke.Parent = minimize
                        end
                        
                        local icon = Instance.new('ImageLabel') do 
                            icon.Active = false
                            icon.BackgroundTransparency = 1
                            icon.BorderSizePixel = 0
                            icon.Rotation = 180
                            icon.Image = 'rbxassetid://9801471573'
                            icon.ImageColor3 = Color3.fromRGB(255, 255, 255)
                            icon.Name = '#icon'
                            icon.Position = UDim2.fromOffset(0, 0)
                            icon.Size = UDim2.fromScale(1, 1)
                            icon.Visible = true
                            icon.ZIndex = 36 
                            
                            icon.Parent = minimize
                            
                            local gradient = Instance.new('UIGradient') do 
                                gradient.Color = ColorSequence.new(
                                    theme.ControlGradient1,
                                    theme.ControlGradient2
                                )
                                gradient.Rotation = 90
                                gradient.Enabled = true
                                gradient.Name = '#gradient'
                                
                                gradient.Parent = icon
                            end
                        end
                        
                    end
                    instances.minimizeButton = minimize
                    
                    local title = Instance.new('TextLabel') do 
                        title.BackgroundTransparency = 1
                        title.Font = 'SourceSans'
                        title.Name = '#title'
                        title.RichText = true
                        title.Size = UDim2.fromScale(1, 1)
                        title.Text = 'section'
                        title.TextColor3 = theme.TextPrimary
                        title.TextSize = 14
                        title.TextStrokeColor3 = theme.TextStroke
                        title.TextStrokeTransparency = 0.8
                        title.TextTransparency = 0
                        title.TextWrapped = false
                        title.TextXAlignment = 'Left'
                        title.TextYAlignment = 'Center'
                        title.Visible = true
                        title.ZIndex = 35
                        
                        title.Parent = titleBar
                        instances.title = title 
                        
                        local padding = Instance.new('UIPadding') do 
                            padding.Name = '#padding'
                            padding.PaddingLeft = UDim.new(0, 4)
                            
                            padding.Parent = title
                        end
                    end
                    
                    local trim = Instance.new('Frame') do 
                        trim.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                        trim.BackgroundTransparency = 0
                        trim.BorderSizePixel = 0 
                        trim.Name = '#trim'
                        trim.Position = UDim2.fromOffset(-1, -2)
                        trim.Size = UDim2.new(1, 2, 0, 1)
                        trim.ZIndex = 33
                        
                        trim.Parent = titleBar
                        
                        local gradient = Instance.new('UIGradient') do 
                            gradient.Color = ColorSequence.new(
                                theme.Primary, 
                                theme.Secondary
                            )
                            gradient.Enabled = true
                            gradient.Name = '#gradient'
                            gradient.Rotation = 0
                            
                            gradient.Parent = trim
                        end
                    end
                end
            end
            section.instances = instances 
            
            section.minimize = function(self) 
                
                local newState = not self.minimized
                local mf = self.instances.sectionFrame
                
                local min = mf['#title-bar']['#min']
                
                if (newState) then
                    tween(min['#icon'], {
                        Rotation = 0
                    }, 0.3, 1)
                    mf['#menu'].Visible = false
                    mf.AutomaticSize = 'None'
                else
                    tween(min['#icon'], {
                        Rotation = 180
                    }, 0.3, 1)
                    
                    tween(min, {
                        BackgroundColor3 = self.minFocused and theme.Button2 or theme.Button1
                    }, 0.2, 1)
                    mf['#menu'].Visible = true
                    mf.AutomaticSize = 'Y'
                end
                self.minimized = newState
            end
            
            section.signals = {
                minimizeButton = {
                    mouseButton1Click = function(instance, self)
                        self:minimize()
                    end,
                    MouseEnter = function(instance, self) 
                        self.minFocused = true
                        
                        if (self.minimized) then
                            tween(instance, {BackgroundColor3 = theme.Button4}, 0.2, 1)
                        else
                            tween(instance, {BackgroundColor3 = theme.Button2}, 0.2, 1)
                        end
                        tween(instance['#stroke'], {Color = theme.StrokeHover}, 0.2, 1)
                    end,
                    MouseLeave = function(instance, self) 
                        self.minFocused = false 
                        
                        if (self.minimized) then
                            tween(instance, {BackgroundColor3 = theme.Button3}, 0.2, 1)
                        else
                            tween(instance, {BackgroundColor3 = theme.Button1}, 0.2, 1)
                        end
                        tween(instance['#stroke'], {Color = theme.Stroke}, 0.2, 1)
                    end
                }
            }
            
            section.new = function(self) 
                
                local new = setmetatable({}, self)
                new.controls = {}
                new.binds = {}
                
                local instances = {}
                -- copy the main gui 
                instances.sectionFrame = self.instances.sectionFrame:Clone()
                instances.title = instances.sectionFrame['#title-bar']['#title']
                instances.minimizeButton = instances.sectionFrame['#title-bar']['#min']
                instances.controlMenu = instances.sectionFrame['#menu']
                
                -- setup signals
                
                
                for i, signals in pairs(self.signals) do 
                    local inst = instances[i]
                    for signal, func in pairs(signals) do
                        local h = inst[signal]:Connect(function() 
                            func(inst, new)
                        end)
                    end
                end
                
                -- finalize stuff
                new.instances = instances
                return new
            end
            
            elemClasses.menu.addSection = function(self, settings) 
                if (not typeof(settings) == 'table') then
                    return error('expected type table for settings', 2) 
                end
                
                local s_text = settings.text or 'nil'
                local s_side = settings.side or 'auto'
                local s_min do 
                    if (settings.showMinButton == nil) then
                        s_min = true
                    else
                        s_min = settings.showMinButton
                    end 
                end
                
                local section = section:new()
                section.menu = self
                
                table.insert(self.sections, section)
                section.id = #self.sections
                section.instances.title.Text = s_text
                
                
                do
                    local sectionFrame = section.instances.sectionFrame
                    if (s_side == 'auto') then 
                        if (section.id%2 == 0) then
                            sectionFrame.Parent = self.instances.rightRegion
                        else
                            sectionFrame.Parent = self.instances.leftRegion
                        end
                    else
                        sectionFrame.Parent = self.instances[(s_side == 'left' and 'leftRegion' or 'rightRegion')]
                    end
                    
                    if (not s_min) then
                        section.instances.minimizeButton.Visible = false
                    end
                end
                return section
            end
        end
        -- add class
        elemClasses.section = section
    end
    -- TOGGLE
    do 
        
        local toggle = {} do 
            toggle.__index = toggle 
            setmetatable(toggle, elemClasses.baseElement)
            
            toggle.class = 'toggle'
            
            do
                local instances = {} do 
                    local controlFrame = Instance.new('Frame')
                    controlFrame.BackgroundTransparency = 1
                    controlFrame.Name = '#control'
                    controlFrame.Size = UDim2.new(1, 0, 0, 20)
                    controlFrame.Visible = true
                    controlFrame.ZIndex = 34
                    
                    instances.controlFrame = controlFrame

                    local backToggle = Instance.new('TextButton') do 
                        backToggle.BackgroundTransparency = 1
                        backToggle.Name = '#back-toggle'
                        backToggle.Size = UDim2.fromScale(1, 1)
                        backToggle.Text = ''
                        backToggle.TextTransparency = 1
                        backToggle.ZIndex = 34
                        
                        backToggle.Parent = controlFrame
                        
                        local label = Instance.new('TextLabel') do 
                            label.BackgroundTransparency = 1
                            label.Font = 'SourceSans'
                            label.Name = '#label'
                            label.RichText = true
                            label.Size = UDim2.fromScale(1, 1)
                            label.Text = 'toggle'
                            label.TextColor3 = theme.TextPrimary
                            label.TextSize = 14
                            label.TextStrokeColor3 = theme.TextStroke
                            label.TextStrokeTransparency = 0.8
                            label.TextTransparency = 0
                            label.TextWrapped = false
                            label.TextXAlignment = 'Left'
                            label.TextYAlignment = 'Center'
                            label.Visible = true
                            label.ZIndex = 35
                            
                            label.Parent = backToggle
                            
                            local padding = Instance.new('UIPadding') do 
                                padding.Name = '#padding'
                                padding.PaddingLeft = UDim.new(0, 6)
                                
                                padding.Parent = label
                            end
                        end
                        
                        local toggle = Instance.new('Frame') do 
                            toggle.Active = true
                            toggle.AnchorPoint = Vector2.new(1, 0)
                            toggle.BackgroundColor3 = theme.Button1
                            toggle.Name = '#toggle'
                            toggle.Position = UDim2.new(1, -3, 0, 2)
                            toggle.Size = UDim2.fromOffset(16, 16)
                            toggle.Visible = true
                            toggle.ZIndex = 35
                            
                            toggle.Parent = backToggle
                            
                            local round = Instance.new('UICorner') do 
                                round.CornerRadius = UDim.new(0, rounding and 2 or 0)
                                round.Name = '#round'
                                
                                round.Parent = toggle
                            end
                            
                            local stroke = Instance.new('UIStroke') do 
                                stroke.ApplyStrokeMode = 'Border'
                                stroke.Color = theme.Stroke
                                stroke.LineJoinMode = 'Round'
                                stroke.Name = '#stroke'
                                stroke.Thickness = 1 
                                
                                stroke.Parent = toggle
                            end
                            
                            local icon = Instance.new('ImageLabel') do 
                                icon.Active = false
                                icon.BackgroundTransparency = 1
                                icon.BorderSizePixel = 0
                                icon.Image = 'rbxassetid://9801456486'
                                icon.ImageColor3 = theme.Secondary
                                icon.Name = '#icon'
                                icon.Position = UDim2.fromOffset(0, 0)
                                icon.Rotation = 360
                                icon.Size = UDim2.fromScale(1, 1)
                                icon.Visible = true
                                icon.ZIndex = 35 
                                
                                icon.Parent = toggle
                                
                                local gradient = Instance.new('UIGradient') do 
                                    gradient.Color = ColorSequence.new(
                                        theme.ControlGradient1,
                                        theme.ControlGradient2
                                    )
                                    gradient.Enabled = true
                                    gradient.Name = '#gradient'
                                    gradient.Rotation = 90
                                    
                                    gradient.Parent = icon
                                end
                            end
                        end
                    end
                end
                toggle.instances = instances 
            end
            
            toggle.toggled = false
            toggle.focused = false
            toggle.toggle = function(self) 
                
                local newState = not self.toggled
                self.toggled = newState
                local toggle = self.instances.toggle
                local icon = toggle['#icon']
                
                
                if (newState) then
                    icon.Image = 'rbxassetid://9801457539'
                    tween(icon, {
                        Rotation = 0,
                        ImageColor3 = theme.Primary
                    }, 0.3, 1)

                    
                    if (self.focused) then
                        tween(toggle, {BackgroundColor3 = theme.Button4}, 0.2, 1)
                    else
                        tween(toggle, {BackgroundColor3 = theme.Button3}, 0.2, 1)
                    end
                    
                    self:fireEvent('onEnable')
                else
                    icon.Image = 'rbxassetid://9801456486'
                    tween(icon, {
                        Rotation = 360,
                        ImageColor3 = theme.Secondary
                    }, 0.3, 1)
                    
                    if (self.focused) then
                        tween(toggle, {BackgroundColor3 = theme.Button2}, 0.2, 1)
                    else
                        tween(toggle, {BackgroundColor3 = theme.Button1}, 0.2, 1)
                    end

                    self:fireEvent('onDisable')
                end
                
                
                self:fireEvent('onToggle', newState)
                return self
            end
            
            toggle.__hotkeyFunc = toggle.toggle
            
            toggle.enable = function(self) 
                self.toggled = true
                
                local toggle = self.instances.toggle
                local icon = toggle['#icon']

                icon.Image = 'rbxassetid://9801457539'
                tween(icon, {
                    Rotation = 0,
                    ImageColor3 = theme.Primary
                }, 0.3, 1)
                
                if (self.focused) then
                    tween(toggle, {BackgroundColor3 = theme.Button4}, 0.2, 1)
                    tween(toggle['#stroke'], {Color = theme.StrokeHover}, 0.2, 1)
                else
                    tween(toggle, {BackgroundColor3 = theme.Button3}, 0.2, 1)
                    tween(toggle['#stroke'], {Color = theme.Stroke}, 0.2, 1)
                end
                
                self:fireEvent('onEnable')
                self:fireEvent('onToggle', true)
                return self
            end
            
            toggle.disable = function(self) 
                self.toggled = false
                
                local toggle = self.instances.toggle
                local icon = toggle['#icon']
                
                icon.Image = 'rbxassetid://9801456486'
                tween(icon, {
                    Rotation = 360,
                    ImageColor3 = theme.Secondary
                }, 0.3, 1)
                
                
                
                if (self.focused) then
                    tween(toggle, {BackgroundColor3 = theme.Button2}, 0.2, 1)
                    tween(toggle['#stroke'], {Color = theme.StrokeHover}, 0.2, 1)
                else
                    tween(toggle, {BackgroundColor3 = theme.Button1}, 0.2, 1)
                    tween(toggle['#stroke'], {Color = theme.Stroke}, 0.2, 1)
                end
                
                self:fireEvent('onDisable')
                self:fireEvent('onToggle', false)
                return self
            end
            
            toggle.reset = function(self) 
                self:toggle()
                self:toggle()
            end
            
            toggle.signals = {
                backToggle = {
                    MouseEnter = function(inst, toggle) 
                        toggle.focused = true
                        toggle:showTooltip()
                        
                        local togInst = toggle.instances.toggle
                        
                        if (toggle.toggled) then
                            tween(togInst, {BackgroundColor3 = theme.Button4}, 0.2, 1)
                        else
                            tween(togInst, {BackgroundColor3 = theme.Button2}, 0.2, 1)
                        end
                        tween(togInst['#stroke'], {Color = theme.StrokeHover}, 0.2, 1)
                    end,
                    MouseLeave = function(inst, toggle) 
                        toggle.focused = false
                        toggle:hideTooltip()
                        
                        
                        local togInst = toggle.instances.toggle
                        if (toggle.toggled) then
                            tween(togInst, {BackgroundColor3 = theme.Button3}, 0.2, 1)
                        else
                            tween(togInst, {BackgroundColor3 = theme.Button1}, 0.2, 1)
                        end
                        tween(togInst['#stroke'], {Color = theme.Stroke}, 0.2, 1)
                    end,
                    MouseButton1Click = function(inst, toggle) 
                        toggle:toggle()
                    end
                }
            }
            --toggle.signals.backToggle = toggle.signals.toggle
            
            toggle.new = function(self) 
                local new = setmetatable({}, self)
                new.binds = {}
                
                local instances = {}
                instances.controlFrame = self.instances.controlFrame:Clone()
                instances.backToggle = instances.controlFrame['#back-toggle']
                instances.label = instances.backToggle['#label']
                instances.toggle = instances.backToggle['#toggle']
                
                for i, signals in pairs(self.signals) do 
                    local inst = instances[i]
                    for signal, func in pairs(signals) do
                        local h = inst[signal]:Connect(function() 
                            func(inst, new)
                        end)
                    end
                end
                
                new.instances = instances
                return new
            end
            
            toggle.getState = function(self) return self.toggled end
            toggle.isEnabled = toggle.getState
            toggle.getValue = toggle.getState
            
            elemClasses.section.addToggle = function(self, settings, callback) 
                if (not typeof(settings) == 'table') then
                    return error('expected type table for settings', 2) 
                end
                
                local s_title = settings.text or 'nil'
                local s_state = settings.state or false
                
                local toggle = toggle:new()
                toggle.section = self 
                toggle.name = s_title
                table.insert(self.controls, toggle)
                
                toggle.instances.label.Text = s_title
                if (s_state) then 
                    toggle:enable()
                end
                toggle.instances.controlFrame.Parent = self.instances.controlMenu
                
                if (typeof(callback) == 'function') then
                    toggle:bindToEvent('onToggle', callback) 
                end
                return toggle
            end
        end
        -- add class
        elemClasses.toggle = toggle
    end
    -- BUTTONS
    do
        -- SMALL BUTTON
        do 
            
            local buttonSmall = {} do 
                buttonSmall.__index = buttonSmall 
                setmetatable(buttonSmall, elemClasses.baseElement)
                
                buttonSmall.class = 'buttonSmall'
                
                do
                    local instances = {} do 
                        local controlFrame = Instance.new('Frame')
                        controlFrame.BackgroundTransparency = 1
                        controlFrame.Name = '#control'
                        controlFrame.Size = UDim2.new(1, 0, 0, 20)
                        controlFrame.Visible = true
                        controlFrame.ZIndex = 34
                        
                        instances.controlFrame = controlFrame

                        local clickSensor = Instance.new('TextButton') do 
                            clickSensor.BackgroundTransparency = 1
                            clickSensor.Name = '#click-sensor'
                            clickSensor.Size = UDim2.fromScale(1, 1)
                            clickSensor.Text = ''
                            clickSensor.TextTransparency = 1
                            clickSensor.ZIndex = 34
                            
                            clickSensor.Parent = controlFrame
                            
                            local label = Instance.new('TextLabel') do 
                                label.BackgroundTransparency = 1
                                label.Font = 'SourceSans'
                                label.Name = '#label'
                                label.RichText = true
                                label.Size = UDim2.fromScale(1, 1)
                                label.Text = 'button'
                                label.TextColor3 = theme.TextPrimary
                                label.TextSize = 14
                                label.TextStrokeColor3 = theme.TextStroke
                                label.TextStrokeTransparency = 0.8
                                label.TextTransparency = 0
                                label.TextWrapped = false
                                label.TextXAlignment = 'Left'
                                label.TextYAlignment = 'Center'
                                label.Visible = true
                                label.ZIndex = 35
                                
                                label.Parent = clickSensor
                                
                                local padding = Instance.new('UIPadding') do 
                                    padding.Name = '#padding'
                                    padding.PaddingLeft = UDim.new(0, 6)
                                    
                                    padding.Parent = label
                                end
                            end
                            
                            local button = Instance.new('Frame') do 
                                button.Active = true
                                button.AnchorPoint = Vector2.new(1, 0)
                                button.BackgroundColor3 = theme.Button1
                                button.Name = '#button'
                                button.Position = UDim2.new(1, -3, 0, 2)
                                button.Size = UDim2.fromOffset(16, 16)
                                button.Visible = true
                                button.ZIndex = 35
                                
                                button.Parent = clickSensor
                                
                                local round = Instance.new('UICorner') do 
                                    round.CornerRadius = UDim.new(0, rounding and 2 or 0)
                                    round.Name = '#round'
                                    
                                    round.Parent = button
                                end
                                
                                local stroke = Instance.new('UIStroke') do 
                                    stroke.ApplyStrokeMode = 'Border'
                                    stroke.Color = theme.Stroke
                                    stroke.LineJoinMode = 'Round'
                                    stroke.Name = '#stroke'
                                    stroke.Thickness = 1 
                                    
                                    stroke.Parent = button
                                end
                                
                                local icon = Instance.new('ImageLabel') do 
                                    icon.Active = false
                                    icon.BackgroundTransparency = 1
                                    icon.BorderSizePixel = 0
                                    icon.Image = 'rbxassetid://9801455339'
                                    icon.ImageColor3 = Color3.fromRGB(255, 255, 255)
                                    icon.Name = '#icon'
                                    icon.Position = UDim2.fromOffset(0, 0)
                                    icon.Rotation = 360
                                    icon.Size = UDim2.fromScale(1, 1)
                                    icon.Visible = true
                                    icon.ZIndex = 35 
                                    
                                    icon.Parent = button
                                    
                                    local gradient = Instance.new('UIGradient') do 
                                        gradient.Color = ColorSequence.new(
                                            theme.ControlGradient1,
                                            theme.ControlGradient2
                                        )
                                        gradient.Enabled = true
                                        gradient.Name = '#gradient'
                                        gradient.Rotation = 90
                                        
                                        gradient.Parent = icon
                                    end
                                end
                            end
                        end
                    end
                    buttonSmall.instances = instances 
                end
                
                buttonSmall.focused = false
                buttonSmall.click = function(self) 
                    self:fireEvent('onClick')
                    
                    local button = self.instances.button
                    local icon = button['#icon']
                    
                    if (self.focused) then
                        button.BackgroundColor3 = theme.Button4
                        tween(button, {BackgroundColor3 = theme.Button2}, 1, 1)
                    else
                        button.BackgroundColor3 = theme.Button3
                        tween(button, {BackgroundColor3 = theme.Button1}, 1, 1)
                    end
                    icon.ImageColor3 = theme.Primary
                    tween(icon, {ImageColor3 = Color3.fromRGB(255, 255, 255)}, 1, 1)
                    return self
                end
                buttonSmall.__hotkeyFunc = buttonSmall.click
                
                buttonSmall.signals = {
                    clickSensor = {
                        MouseEnter = function(inst, button) 
                            button.focused = true
                            button:showTooltip()

                            local inst = button.instances.button
                            tween(inst, {BackgroundColor3 = theme.Button2}, 0.2, 1)
                            tween(inst['#stroke'], {Color = theme.StrokeHover}, 0.2, 1)
                        end,
                        MouseLeave = function(inst, button) 
                            button.focused = false
                            button:hideTooltip()
                            
                            local inst = button.instances.button
                            tween(inst, {BackgroundColor3 = theme.Button1}, 0.2, 1)
                            tween(inst['#stroke'], {Color = theme.Stroke}, 0.2, 1)
                        end,
                        MouseButton1Click = function(inst, button) 
                            button:click()
                        end
                    }
                }
                
                buttonSmall.new = function(self) 
                    
                    local new = setmetatable({}, self)
                    new.binds = {}
                    
                    local instances = {}
                    instances.controlFrame = self.instances.controlFrame:Clone()
                    instances.clickSensor = instances.controlFrame['#click-sensor']
                    instances.label = instances.clickSensor['#label']
                    instances.button = instances.clickSensor['#button']
                    
                    for i, signals in pairs(self.signals) do 
                        local inst = instances[i]
                        for signal, func in pairs(signals) do
                            local h = inst[signal]:Connect(function() 
                                func(inst, new)
                            end)
                        end
                    end
                    
                    new.instances = instances
                    return new
                end
            end
            -- add class
            elemClasses.buttonSmall = buttonSmall
        end
        
        -- LARGE BUTTON
        do 
            
            local buttonLarge = {} do 
                buttonLarge.__index = buttonLarge 
                setmetatable(buttonLarge, elemClasses.baseElement)
                
                buttonLarge.class = 'buttonLarge'
                
                do
                    local instances = {} do 
                        local controlFrame = Instance.new('Frame')
                        controlFrame.BackgroundTransparency = 1
                        controlFrame.Name = '#control'
                        controlFrame.Size = UDim2.new(1, 0, 0, 20)
                        controlFrame.Visible = true
                        controlFrame.ZIndex = 34
                        
                        instances.controlFrame = controlFrame

                        local clickSensor = Instance.new('TextButton') do 
                            clickSensor.BackgroundTransparency = 1
                            clickSensor.Name = '#click-sensor'
                            clickSensor.Size = UDim2.fromScale(1, 1)
                            clickSensor.Text = ''
                            clickSensor.TextTransparency = 1
                            clickSensor.ZIndex = 34
                            
                            clickSensor.Parent = controlFrame
                            
                        
                            
                            local button = Instance.new('Frame') do 
                                button.Active = true
                                button.AnchorPoint = Vector2.new(1, 0)
                                button.BackgroundColor3 = theme.Button1
                                button.Name = '#button'
                                button.Position = UDim2.new(1, -3, 0, 2)
                                button.Size = UDim2.new(1, -6, 0, 16)
                                button.Visible = true
                                button.ZIndex = 35
                                
                                button.Parent = clickSensor
                                
                                local round = Instance.new('UICorner') do 
                                    round.CornerRadius = UDim.new(0, rounding and 2 or 0)
                                    round.Name = '#round'
                                    
                                    round.Parent = button
                                end
                                
                                local stroke = Instance.new('UIStroke') do 
                                    stroke.ApplyStrokeMode = 'Border'
                                    stroke.Color = theme.Stroke
                                    stroke.LineJoinMode = 'Round'
                                    stroke.Name = '#stroke'
                                    stroke.Thickness = 1 
                                    
                                    stroke.Parent = button
                                end
                                
                                local label = Instance.new('TextLabel') do 
                                    label.BackgroundTransparency = 1
                                    label.Font = 'SourceSans'
                                    label.Name = '#label'
                                    label.RichText = true
                                    label.Size = UDim2.fromScale(1, 1)
                                    label.Text = 'button'
                                    label.TextColor3 = theme.TextPrimary
                                    label.TextSize = 14
                                    label.TextStrokeColor3 = theme.TextStroke
                                    label.TextStrokeTransparency = 0.8
                                    label.TextTransparency = 0
                                    label.TextWrapped = false
                                    label.TextXAlignment = 'Center'
                                    label.TextYAlignment = 'Center'
                                    label.Visible = true
                                    label.ZIndex = 35
                                    
                                    label.Parent = button
                                end
                            end
                        end
                    end
                    buttonLarge.instances = instances 
                end
                
                buttonLarge.focused = false
                
                
                buttonLarge.click = function(self) 
                    self:fireEvent('onClick')
                    
                    local button = self.instances.button
                    local label = button['#label']
                    
                    if (self.focused) then
                        button.BackgroundColor3 = theme.Button4
                        tween(button, {BackgroundColor3 = theme.Button2}, 1, 1)
                    else
                        button.BackgroundColor3 = theme.Button3
                        tween(button, {BackgroundColor3 = theme.Button1}, 1, 1)
                    end
                    label.TextColor3 = theme.Primary
                    tween(label, {TextColor3 = theme.TextPrimary}, 1, 1)
                    
                    return self
                end
                buttonLarge.__hotkeyFunc = buttonLarge.click
                
                buttonLarge.signals = {
                    clickSensor = {
                        MouseEnter = function(inst, button) 
                            button.focused = true
                            button:showTooltip()
                            
                            local inst = button.instances.button
                            tween(inst, {BackgroundColor3 = theme.Button2}, 0.2, 1)
                            tween(inst['#stroke'], {Color = theme.StrokeHover}, 0.2, 1)
                        end,
                        MouseLeave = function(inst, button) 
                            button.focused = false
                            button:hideTooltip()
                            
                            local inst = button.instances.button
                            tween(inst, {BackgroundColor3 = theme.Button1}, 0.2, 1)
                            tween(inst['#stroke'], {Color = theme.Stroke}, 0.2, 1)
                        end,
                        MouseButton1Click = function(inst, button) 
                            button:click()
                        end
                    }
                }
                
                buttonLarge.new = function(self) 
                    
                    local new = setmetatable({}, self)
                    new.binds = {}
                    
                    local instances = {}
                    instances.controlFrame = self.instances.controlFrame:Clone()
                    instances.clickSensor = instances.controlFrame['#click-sensor']
                    instances.button = instances.clickSensor['#button']
                    instances.label = instances.button['#label']
                    
                    for i, signals in pairs(self.signals) do 
                        local inst = instances[i]
                        for signal, func in pairs(signals) do
                            local h = inst[signal]:Connect(function() 
                                func(inst, new)
                            end)
                        end
                    end
                    
                    new.instances = instances
                    return new
                end
                
            end
            -- add class
            elemClasses.buttonLarge = buttonLarge
        end
        
        -- button finalization
        elemClasses.section.addButton = function(self, settings, callback) 
            if (not typeof(settings) == 'table') then
                return error('expected type table for settings', 2) 
            end
            
            local s_title = settings.text or 'nil'
            local s_style = settings.style or 'small'
            if (typeof(s_style) == 'number') then
                if (s_style == 2) then
                    s_style = 'large'
                else
                    s_style = 'small'
                end
            elseif (typeof(s_style) ~= 'string') then
                s_style = 'small'
            end
            
            local new
            if (s_style == 'large') then
                new = elemClasses.buttonLarge:new()
            else
                new = elemClasses.buttonSmall:new()
            end
            new.section = self 
            new.name = s_title
            table.insert(self.controls, new)
            
            new.instances.label.Text = s_title
            new.instances.controlFrame.Parent = self.instances.controlMenu
            
            if (typeof(callback) == 'function') then
                new:bindToEvent('onClick', callback) 
            end
            return new
        end
    end
    -- LABEL
    do 
        local label = {} do 
            label.__index = label 
            
            local instances = {} do 
                local controlFrame = Instance.new('Frame')
                controlFrame.BackgroundTransparency = 1
                controlFrame.Name = '#control'
                controlFrame.Size = UDim2.new(1, 0, 0, 20)
                controlFrame.Visible = true
                controlFrame.ZIndex = 34
                
                instances.controlFrame = controlFrame

                local label = Instance.new('TextLabel') do 
                    label.BackgroundTransparency = 1
                    label.Font = 'SourceSans'
                    label.Name = '#label'
                    label.RichText = true
                    label.Size = UDim2.fromScale(1, 1)
                    label.Text = 'label'
                    label.TextColor3 = theme.TextPrimary
                    label.TextSize = 14
                    label.TextStrokeColor3 = theme.TextStroke
                    label.TextStrokeTransparency = 0.8
                    label.TextTransparency = 0
                    label.TextWrapped = false
                    label.TextXAlignment = 'Left'
                    label.TextYAlignment = 'Center'
                    label.Visible = true
                    label.ZIndex = 35
                    
                    label.Parent = controlFrame
                    
                    local padding = Instance.new('UIPadding') do 
                        padding.Name = '#padding'
                        padding.PaddingLeft = UDim.new(0, 6)
                        
                        padding.Parent = label
                    end
                end
            end
            label.instances = instances 
            
            label.new = function(self) 
                local new = setmetatable({}, self)
                new.controls = {}
                
                local instances = {}
                instances.controlFrame = self.instances.controlFrame:Clone()
                instances.label = instances.controlFrame['#label']
                
                new.instances = instances
                return new
            end
            
            label.setText = function(self, newText) 
                self.instances.label.Text = tostring(newText)
                return self
            end
            
            label.getText = function(self) 
                return self.instances.label.Text
            end
            
            elemClasses.section.addLabel = function(self, settings) 
                if (not typeof(settings) == 'table') then
                    return error('expected type table for settings', 2) 
                end
                
                local s_title = settings.text or 'nil'
                local s_center = settings.center or false
                local s_dim = settings.dim or false 
                
                local label = label:new()
                label.section = self 
                table.insert(self.controls, label)
                
                
                local labelInstance = label.instances.label
                
                labelInstance.Text = s_title
                if (s_dim) then
                    labelInstance.TextColor3 = theme.TextDim 
                end
                if (s_center) then
                    labelInstance.TextXAlignment = 'Center'
                    labelInstance['#padding'].PaddingLeft = UDim.new(0, 0)
                end
                label.instances.controlFrame.Parent = self.instances.controlMenu
                return label
            end
        end
        -- add class
        label.section = section
        elemClasses.label = label
    end
    
    -- Unfinished
    -- DROPDOWN OPTION
    --[[
    do 
        local dropdownOption = {} do 
            dropdownOption.__index = dropdownOption 
            setmetatable(dropdownOption, elemClasses.baseElement)
            
            dropdownOption.class = 'dropdownOption'
            
            do
                local instances = {} do 
                    local controlFrame = Instance.new('Frame')
                    controlFrame.BackgroundTransparency = 0.8
                    controlFrame.BackgroundColor3 = Color3.new(1, 0, 0)
                    controlFrame.Name = '#control'
                    controlFrame.Size = UDim2.new(1, 0, 0, 24)
                    controlFrame.Visible = true
                    controlFrame.ZIndex = 34
                    
                    instances.controlFrame = controlFrame
                    
                    local clickSensor = Instance.new('TextButton') do 
                        clickSensor.BackgroundTransparency = 1
                        clickSensor.Name = '#click-sensor'
                        clickSensor.Size = UDim2.fromScale(1, 1)
                        clickSensor.Text = ''
                        clickSensor.TextTransparency = 1
                        clickSensor.ZIndex = 34
                        
                        clickSensor.Parent = controlFrame
                        
                        local button = Instance.new('Frame') do 
                            button.Active = true
                            button.AnchorPoint = Vector2.new(1, 0)
                            button.BackgroundColor3 = theme.Button1
                            button.Name = '#button'
                            button.Position = UDim2.new(1, -3, 0, 4)
                            button.Size = UDim2.new(1, -6, 0, 16)
                            button.Visible = true
                            button.ZIndex = 35
                            
                            button.Parent = clickSensor
                            
                            local round = Instance.new('UICorner') do 
                                round.CornerRadius = UDim.new(0, rounding and 2 or 0)
                                round.Name = '#round'
                                
                                round.Parent = button
                            end
                            
                            local stroke = Instance.new('UIStroke') do 
                                stroke.ApplyStrokeMode = 'Border'
                                stroke.Color = theme.Stroke
                                stroke.LineJoinMode = 'Round'
                                stroke.Name = '#stroke'
                                stroke.Thickness = 1 
                                
                                stroke.Parent = button
                            end
                            
                            local label = Instance.new('TextLabel') do 
                                label.BackgroundTransparency = 1
                                label.Font = 'SourceSans'
                                label.Name = '#label'
                                label.RichText = true
                                label.Size = UDim2.fromScale(1, 1)
                                label.Text = 'button'
                                label.TextColor3 = theme.TextPrimary
                                label.TextSize = 14
                                label.TextStrokeColor3 = theme.TextStroke
                                label.TextStrokeTransparency = 0.8
                                label.TextTransparency = 0
                                label.TextWrapped = false
                                label.TextXAlignment = 'Center'
                                label.TextYAlignment = 'Center'
                                label.Visible = true
                                label.ZIndex = 35
                                
                                label.Parent = button
                            end
                            
                            local icon = Instance.new('ImageLabel') do 
                                icon.AnchorPoint = Vector2.new(1, 0)
                                icon.BackgroundTransparency = 1
                                icon.Image = 'rbxassetid://9801473013'
                                icon.ImageColor3 = theme.Secondary
                                icon.Name = '#icon'
                                icon.Position = UDim2.fromScale(1, 0)
                                icon.Rotation = 0
                                icon.Size = UDim2.fromOffset(16, 16)
                                icon.Visible = true
                                icon.ZIndex = 35
                                
                                icon.Parent = button
                                
                                local gradient = Instance.new('UIGradient') do 
                                    gradient.Color = ColorSequence.new(
                                        theme.ControlGradient1,
                                        theme.ControlGradient2
                                    )
                                    gradient.Rotation = 90
                                    gradient.Enabled = true
                                    gradient.Name = '#gradient'
                                    
                                    gradient.Parent = icon
                                end
                            end
                        end
                        
                        
                        local menu = Instance.new('ScrollingFrame') do 
                            menu.BackgroundColor3 = theme.Window3
                            menu.BorderSizePixel = 0
                            menu.BottomImage = 'rbxassetid://9416839567'
                            menu.ClipsDescendants = true
                            menu.CanvasSize = UDim2.fromOffset(0, 0)
                            menu.MidImage = 'rbxassetid://9416839567'
                            menu.Name = '#menu'
                            menu.Position = UDim2.fromOffset(3, 20)
                            menu.ScrollBarImageTransparency = 0.9
                            menu.ScrollBarThickness = 1
                            menu.ScrollingDirection = 'Y'
                            menu.ScrollingEnabled = true
                            menu.Size = UDim2.new(1, -6, 0, 0)
                            menu.TopImage = 'rbxassetid://9416839567'
                            menu.ZIndex = 34
                            
                            menu.Parent = controlFrame
                            
                            local layout = Instance.new('UIListLayout') do 
                                layout.Padding = UDim.new(0, 4)
                                layout.Name = '#layout'
                                layout.FillDirection = 'Vertical'
                                layout.HorizontalAlignment = 'Center'
                                layout.VerticalAlignment = 'Top'
                                layout.SortOrder = 'LayoutOrder'
                                
                                layout.Parent = menu
                            end
                            
                            local padding = Instance.new('UIPadding') do 
                                padding.PaddingTop = UDim.new(0, 4)
                                padding.Name = '#padding'
                                padding.Parent = menu
                            end
                            
                            local stroke = Instance.new('UIStroke') do 
                                stroke.ApplyStrokeMode = 'Border'
                                stroke.Color = theme.Stroke
                                stroke.LineJoinMode = 'Round'
                                stroke.Name = '#stroke'
                                stroke.Thickness = 1 
                                
                                stroke.Parent = menu
                            end
                        end
                    end
                end
                dropdownOption.instances = instances 
            end
            
            dropdownOption.focused = false
            dropdownOption.selected = false
            
            dropdownOption.select = function(self) 
                self.openState = not self.openState
                if (self.openState) then
                    self:open()
                else
                    self:close()
                end
                
                return self
            end
            dropdownOption.__hotkeyFunc = dropdownOption.select
            
            dropdownOption.signals = {
                clickSensor = {
                    MouseEnter = function(inst, self) 
                        self.focused = true
                        self:showTooltip()
                        
                        
                        local frame = self.instances.button
                        if (self.openState) then
                            tween(frame, {BackgroundColor3 = theme.Button4}, 0.2, 1)
                        else
                            tween(frame, {BackgroundColor3 = theme.Button2}, 0.2, 1)
                        end
                        tween(frame['#stroke'], {Color = theme.StrokeHover}, 0.2, 1)
                    end,
                    MouseLeave = function(inst, self) 
                        self.focused = false
                        self:hideTooltip()
                        
                        local frame = self.instances.button
                        if (self.openState) then
                            tween(frame, {BackgroundColor3 = theme.Button3}, 0.2, 1)
                        else
                            tween(frame, {BackgroundColor3 = theme.Button1}, 0.2, 1)
                        end
                        tween(frame['#stroke'], {Color = theme.Stroke}, 0.2, 1)
                    end,
                    MouseButton1Click = function(inst, self) 
                        self:click()
                    end
                }
            }
            
            dropdownOption.new = function(self) 
                
                local new = setmetatable({}, self)
                new.binds = {}
                new.options = {}
                
                local instances = {}
                instances.controlFrame = self.instances.controlFrame:Clone()
                instances.clickSensor = instances.controlFrame['#click-sensor']
                instances.button = instances.clickSensor['#button']
                instances.label = instances.button['#label']
                instances.icon = instances.button['#icon']
                instances.menu = instances.controlFrame['#menu']
                
                for i, signals in pairs(self.signals) do 
                    local inst = instances[i]
                    for signal, func in pairs(signals) do
                        local h = inst[signal]:Connect(function() 
                            func(inst, new)
                        end)
                    end
                end
                
                new.instances = instances
                return new
            end
            
            
            elemClasses.dropdown.addDropdown = function(self, settings) 
                if (not typeof(settings) == 'table') then
                    return error('expected type table for settings', 2) 
                end
                
                local s_title = settings.text or 'nil'
                local s_options = settings.options or {}
                
                local new = dropdown:new()
                new.section = self 
                new.name = s_title
                table.insert(self.controls, new)
                
                new.instances.label.Text = s_title
                new.instances.controlFrame.Parent = self.instances.controlMenu
                return new
            end
        end
        -- add class
        elemClasses.dropdownOption = dropdownOption
    end]]

    -- Unfinished
    -- DROPDOWN
    --[[
    do 
        local dropdown = {} do 
            dropdown.__index = dropdown 
            setmetatable(dropdown, elemClasses.baseElement)
            
            dropdown.class = 'dropdown'
            
            do
                local instances = {} do 
                    local controlFrame = Instance.new('Frame')
                    controlFrame.BackgroundTransparency = 1
                    controlFrame.BackgroundColor3 = Color3.new(0, 1, 1)
                    controlFrame.Name = '#control'
                    controlFrame.Size = UDim2.new(1, 0, 0, 20)
                    controlFrame.Visible = true
                    controlFrame.ZIndex = 34
                    
                    instances.controlFrame = controlFrame
                    
                    local clickSensor = Instance.new('TextButton') do 
                        clickSensor.BackgroundTransparency = 1
                        clickSensor.Name = '#click-sensor'
                        clickSensor.Size = UDim2.new(1, 0, 0, 20)
                        clickSensor.Text = ''
                        clickSensor.TextTransparency = 1
                        clickSensor.ZIndex = 34
                        
                        clickSensor.Parent = controlFrame
                        
                        local button = Instance.new('Frame') do 
                            button.Active = true
                            button.AnchorPoint = Vector2.new(1, 0)
                            button.BackgroundColor3 = theme.Button1
                            button.Name = '#button'
                            button.Position = UDim2.new(1, -3, 0, 2)
                            button.Size = UDim2.new(1, -6, 0, 16)
                            button.Visible = true
                            button.ZIndex = 35
                            
                            button.Parent = clickSensor
                            
                            local round = Instance.new('UICorner') do 
                                round.CornerRadius = UDim.new(0, rounding and 2 or 0)
                                round.Name = '#round'
                                
                                round.Parent = button
                            end
                            
                            local stroke = Instance.new('UIStroke') do 
                                stroke.ApplyStrokeMode = 'Border'
                                stroke.Color = theme.Stroke
                                stroke.LineJoinMode = 'Round'
                                stroke.Name = '#stroke'
                                stroke.Thickness = 1 
                                
                                stroke.Parent = button
                            end
                            
                            local label = Instance.new('TextLabel') do 
                                label.BackgroundTransparency = 1
                                label.Font = 'SourceSans'
                                label.Name = '#label'
                                label.RichText = true
                                label.Size = UDim2.fromScale(1, 1)
                                label.Text = 'button'
                                label.TextColor3 = theme.TextPrimary
                                label.TextSize = 14
                                label.TextStrokeColor3 = theme.TextStroke
                                label.TextStrokeTransparency = 0.8
                                label.TextTransparency = 0
                                label.TextWrapped = false
                                label.TextXAlignment = 'Center'
                                label.TextYAlignment = 'Center'
                                label.Visible = true
                                label.ZIndex = 35
                                
                                label.Parent = button
                            end
                            
                            local icon = Instance.new('ImageLabel') do 
                                icon.AnchorPoint = Vector2.new(1, 0)
                                icon.BackgroundTransparency = 1
                                icon.Image = 'rbxassetid://9801473013'
                                icon.ImageColor3 = theme.Secondary
                                icon.Name = '#icon'
                                icon.Position = UDim2.fromScale(1, 0)
                                icon.Rotation = 0
                                icon.Size = UDim2.fromOffset(16, 16)
                                icon.Visible = true
                                icon.ZIndex = 35
                                
                                icon.Parent = button
                                
                                local gradient = Instance.new('UIGradient') do 
                                    gradient.Color = ColorSequence.new(
                                        theme.ControlGradient1,
                                        theme.ControlGradient2
                                    )
                                    gradient.Rotation = 90
                                    gradient.Enabled = true
                                    gradient.Name = '#gradient'
                                    
                                    gradient.Parent = icon
                                end
                            end
                        end
                        
                        
                        local menu = Instance.new('ScrollingFrame') do 
                            menu.BackgroundColor3 = theme.Window3
                            menu.BorderSizePixel = 0
                            menu.BottomImage = 'rbxassetid://9416839567'
                            menu.ClipsDescendants = true
                            menu.CanvasSize = UDim2.fromOffset(0, 0)
                            menu.MidImage = 'rbxassetid://9416839567'
                            menu.Name = '#menu'
                            menu.Position = UDim2.fromOffset(3, 18)
                            menu.ScrollBarImageTransparency = 0.9
                            menu.ScrollBarThickness = 1
                            menu.ScrollingDirection = 'Y'
                            menu.ScrollingEnabled = true
                            menu.Size = UDim2.new(1, -6, 0, 0)
                            menu.TopImage = 'rbxassetid://9416839567'
                            menu.ZIndex = 34
                            
                            menu.Parent = controlFrame
                            
                            local layout = Instance.new('UIListLayout') do 
                                layout.Padding = UDim.new(0, 4)
                                layout.Name = '#layout'
                                layout.FillDirection = 'Vertical'
                                layout.HorizontalAlignment = 'Center'
                                layout.VerticalAlignment = 'Top'
                                layout.SortOrder = 'LayoutOrder'
                                
                                layout.Parent = menu
                            end
                            
                            local padding = Instance.new('UIPadding') do 
                                padding.PaddingTop = UDim.new(0, 4)
                                padding.Name = '#padding'
                                padding.Parent = menu
                            end
                            
                            local stroke = Instance.new('UIStroke') do 
                                stroke.ApplyStrokeMode = 'Border'
                                stroke.Color = theme.Stroke
                                stroke.LineJoinMode = 'Round'
                                stroke.Name = '#stroke'
                                stroke.Thickness = 1 
                                
                                stroke.Parent = menu
                            end
                        end
                    end
                end
                dropdown.instances = instances 
            end
            
            dropdown.focused = false
            dropdown.openState = false
            
            
            dropdown.open = function(self) 
                self.openState = true 
                self:fireEvent('onOpen')
                
                
                local frame = self.instances.button
                if (self.focused) then
                    tween(frame, {BackgroundColor3 = theme.Button4}, 0.2, 1)
                else
                    tween(frame, {BackgroundColor3 = theme.Button2}, 0.2, 1)
                end
                tween(self.instances.icon, {
                    Rotation = 180,
                    ImageColor3 = theme.Primary
                }, 0.3, 1)
                
                
                tween(self.instances.menu, {
                    Size = UDim2.new(1, -6, 0, 68)
                }, 0.2, 1)
                tween(self.instances.controlFrame, {
                    Size = UDim2.new(1, 0, 0, 68+20)
                }, 0.2, 1)
            end
            dropdown.close = function(self) 
                self.openState = false
                self:fireEvent('onClose')
                
                local frame = self.instances.button
                if (self.focused) then
                    tween(frame, {BackgroundColor3 = theme.Button2}, 0.2, 1)
                else
                    tween(frame, {BackgroundColor3 = theme.Button1}, 0.2, 1)
                end
                tween(self.instances.icon, {
                    Rotation = 0,
                    ImageColor3 = theme.Secondary
                }, 0.3, 1)
                tween(self.instances.menu, {
                    Size = UDim2.new(1, -6, 0, 0)
                }, 0.2, 1)
                tween(self.instances.controlFrame, {
                    Size = UDim2.new(1, 0, 0, 20)
                }, 0.2, 1)
            end
            
            dropdown.isOpen = function(self) 
                return self.openState 
            end
            
            dropdown.setOptions = function(self, newOptions) 
                for i, opt in ipairs(self.options) do 
                    self:removeOption(opt)
                end
                for i, opt in ipairs(newOptions) do 
                    self:addOption(opt)
                end
            end
            dropdown.refresh = dropdown.setOptions
            
            dropdown.addOption = function(self) 
            
            end
            
            dropdown.removeOption = function(self) 
            
            end
            
            
            
            dropdown.click = function(self) 
                self.openState = not self.openState
                if (self.openState) then
                    self:open()
                else
                    self:close()
                end
                
                return self
            end
            dropdown.__hotkeyFunc = dropdown.click
            
            dropdown.signals = {
                clickSensor = {
                    MouseEnter = function(inst, self) 
                        self.focused = true
                        self:showTooltip()
                        
                        
                        local frame = self.instances.button
                        if (self.openState) then
                            tween(frame, {BackgroundColor3 = theme.Button4}, 0.2, 1)
                        else
                            tween(frame, {BackgroundColor3 = theme.Button2}, 0.2, 1)
                        end
                        tween(frame['#stroke'], {Color = theme.StrokeHover}, 0.2, 1)
                    end,
                    MouseLeave = function(inst, self) 
                        self.focused = false
                        self:hideTooltip()
                        
                        local frame = self.instances.button
                        if (self.openState) then
                            tween(frame, {BackgroundColor3 = theme.Button3}, 0.2, 1)
                        else
                            tween(frame, {BackgroundColor3 = theme.Button1}, 0.2, 1)
                        end
                        tween(frame['#stroke'], {Color = theme.Stroke}, 0.2, 1)
                    end,
                    MouseButton1Click = function(inst, self) 
                        self:click()
                    end
                }
            }
            
            dropdown.new = function(self) 
                
                local new = setmetatable({}, self)
                new.binds = {}
                new.options = {}
                
                local instances = {}
                instances.controlFrame = self.instances.controlFrame:Clone()
                instances.clickSensor = instances.controlFrame['#click-sensor']
                instances.button = instances.clickSensor['#button']
                instances.label = instances.button['#label']
                instances.icon = instances.button['#icon']
                instances.menu = instances.controlFrame['#menu']
                
                for i, signals in pairs(self.signals) do 
                    local inst = instances[i]
                    for signal, func in pairs(signals) do
                        local h = inst[signal]:Connect(function() 
                            func(inst, new)
                        end)
                    end
                end
                
                new.instances = instances
                return new
            end
            
            
            elemClasses.section.addDropdown = function(self, settings) 
                if (not typeof(settings) == 'table') then
                    return error('expected type table for settings', 2) 
                end
                
                local s_title = settings.text or 'nil'
                local s_options = settings.options or {}
                
                local new = dropdown:new()
                new.section = self 
                new.name = s_title
                table.insert(self.controls, new)
                
                new.instances.label.Text = s_title
                new.instances.controlFrame.Parent = self.instances.controlMenu
                return new
            end
        end
        -- add class
        elemClasses.dropdown = dropdown
    end    
    ]]

    -- SLIDER
    do 
        
        local slider = {} do 
            slider.__index = slider 
            setmetatable(slider, elemClasses.baseElement)
            
            slider.class = 'slider'
            
            do
                local instances = {} do 
                    local controlFrame = Instance.new('Frame')
                    controlFrame.BackgroundTransparency = 1
                    controlFrame.Name = '#control'
                    controlFrame.Size = UDim2.new(1, 0, 0, 20)
                    controlFrame.Visible = true
                    controlFrame.ZIndex = 34
                    
                    instances.controlFrame = controlFrame
                    
                    local sliderContainer = Instance.new('Frame') do 
                        sliderContainer.BackgroundColor3 = theme.Button1
                        sliderContainer.Position = UDim2.fromOffset(3, 2)
                        sliderContainer.Size = UDim2.new(1, -6, 0, 16)
                        sliderContainer.Visible = true
                        sliderContainer.ZIndex = 35
                        sliderContainer.Name = '#slider-container'
                        
                        sliderContainer.Parent = controlFrame
                        
                        local round = Instance.new('UICorner') do 
                            round.CornerRadius = UDim.new(0, rounding and 2 or 0)
                            round.Name = '#round'
                            
                            round.Parent = sliderContainer
                        end
                        
                        local stroke = Instance.new('UIStroke') do 
                            stroke.ApplyStrokeMode = 'Border'
                            stroke.Color = theme.Stroke
                            stroke.LineJoinMode = 'Round'
                            stroke.Name = '#stroke'
                            stroke.Thickness = 1 
                            
                            stroke.Parent = sliderContainer
                        end
                        local sliderFill = Instance.new('Frame') do 
                            sliderFill.Active = false
                            sliderFill.BackgroundColor3 = theme.Primary
                            sliderFill.BackgroundTransparency = 0.6
                            sliderFill.BorderSizePixel = 0
                            sliderFill.Name = '#slider-fill'
                            sliderFill.Size = UDim2.fromScale(1, 1)
                            sliderFill.Visible = true
                            sliderFill.ZIndex = 36
                            
                            sliderFill.Parent = sliderContainer
                            
                            local round = Instance.new('UICorner') do 
                                round.CornerRadius = UDim.new(0, rounding and 2 or 0)
                                round.Name = '#round'
                                
                                round.Parent = sliderFill
                            end
                            
                            local gradient = Instance.new('UIGradient') do 
                                gradient.Color = ColorSequence.new(
                                    theme.ControlGradient1,
                                    theme.ControlGradient2
                                )
                                gradient.Rotation = 90
                                gradient.Enabled = true
                                gradient.Name = '#gradient'
                                
                                gradient.Parent = sliderFill
                            end
                        end
                        
                        local inputBox = Instance.new('TextBox') do 
                            inputBox.Active = true 
                            inputBox.BackgroundColor3 = theme.Window1
                            inputBox.BackgroundTransparency = 0.1
                            inputBox.ClearTextOnFocus = true
                            inputBox.ClipsDescendants = true
                            inputBox.Font = 'SourceSans'
                            inputBox.Name = '#input-box'
                            inputBox.PlaceholderColor3 = theme.TextDim
                            inputBox.PlaceholderText = 'enter value'
                            inputBox.Size = UDim2.fromScale(1, 1)
                            inputBox.Text = 'enter value'
                            inputBox.TextColor3 = theme.TextPrimary
                            inputBox.TextSize = 14
                            inputBox.TextStrokeColor3 = theme.TextStroke
                            inputBox.TextStrokeTransparency = 0.8
                            inputBox.TextWrapped = true
                            inputBox.TextXAlignment = 'Center'
                            inputBox.TextYAlignment = 'Center'
                            inputBox.Visible = false
                            inputBox.ZIndex = 38
                            
                            inputBox.Parent = sliderContainer
                            
                            local round = Instance.new('UICorner') do 
                                round.CornerRadius = UDim.new(0, rounding and 2 or 0)
                                round.Name = '#round'
                                
                                round.Parent = inputBox
                            end
                            
                            local stroke = Instance.new('UIStroke') do 
                                stroke.ApplyStrokeMode = 'Border'
                                stroke.Color = theme.Stroke
                                stroke.LineJoinMode = 'Round'
                                stroke.Name = '#stroke'
                                stroke.Thickness = 1 
                                
                                stroke.Parent = inputBox
                            end
                        end
                    end
                    
                    local title = Instance.new('TextLabel') do 
                        title.BackgroundTransparency = 1
                        title.Font = 'SourceSans'
                        title.Name = '#label'
                        title.Size = UDim2.fromScale(1, 1)
                        title.Text = 'slider'
                        title.TextColor3 = theme.TextPrimary
                        title.TextSize = 14
                        title.TextStrokeColor3 = theme.TextStroke
                        title.TextStrokeTransparency = 0.8
                        title.TextTransparency = 0
                        title.TextWrapped = false
                        title.TextXAlignment = 'Left'
                        title.TextYAlignment = 'Center'
                        title.Visible = true
                        title.ZIndex = 37
                        
                        title.Parent = controlFrame
                        
                        local padding = Instance.new('UIPadding') do 
                            padding.PaddingLeft = UDim.new(0, 6)
                            
                            padding.Parent = title
                        end
                    end
                    
                    local val = Instance.new('TextLabel') do 
                        val.BackgroundTransparency = 1
                        val.Font = 'SourceSans'
                        val.Name = '#val'
                        val.Size = UDim2.fromScale(1, 1)
                        val.Text = '0'
                        val.TextColor3 = theme.TextPrimary
                        val.TextSize = 14
                        val.TextStrokeColor3 = theme.TextStroke
                        val.TextStrokeTransparency = 0.8
                        val.TextTransparency = 0
                        val.TextWrapped = false
                        val.TextXAlignment = 'Right'
                        val.TextYAlignment = 'Center'
                        val.Visible = true
                        val.ZIndex = 37
                        
                        val.Parent = controlFrame
                        
                        local padding = Instance.new('UIPadding') do 
                            padding.PaddingRight = UDim.new(0, 6)
                            
                            padding.Parent = val
                        end
                    end
                end
                slider.instances = instances 
            end
            
            slider.focused = false
            slider.step = 0
            slider.min = 0
            slider.max = 100
            slider.format = '%d'
            
            slider.signals = {
                container = {
                    MouseEnter = function(inst, win) 
                        win:showTooltip()
                        
                        tween(inst, {BackgroundColor3 = theme.Button2}, 0.2, 1)
                        tween(inst['#stroke'], {Color = theme.StrokeHover}, 0.2, 1)
                    end,
                    MouseLeave = function(inst, win) 
                        win:hideTooltip()
                        
                        tween(inst, {BackgroundColor3 = theme.Button1}, 0.2, 1)
                        tween(inst['#stroke'], {Color = theme.Stroke}, 0.2, 1)
                    end
                }
            }
            
            slider.new = function(self) 
                local new = setmetatable({}, self)
                new.binds = {}
                
                local instances = {}
                instances.controlFrame = self.instances.controlFrame:Clone()
                instances.label = instances.controlFrame['#label']
                instances.value = instances.controlFrame['#val']
                instances.container = instances.controlFrame['#slider-container']
                instances.fill = instances.container['#slider-fill']
                instances.input = instances.container['#input-box']
                
                for i, signals in pairs(self.signals) do 
                    local inst = instances[i]
                    for signal, func in pairs(signals) do
                        local h = inst[signal]:Connect(function() 
                            func(inst, new)
                        end)
                    end
                end
                
                -- slider logic
                do 
                    local slider = instances.container
                    local fill = instances.fill
                    local val = instances.value
                    local inputbox = instances.input
                    
                    local dcon
                    local acon
                    
                    local targetSize
                    
                    inputbox.FocusLost:Connect(function(enter, io) 
                        local tx = inputbox.Text
                        local n = tonumber(tx)
                        if (n) then
                            inputbox.Visible = false

                            local rangeValue = math.clamp(n, new.min, new.max)
                            local roundedValue = math.floor((rangeValue+new.step/2) / new.step) * new.step
                            local fillValue = (roundedValue - new.min) / (new.max - new.min)
                            tween(fill, {Size = UDim2.fromScale(fillValue, 1)}, 0.3, 1)
                            
                            val.Text = new.format:format(roundedValue)
                            new.value = roundedValue
                            new:fireEvent('onNewValue', roundedValue)
                        elseif (tx == '') then
                            inputbox.Visible = false
                        else
                            inputbox.Text = 'not a valid number'
                            wait(1)
                            inputbox:CaptureFocus()
                        end
                    end)
                    
                    slider.InputBegan:Connect(function(io) 
                        local inputName = io.UserInputType.Name
                        if (inputName == 'MouseButton1') then
                            local sliderPos = slider.AbsolutePosition
                            local sliderWidth = slider.AbsoluteSize.X
                            local startInput do 
                                local position = io.Position
                                startInput = Vector2.new(position.X, position.Y)
                            end
                            
                            local rangeValue = math.clamp(((startInput - sliderPos).X / sliderWidth), 0, 1)
                            local scaledValue = rangeValue * (new.max - new.min) + new.min
                            local roundedValue = math.floor((scaledValue+new.step/2) / new.step) * new.step
                            local fillValue = (roundedValue - new.min) / (new.max - new.min)
                            
                            targetSize = UDim2.fromScale(fillValue, 1)
                            val.Text = new.format:format(roundedValue)
                            new.value = roundedValue
                            new:fireEvent('onNewValue', roundedValue)
                            
                            acon = renderService.RenderStepped:Connect(function(dt) 
                                fill.Size = fill.Size:lerp(targetSize, 1 - 1e-12^dt)
                            end)
                            
                            dcon = inputService.InputChanged:Connect(function(io) 
                                if (io.UserInputType.Name == 'MouseMovement') then
                                    local curInput do 
                                        local position = io.Position
                                        curInput = Vector2.new(position.X, position.Y)
                                    end
                                    
                                    local rangeValue = math.clamp(((curInput - sliderPos).X / sliderWidth), 0, 1)
                                    local scaledValue = rangeValue * (new.max - new.min) + new.min
                                    local roundedValue = math.floor((scaledValue+new.step/2) / new.step) * new.step
                                    local fillValue = (roundedValue - new.min) / (new.max - new.min)
                                    
                                    targetSize = UDim2.fromScale(fillValue, 1)
                                    val.Text = new.format:format(roundedValue)
                                    new.value = roundedValue
                                    new:fireEvent('onNewValue', roundedValue)
                                end
                            end)
                        elseif (inputName == 'MouseButton2') then
                            inputbox.Visible = true
                            inputbox:CaptureFocus()
                        end
                    end)
                    
                    slider.InputEnded:Connect(function(io) 
                        if (io.UserInputType.Name == 'MouseButton1') then
                            dcon:Disconnect()
                            acon:Disconnect()
                            
                            tween(fill, {Size = targetSize}, 0.2, 1)
                        end
                    end)
                end
                
                new.instances = instances
                return new
            end
            
            slider.getValue = function(self) 
                return self.value 
            end
            slider.setValue = function(self, value) 
                self.value = value
                self:fireEvent('onNewValue', value)
                
                local rangeValue = math.clamp(value, self.min, self.max)
                local roundedValue = math.floor((rangeValue+self.step/2) / self.step) * self.step
                local fillValue = (roundedValue - self.min) / (self.max - self.min)
                
                tween(self.instances.fill, {Size = UDim2.fromScale(fillValue, 1)}, 0.3, 1)
                self.instances.value.Text = self.format:format(roundedValue)
            end
            
            elemClasses.section.addSlider = function(self, settings, callback) 
                if (not typeof(settings) == 'table') then
                    return error('expected type table for settings', 2) 
                end
                
                local s_title = settings.text or 'nil'
                local s_min = settings.min or 0
                local s_max = settings.max or 100
                local s_step = settings.step or 1
                local s_value = settings.value or s_min
                
                
                if (typeof(s_min) ~= 'number') then
                    return error('expected type \'number\' for setting \'min\'', 2)
                end
                if (typeof(s_max) ~= 'number') then
                    return error('expected type \'number\' for setting \'max\'', 2)
                end
                if (typeof(s_step) ~= 'number') then
                    return error('expected type \'number\' for setting \'step\'', 2)
                end
                if (typeof(s_value) ~= 'number') then
                    return error('expected type \'number\' for setting \'value\'', 2)
                end
                
                local slider = slider:new()
                slider.section = self 
                slider.name = s_title
                slider.min = s_min
                slider.max = s_max
                slider.step = s_step
                
                do 
                    if (s_step >= 1) then
                        slider.format = '%d'
                    elseif (s_step >= 0.1) then 
                        slider.format = '%.1f'
                    elseif (s_step >= 0.01) then 
                        slider.format = '%.2f'
                    elseif (s_step >= 0.001) then 
                        slider.format = '%.3f'
                    else 
                        slider.format = '%.4f'
                    end
                end
                
                
                table.insert(self.controls, slider)
                
                slider:setValue(s_value) 
                slider.instances.label.Text = s_title
                slider.instances.controlFrame.Parent = self.instances.controlMenu
                
                if (typeof(callback) == 'function') then
                    slider:bindToEvent('onNewValue', callback)
                end
                return slider
            end
        end
        
        elemClasses.slider = slider
    end
    
    -- COLOR PICKER
    do 
        
        local picker = {} do 
            picker.__index = picker 
            setmetatable(picker, elemClasses.baseElement)
            
            picker.class = 'picker'
            
            do
                local instances = {} do 
                    local controlFrame = Instance.new('Frame') do
                        controlFrame.BackgroundTransparency = 1
                        controlFrame.Name = '#control'
                        controlFrame.Size = UDim2.new(1, 0, 0, 20)
                        controlFrame.Visible = true
                        controlFrame.ZIndex = 34
                    end
                    instances.controlFrame = controlFrame

                    local clickRegion = Instance.new('TextButton') do 
                        clickRegion.BackgroundTransparency = 1
                        clickRegion.Name = '#click-region'
                        clickRegion.Size = UDim2.fromScale(1, 1)
                        clickRegion.Text = ''
                        clickRegion.TextTransparency = 1
                        clickRegion.ZIndex = 34
                        
                        clickRegion.Parent = controlFrame
                        
                        local label = Instance.new('TextLabel') do 
                            label.BackgroundTransparency = 1
                            label.Font = 'SourceSans'
                            label.Name = '#label'
                            label.RichText = true
                            label.Size = UDim2.fromScale(1, 1)
                            label.Text = 'picker'
                            label.TextColor3 = theme.TextPrimary
                            label.TextSize = 14
                            label.TextStrokeColor3 = theme.TextStroke
                            label.TextStrokeTransparency = 0.8
                            label.TextTransparency = 0
                            label.TextWrapped = false
                            label.TextXAlignment = 'Left'
                            label.TextYAlignment = 'Center'
                            label.Visible = true
                            label.ZIndex = 35
                            
                            label.Parent = clickRegion
                            
                            local padding = Instance.new('UIPadding') do 
                                padding.Name = '#padding'
                                padding.PaddingLeft = UDim.new(0, 6)
                                
                                padding.Parent = label
                            end
                        end
                        
                        local picker = Instance.new('Frame') do 
                            picker.Active = true
                            picker.AnchorPoint = Vector2.new(1, 0)
                            picker.BackgroundColor3 = theme.Button1
                            picker.Name = '#picker'
                            picker.Position = UDim2.new(1, -3, 0, 2)
                            picker.Size = UDim2.fromOffset(16, 16)
                            picker.Visible = true
                            picker.ZIndex = 35
                            
                            picker.Parent = clickRegion
                            
                            local round = Instance.new('UICorner') do 
                                round.CornerRadius = UDim.new(1, 0)
                                round.Name = '#round'
                                
                                round.Parent = picker
                            end
                            
                            local stroke = Instance.new('UIStroke') do 
                                stroke.ApplyStrokeMode = 'Border'
                                stroke.Color = theme.Stroke
                                stroke.LineJoinMode = 'Round'
                                stroke.Name = '#stroke'
                                stroke.Thickness = 1 
                                
                                stroke.Parent = picker
                            end
                            
                            local display = Instance.new('Frame') do 
                                display.Active = false
                                display.BorderSizePixel = 0
                                display.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                                display.Name = '#display'
                                display.Position = UDim2.fromOffset(2, 2)
                                display.Size = UDim2.fromOffset(12, 12)
                                display.Visible = true
                                display.ZIndex = 35 
                                
                                display.Parent = picker
                                
                                local gradient = Instance.new('UIGradient') do 
                                    gradient.Color = ColorSequence.new(
                                        theme.ControlGradient1,
                                        theme.ControlGradient2
                                    )
                                    gradient.Rotation = 90
                                    gradient.Enabled = true
                                    gradient.Name = '#gradient'
                                    
                                    gradient.Parent = display
                                end
                                
                                local round = Instance.new('UICorner') do 
                                    round.CornerRadius = UDim.new(1, 0)
                                    round.Name = '#round'
                                    
                                    round.Parent = display
                                end
                            end
                        end
                    end
                end
                picker.instances = instances 
            end
            
            picker.color = Color3.fromRGB(255, 255, 255)
            picker.hue = 0
            picker.sat = 0 
            picker.val = 1
            
            picker.chroma = false
            picker.chromaSpeed = 0.1
            
            picker.focused = false
            picker.pickerWindow = nil
            
            picker.openPrompt = function(self) 
                local window = elemClasses.pickerWindow:new()
                local mouseLoc = inputService:GetMouseLocation()
                local screenSize = guiService:GetScreenResolution()
                
                local new = Vector2.new(
                    math.clamp(mouseLoc.X, 50, screenSize.X - 350),
                    math.clamp(mouseLoc.Y, 50, screenSize.Y - 350)
                )
                
                window:setPosition(new)--inputService:GetMouseLocation())
                window.hue = self.hue
                window.sat = self.sat
                window.val = self.val
                
                window.linkedPicker = self
                window.instances.speedCursor.Position = UDim2.fromScale(0, 1 - self.chromaSpeed)
                window:displayHSV(true)
                window:setTitle(self.name)
                window:bindToEvent('newColor', function(color, HSV) 
                    self.color = color
                    self.hue = HSV[1]
                    self.sat = HSV[2]
                    self.val = HSV[3]
                    
                    self:fireEvent('onNewColor', color)
                    
                    self.instances.display.BackgroundColor3 = color
                end)
                window:bindToEvent('close', function() 
                    if (window.chromaCon) then 
                        window.chromaCon:Disconnect()
                    end
                    self.pickerWindow = nil
                    
                    if (self.chroma) then
                        if (self.chromaCon) then self.chromaCon:Disconnect() end 
                        self.chromaCon = renderService.RenderStepped:Connect(function(dt) 
                            dt *= self.chromaSpeed
                            
                            local hue = self.hue
                            hue += dt
                            hue = (hue > 1 and hue - 1) or hue
                            self.hue = hue 
                            self.color = Color3.fromHSV(hue, self.sat, self.val)
                            self.instances.display.BackgroundColor3 = self.color
                            self:fireEvent('onNewColor', self.color)
                        end)
                    end
                end)
                window:bindToEvent('chroma', function(t) 
                    self.chroma = t 
                    if (t) then
                        if (window.chromaCon) then window.chromaCon:Disconnect() end 
                        if (self.chromaCon) then self.chromaCon:Disconnect() end 
                        window.chromaCon = renderService.RenderStepped:Connect(function(dt) 
                            dt *= self.chromaSpeed
                            if (window.pickerMoving) then 
                                return 
                            end 
                            
                            local hue = window.hue
                            hue += dt
                            hue = (hue > 1 and hue - 1) or hue
                            window.hue = hue
                            window:displayHSV(true)
                        end)
                    else 
                        if (window.chromaCon) then window.chromaCon:Disconnect() end 
                        if (self.chromaCon) then self.chromaCon:Disconnect() end 
                    end
                end)
                if (self.chroma) then 
                    window:toggleChroma()
                end
                
                task.spawn(function()
                    local instances = window.instances 
                    
                    local main = instances.main 
                    
                    local offsetIndex = 50 * math.random(1,20)
                    main.ZIndex += offsetIndex
                    for i,v in ipairs(main:GetDescendants()) do 
                        if (v:IsA('GuiObject')) then 
                            v.ZIndex += offsetIndex
                        end
                    end
                    
                    
                    local titleBar = instances.titleBar
                    
                    main.Size = UDim2.fromOffset(300, 30)
                    tween(main, {Size = UDim2.fromOffset(300, 300)}, 0.5, 1)
                    
                    -- control anims
                    task.spawn(function() 
                        local icon = titleBar['#icon']
                        local bClose = titleBar['#button-close']
                        local bMin = titleBar['#button-min']
                        local title = titleBar['#title']
                        
                        local offset = UDim2.fromOffset(50, 0) 
                        
                        bClose.Position += offset
                        bMin.Position += offset
                        icon.Position -= offset
                        title.Position -= offset
                        tween(bClose, {Position = bClose.Position - offset}, 1, 1)
                        tween(bMin, {Position = bMin.Position - offset}, 1, 1)
                        tween(icon, {Position = icon.Position + offset}, 1, 1)
                        tween(title, {Position = title.Position + offset}, 1, 1)
                    end)
                    
                    -- titlebar fade
                    local fade = titleBar['#fade']
                    fade.BackgroundTransparency = 0
                    fade.Visible = true
                    tween(fade, {BackgroundTransparency = 1}, 2, 1).Completed:Wait()
                end)
                
                return window
            end
            
            picker.click = function(self) 
                self:fireEvent('onClick')
                
                local picker = self.instances.picker
                
                if (self.focused) then
                    picker.BackgroundColor3 = theme.Button4
                    tween(picker, {BackgroundColor3 = theme.Button2}, 1, 1)
                else
                    picker.BackgroundColor3 = theme.Button3
                    tween(picker, {BackgroundColor3 = theme.Button1}, 1, 1)
                end
                
                local pickerWindow = self.pickerWindow
                if (pickerWindow) then
                    self.pickerWindow:destroy()
                else
                    self.pickerWindow = self:openPrompt()
                end
                
                return picker
            end
            
            picker.__hotkeyFunc = picker.click 
            
            picker.getColor = function(self) 
                return self.color
            end
            
            picker.setColor = function(self, color) 
                if (typeof(color) ~= 'Color3') then
                    return error('expected Color3, got ' .. typeof(color), 2)
                end
                
                self.color = color
                local h,s,v = color:ToHSV()
                self.hue = h
                self.sat = s
                self.val = v 
                
                self.instances.display.BackgroundColor3 = self.color
            end
            
            
            picker.signals = {
                clickRegion = {
                    MouseEnter = function(inst, picker) 
                        picker.focused = true
                        picker:showTooltip()
                        
                        local inst = picker.instances.picker
                        tween(inst, {BackgroundColor3 = theme.Button2}, 0.2, 1)
                        tween(inst['#stroke'], {Color = theme.StrokeHover}, 0.2, 1)
                    end,
                    MouseLeave = function(inst, picker) 
                        picker.focused = false
                        picker:hideTooltip()
                        
                        local inst = picker.instances.picker
                        tween(inst, {BackgroundColor3 = theme.Button1}, 0.2, 1)
                        tween(inst['#stroke'], {Color = theme.Stroke}, 0.2, 1)
                    end,
                    MouseButton1Click = function(inst, picker) 
                        picker:click()
                    end
                }
            }
            
            picker.new = function(self) 
                
                local new = setmetatable({}, self)
                new.binds = {}
                
                local instances = {}
                instances.controlFrame = self.instances.controlFrame:Clone()
                instances.clickRegion = instances.controlFrame['#click-region']
                instances.picker = instances.clickRegion['#picker']
                instances.label = instances.clickRegion['#label']
                instances.display = instances.picker['#display']
                
                for i, signals in pairs(self.signals) do 
                    local inst = instances[i]
                    for signal, func in pairs(signals) do
                        local h = inst[signal]:Connect(function() 
                            func(inst, new)
                        end)
                    end
                end
                
                new.instances = instances
                return new
            end

            elemClasses.section.addColorPicker = function(self, settings, callback) 
                if (not typeof(settings) == 'table') then
                    return error('expected type table for settings', 2) 
                end
                
                local s_title = settings.text or 'nil'
                local s_color = settings.color or Color3.fromRGB(255, 255, 255)
                
                local picker = picker:new()
                picker.section = self 
                picker.name = s_title
                table.insert(self.controls, picker)
                
                picker.instances.label.Text = s_title
                picker:setColor(s_color)
                
                picker.instances.controlFrame.Parent = self.instances.controlMenu
                
                
                if (typeof(callback) == 'function') then
                    picker:bindToEvent('onNewColor', callback) 
                end
                return picker
            end
        end
        -- add class
        elemClasses.picker = picker
    end
    
    -- TEXTBOX
    do 
        
        local textbox = {} do 
            textbox.__index = textbox 
            setmetatable(textbox, elemClasses.baseElement)
            
            textbox.class = 'textbox'
            
            do
                local instances = {} do 
                    local controlFrame = Instance.new('Frame')
                    controlFrame.BackgroundTransparency = 1
                    controlFrame.BackgroundColor3 = Color3.new(1, 0, 1)
                    controlFrame.Name = '#control'
                    controlFrame.Size = UDim2.new(1, 0, 0, 20)
                    controlFrame.Visible = true
                    controlFrame.ZIndex = 34
                    
                    instances.controlFrame = controlFrame
                    
                    local inputBox = Instance.new('TextBox') do 
                        inputBox.Active = true 
                        inputBox.BackgroundColor3 = theme.Window1
                        inputBox.BackgroundTransparency = 0
                        inputBox.ClearTextOnFocus = true
                        inputBox.ClipsDescendants = true
                        inputBox.Font = 'SourceSans'
                        inputBox.Name = '#textbox'
                        inputBox.PlaceholderColor3 = theme.TextDim
                        inputBox.PlaceholderText = '...'
                        inputBox.Position = UDim2.fromOffset(3, 2)
                        inputBox.Size = UDim2.new(1, -6, 0, 16)
                        inputBox.Text = 'textbox'
                        inputBox.TextColor3 = theme.TextPrimary
                        inputBox.TextSize = 14
                        inputBox.TextStrokeColor3 = theme.TextStroke
                        inputBox.TextStrokeTransparency = 0.8
                        inputBox.TextWrapped = false
                        inputBox.TextXAlignment = 'Left'
                        inputBox.TextYAlignment = 'Center'
                        inputBox.Visible = true
                        inputBox.ZIndex = 35
                        
                        inputBox.Parent = controlFrame
                        
                        local round = Instance.new('UICorner') do 
                            round.CornerRadius = UDim.new(0, rounding and 2 or 0)
                            round.Name = '#round'
                            
                            round.Parent = inputBox
                        end
                    
                        local stroke = Instance.new('UIStroke') do 
                            stroke.ApplyStrokeMode = 'Border'
                            stroke.Color = theme.Stroke
                            stroke.LineJoinMode = 'Round'
                            stroke.Name = '#stroke'
                            stroke.Thickness = 1 
                            
                            stroke.Parent = inputBox
                        end
                        
                        local padding = Instance.new('UIPadding') do 
                            padding.Name = '#padding'
                            padding.PaddingLeft = UDim.new(0, 4)
                            
                            padding.Parent = inputBox
                        end
                        --[[ nope :money_mouth:
                        
                        local autoFill = Instance.new('TextLabel') do 
                            autoFill.BackgroundTransparency = 1
                            autoFill.Font = 'SourceSans'
                            autoFill.Name = '#autofill'
                            autoFill.Size = UDim2.fromScale(1, 1)
                            autoFill.Text = 'autofill'
                            autoFill.TextColor3 = theme.TextDim
                            autoFill.TextSize = 14
                            autoFill.TextTransparency = 0.3
                            autoFill.TextStrokeColor3 = theme.TextStroke
                            autoFill.TextStrokeTransparency = 0.8
                            autoFill.TextWrapped = false
                            autoFill.TextXAlignment = 'Left'
                            autoFill.TextYAlignment = 'Center'
                            autoFill.Visible = true
                            autoFill.ZIndex = 35 
                            
                            autoFill.Parent = inputBox
                        end]]
                    end
                end
                textbox.instances = instances 
            end
            
            textbox.hovering = false
            textbox.focused = false
            
            textbox.signals = {
                controlFrame = {
                    MouseEnter = function(inst, obj) 
                        obj.hovering = true
                        obj:showTooltip()
                        
                        local boxInst = obj.instances.textBox
                        if (obj.focused) then
                            tween(boxInst, {BackgroundColor3 = theme.Button4}, 0.2, 1)
                        else
                            tween(boxInst, {BackgroundColor3 = theme.Button2}, 0.2, 1)
                        end
                        tween(boxInst['#stroke'], {Color = theme.StrokeHover}, 0.2, 1)
                    end,
                    MouseLeave = function(inst, obj) 
                        obj.hovering = false
                        obj:hideTooltip()
                        
                        
                        local boxInst = obj.instances.textBox
                        if (obj.focused) then
                            tween(boxInst, {BackgroundColor3 = theme.Button3}, 0.2, 1)
                        else
                            tween(boxInst, {BackgroundColor3 = theme.Button1}, 0.2, 1)
                        end
                        tween(boxInst['#stroke'], {Color = theme.Stroke}, 0.2, 1)
                    end,
                },
                textBox = {
                    Focused = function(inst, obj) 
                        obj.focused = true
                        --obj:showHint()
                        obj.textUpdCn = inst:GetPropertyChangedSignal('Text'):Connect(function() 
                            obj:fireEvent('onTextChange', inst.Text)
                            obj:fireEvent('__txtUpdInternal', inst.Text)
                        end)
                        
                        if (obj.hovering) then
                            tween(inst, {BackgroundColor3 = theme.Button4, TextColor3 = theme.Primary}, 0.2, 1)
                        else
                            tween(inst, {BackgroundColor3 = theme.Button3, TextColor3 = theme.Primary}, 0.2, 1)
                        end
                        
                        obj:fireEvent('onFocus')
                    end,
                    FocusLost = function(inst, obj) 
                        obj.focused = false
                        --obj:hideHint()
                        if (obj.textUpdCn) then 
                            obj.textUpdCn:Disconnect()
                        end
                        
                        if (obj.hovering) then
                            tween(inst, {BackgroundColor3 = theme.Button2, TextColor3 = theme.TextPrimary}, 0.2, 1)
                        else
                            tween(inst, {BackgroundColor3 = theme.Button1, TextColor3 = theme.TextPrimary}, 0.2, 1)
                        end
                        
                        
                        local inputText = inst.Text
                        inst.Text = obj.name
                        
                        obj:fireEvent('onFocusLost', inputText)
                    end,
                    
                }
            }
            
            textbox.getText = function(self) 
                return self.instances.textBox.Text
            end
            textbox.setText = function(self, newText) 
                self.instances.textBox.Text = tostring(newText)
                obj:fireEvent('onTextChange', newText)
            end
            
            
            -- hints temporarily disabled
            --[[
            textbox.setHints = function(self, hintArray) 
                local hintTable = hint.hints
                local hintTemplate = hint.instances.hintTemplate
                
                for _, hint in ipairs(hintTable) do 
                    hint[2]:Destroy()
                end
                table.clear(hint.hints)

                for _, suggestion in ipairs(hintArray) do 
                    suggestion = tostring(suggestion)
                    local thisHint = hintTemplate:Clone()
                    
                    thisHint.Name = suggestion:lower()
                    thisHint.Text = suggestion
                    thisHint.Visible = true
                    thisHint.Parent = hintTemplate.Parent
                    
                    table.insert(hintTable, {
                        suggestion,
                        thisHint
                    })
                end
                
                table.sort(hintTable, function(hint1, hint2) 
                    return hint1[1]:lower() < hint2[1]:lower()
                end)
                
                hint.hintCount = #hintTable
                
                hint.selection = math.min(hint.selection, hint.hintCount)
                tween(hint.instances.optionHighlight, {Position = UDim2.fromOffset(0, ((hint.selection - 1) % 6) * 16)}, 0.2, 1)
                                
                hint.instances.main.Size = UDim2.fromOffset(self.instances.textBox.AbsoluteSize.X, math.min((hint.hintCount * 16) + 4, (16*6)+4))
                return self
            end
            textbox.showHint = function(self) 
                if (hint.handle == nil) then 
                    hint.showing = true
                    hint.handle = self
                    
                    -- localize some instances that are used a ton
                    local textBox = self.instances.textBox
                    local hintRoot = hint.instances.main
                    local hintHighlight = hint.instances.optionHighlight
                    local hintMenu = hintRoot['#menu']['#container']
                    
                    -- position and display hint
                    do 
                        local controlFrame = self.instances.controlFrame
                        
                        hintRoot.Size = UDim2.fromOffset(textBox.AbsoluteSize.X, math.min((hint.hintCount * 16) + 4, (16*60)+4))

                        local newPos = controlFrame.AbsolutePosition + Vector2.new(4, 26)
                        hintRoot.Position = UDim2.fromOffset(newPos.X, newPos.Y)

                        hintRoot.Visible = true
                    end
                    
                    -- function to update suggestions
                    local function update(tx) 
                        local match = '^' .. tx
                        local i = 0 
                        
                        -- go through hints
                        -- if it doesnt start with the text then hide it
                        -- otherwise show it and increase visible hint counter
                        for _, hint in ipairs(hint.hints) do 
                            local inst = hint[2]
                            if (inst.Text:match(match)) then 
                                inst.Visible = true
                                i += 1
                            else
                                inst.Visible = false
                            end
                        end
                        
                        
                        if (i == 0) then
                            -- no possible selections
                            hintRoot.Visible = false -- hide the hint frame
                            hint.selection = 1 -- reset selection to top
                        else
                            -- there are a few selections
                            hintRoot.Visible = true
                            hint.selection = math.clamp(hint.selection, 1, i)
                        end
                        
                        -- move highlight to selection
                        do
                            local fixedPos = hint.selection - 1 -- start selection at 0 instead of 1 like arrays
                            tween(hintHighlight, {Position = UDim2.fromOffset(0, fixedPos * 16)}, 0.2, 1)
                        end
                        -- set size
                        do
                            local maxHeight = (6 * 16) + 4 -- normally (5*16)+4
                            local thisHeight = (i * 16) + 4 -- ( i (amount of hints) * 16 (hint size) ) + 4 (padding)
                            hintRoot.Size = UDim2.fromOffset(textBox.AbsoluteSize.X, math.min(thisHeight, maxHeight)) -- limit size to max height
                        end
                        
                        hint.hintCount = i
                    end
                    
                    
                    -- first update
                    update(textBox.Text)
                    
                    
                    -- fix issues with typing and filtering while showing stuff, then work on adding paginations (or just not doing it at all lol)
                    
                    
                    -- do suggestion updates on text update
                    self:bindToEvent('__txtUpdInternal', update)
                    
                    -- handle menu inputs
                    hint.inputCn = inputService.InputBegan:Connect(function(io) 
                        local kc = io.KeyCode
                        if (kc.Name == 'Tab') then
                            -- this is a lil scuffed but i dont want to have to rewrite even more shit
                            -- just so this is a tiny bit better
                            local i = 0 
                            local finalHint
                            
                            -- go through all hints
                            -- if one is valid increase index count
                            -- if selection is index then set it
                            
                            for idx, h in ipairs(hint.hints) do 
                                if (h[2].Visible) then
                                    i = i + 1
                                    if (i == hint.selection) then
                                        finalHint = h[1]
                                    end
                                end
                            end
                            
                            if (finalHint) then 
                                -- set text, release textbox finishing everything
                                textBox.Text = finalHint
                                textBox:ReleaseFocus()
                            end
                            
                        elseif (kc.Name == 'Up') then
                            -- if up then move cursor up
                            
                            -- remove 1 from selection, and clamp that to 0
                            hint.selection = math.min(hint.selection - 1, 0)
                            
                            -- take fixed selection to get the cursor index, and mod so it can paginate
                            local cursorIndex = ((hint.selection - 1) % 6)
                            -- multiply cursorIndex by 16 to get the real Y position
                            tween(hintHighlight, {Position = UDim2.fromOffset(0, cursorIndex * 16)}, 0.2, 1)
                            
                            ui.notify({
                                message = hint.selection .. ', ' .. cursorIndex
                            })
                            if (cursorIndex == 5 and hint.selection > 1) then
                                local canvasPos = hintMenu.CanvasPosition
                                tween(hintMenu, {CanvasPosition = canvasPos - Vector2.new(0, 16 * 6)}, 0.2, 1) -- add 1 menu size
                                
                                -- work on pagination
                                -- make sure that the menu scrolls as the tab goes
                            end
                        elseif (kc.Name == 'Down') then
                            -- if down then move cursor down
                            
                            -- add 1 to selection, and clamp that to the hint count
                            hint.selection = math.min(hint.selection + 1, hint.hintCount)
                            
                            -- take fixed selection to get the cursor index, and mod so it can paginate
                            local cursorIndex = ((hint.selection - 1) % 6)
                            -- multiply cursorIndex by 16 to get the real Y position
                            tween(hintHighlight, {Position = UDim2.fromOffset(0, cursorIndex * 16)}, 0.2, 1)
                            
                            
                            
                            if (cursorIndex == 0) then
                                local canvasPos = hintMenu.CanvasPosition
                                tween(hintMenu, {CanvasPosition = canvasPos + Vector2.new(0, 16 * 6)}, 0.2, 1) -- add 1 menu size
                                
                                -- work on pagination
                                -- make sure that the menu scrolls as the tab goes
                            end
                            
                            
                            --hint.selection = math.min(hint.selection + 1, math.min(hint.hintCount, 5))
                            --tween(hintHighlight, {Position = UDim2.fromOffset(0, (hint.selection-1) * 16)}, 0.2, 1)
                        end
                    end)
                    
                    -- set selection to 1 :money:
                    hint.selection = 1 
                end
                return self
            end
            textbox.hideHint = function(self) 
                if (hint.handle == self) then 
                    hint.showing = false
                    hint.handle = nil
                    
                    hint.inputCn:Disconnect()
                    self:bindToEvent('__txtUpdInternal', nil)
                    
                    hint.instances.main.Visible = false
                end
                return self
            end]]
            
            textbox.new = function(self) 
                
                local new = setmetatable({}, self)
                new.binds = {}
                
                local instances = {}
                instances.controlFrame = self.instances.controlFrame:Clone()
                instances.textBox = instances.controlFrame['#textbox']
                
                for i, signals in pairs(self.signals) do 
                    local inst = instances[i]
                    for signal, func in pairs(signals) do
                        local h = inst[signal]:Connect(function(...) 
                            func(inst, new, ...)
                        end)
                    end
                end
                
                new.instances = instances
                return new
            end
            
            
            elemClasses.section.addTextbox = function(self, settings, callback) 
                if (not typeof(settings) == 'table') then
                    return error('expected type table for settings', 2) 
                end
                
                local s_title = settings.text or 'nil'
                
                local new = textbox:new()

                new.section = self 
                new.name = s_title
                table.insert(self.controls, new)
                
                new.instances.textBox.Text = s_title
                new.instances.controlFrame.Parent = self.instances.controlMenu
                
                if (typeof(callback) == 'function') then
                    new:bindToEvent('onTextChange', callback)
                end
                return new
            end
        end
        -- add class
        elemClasses.textbox = textbox
    end    
    
    -- NOTIF
    do 
        local notif = {} do 
            notif.__index = notif
            setmetatable(notif, elemClasses.baseElement) 
            
            notif.class = 'notif'
            
            do 
                local instances = {} do                     
                    local main = Instance.new('Frame') do 
                        main.AnchorPoint = Vector2.new(1, 1)
                        main.BackgroundColor3 = theme.Window2
                        main.BackgroundTransparency = 0
                        main.BorderSizePixel = 0
                        main.LayoutOrder = 50
                        main.Name = '#notif-frame'
                        main.Size = UDim2.fromOffset(175, 100)
                        main.Visible = true
                        main.ZIndex = 3000
                    end
                    
                    local scale = Instance.new('UIScale') do 
                        scale.Scale = 1 
                        scale.Name = '#scale'
                        scale.Parent = main
                    end
                    
                    local backgroundFrame = Instance.new('Frame') do 
                        backgroundFrame.BackgroundTransparency = 0 
                        backgroundFrame.BackgroundColor3 = theme.Window2
                        backgroundFrame.BorderSizePixel = 0 
                        backgroundFrame.Name = '#background'
                        backgroundFrame.Size = UDim2.fromScale(1, 1)
                        backgroundFrame.Visible = true 
                        backgroundFrame.ZIndex = 2999
                        
                        backgroundFrame.Parent = trim
                    end
                    local stroke = Instance.new('UIStroke') do 
                        stroke.ApplyStrokeMode = 'Border'
                        stroke.Color = theme.Stroke
                        stroke.LineJoinMode = 'Round'
                        stroke.Thickness = 1 
                        stroke.Name = '#stroke'
                        
                        stroke.Parent = main
                    end
                    local shadow = Instance.new('ImageLabel') do 
                        shadow.AnchorPoint = Vector2.new(0.5, 0.5)
                        shadow.BackgroundTransparency = 1
                        shadow.BorderSizePixel = 0 
                        shadow.Image = 'rbxassetid://7331400934'
                        shadow.ImageColor3 = Color3.fromRGB(0, 0, 5)
                        shadow.Name = '#shadow'
                        shadow.Position = UDim2.fromScale(0.5, 0.5)
                        shadow.ScaleType = 'Slice'
                        shadow.Size = UDim2.new(1, 50, 1, 50)
                        shadow.SliceCenter = Rect.new(40, 40, 260, 260)
                        shadow.SliceScale = 1
                        shadow.ZIndex = 2999
                        
                        shadow.Parent = main
                    end
    
                    local trim = Instance.new('Frame') do 
                        trim.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                        trim.BackgroundTransparency = 0
                        trim.BorderSizePixel = 0 
                        trim.Name = '#trim'
                        trim.Position = UDim2.fromOffset(0, -1)
                        trim.Size = UDim2.new(1, 0, 0, 1)
                        trim.ZIndex = 3005
                        
                        trim.Parent = main
                        
                        local gradient = Instance.new('UIGradient') do 
                            gradient.Color = ColorSequence.new(
                                theme.Primary, 
                                theme.Secondary
                            )
                            gradient.Enabled = true
                            gradient.Name = '#gradient'
                            gradient.Rotation = 0
                            
                            gradient.Parent = trim
                        end
                    end
    
                    local titleBar = Instance.new('Frame') do 
                        titleBar.BackgroundColor3 = theme.Window1
                        titleBar.BackgroundTransparency = 0
                        titleBar.BorderColor3 = theme.Inset1
                        titleBar.BorderMode = 'Inset'
                        titleBar.BorderSizePixel = 1
                        titleBar.ClipsDescendants = true
                        titleBar.Name = '#title-bar'
                        titleBar.Size = UDim2.new(1, 0, 0, 26)
                        titleBar.ZIndex = 3001
                        
                        titleBar.Parent = main 
                        
                        local stroke = Instance.new('UIStroke') do 
                            stroke.ApplyStrokeMode = 'Border'
                            stroke.Color = theme.Stroke
                            stroke.LineJoinMode = 'Round'
                            stroke.Thickness = 1 
                            stroke.Name = '#stroke'
                            
                            stroke.Parent = titleBar
                        end
                        
                        local fade = Instance.new('Frame') do 
                            fade.BackgroundColor3 = theme.Window1
                            fade.BackgroundTransparency = 1
                            fade.BorderColor3 = theme.Inset1
                            fade.BorderMode = 'Inset'
                            fade.BorderSizePixel = 1
                            fade.Name = '#fade'
                            fade.Size = UDim2.new(1, 4, 1, 4)
                            fade.Position = UDim2.fromOffset(-2, -2)
                            fade.Visible = false
                            fade.ZIndex = 3009
                            
                            fade.Parent = titleBar
                        end
                        
                        
                        local icon = Instance.new('ImageLabel') do 
                            icon.BackgroundTransparency = 1
                            icon.BorderSizePixel = 0
                            icon.Image = 'rbxassetid://9865915364'
                            icon.ImageColor3 = theme.Primary
                            icon.ImageTransparency = 0
                            icon.Name = '#icon'
                            icon.Position = UDim2.fromOffset(2, 2)
                            icon.Size = UDim2.fromOffset(22, 22)
                            icon.Visible = true
                            icon.ZIndex = 3002
                            
                            icon.Parent = titleBar
                        end
                        
                        local title = Instance.new('TextLabel') do 
                            title.BackgroundTransparency = 1
                            title.BorderSizePixel = 0
                            title.Font = 'SourceSans'
                            title.Name = '#title'
                            title.Position = UDim2.fromOffset(24, 0)
                            title.RichText = true
                            title.Size = UDim2.new(1, -22, 1, 0)
                            title.Text = 'notification'
                            title.TextColor3 = theme.TextPrimary
                            title.TextScaled = false
                            title.TextSize = 17
                            title.TextStrokeColor3 = theme.TextStroke
                            title.TextStrokeTransparency = 0.8 -- tstroke 
                            title.TextTransparency = 0
                            title.TextXAlignment = 'Left'
                            title.TextYAlignment = 'Center'
                            title.Visible = true
                            title.ZIndex = 3002 
                            
                            title.Parent = titleBar
                            
                            local padding = Instance.new('UIPadding') do 
                                padding.PaddingLeft = UDim.new(0, 4)
                                padding.Name = '#padding'
                                
                                padding.Parent = title
                            end
                        end
                    end
    
                    local region = Instance.new('Frame') do 
                        region.BackgroundColor3 = theme.Window2
                        region.BackgroundTransparency = 0
                        region.BorderColor3 = theme.Inset2
                        region.BorderMode = 'Inset'
                        region.BorderSizePixel = 1
                        region.ClipsDescendants = true 
                        region.Name = '#region'
                        region.Position = UDim2.fromOffset(0, 27)
                        region.Size = UDim2.new(1, 0, 1, -27)
                        region.Visible = true
                        region.ZIndex = 3001
                        
                        region.Parent = main
                        
                        local desc = Instance.new('TextLabel') do 
                            desc.BackgroundTransparency = 1
                            desc.BorderSizePixel = 0
                            desc.Font = 'SourceSans'
                            desc.Name = '#desc'
                            desc.RichText = true
                            desc.Size = UDim2.fromScale(1, 1)
                            desc.Text = 'notification'
                            desc.TextColor3 = theme.TextPrimary
                            desc.TextScaled = false
                            desc.TextSize = 14
                            desc.TextStrokeColor3 = theme.TextStroke
                            desc.TextStrokeTransparency = 0.8 -- tstroke 
                            desc.TextTransparency = 0
                            desc.TextWrapped = true
                            desc.TextXAlignment = 'Left'
                            desc.TextYAlignment = 'Top'
                            desc.Visible = true
                            desc.ZIndex = 3002 
                            
                            desc.Parent = region
                            
                            local padding = Instance.new('UIPadding') do 
                                padding.PaddingLeft = UDim.new(0, 6)
                                padding.PaddingTop = UDim.new(0, 6)
                                padding.Name = '#padding'
                                
                                padding.Parent = desc
                            end
                        end
                    end
                    instances.main = main
                end
                notif.instances = instances 
            end
            
            notif.destroy = function(self)                 
                local main = self.instances.main
                task.spawn(function()
                    local animCon
                    
                    task.spawn(function() 
                        local backgroundTransparency = {}
                        local imageTransparency = {}
                        local transparency = {}
                        local textTransparency = {}
                        
                        local s = {
                            Frame = {backgroundTransparency}, 
                            ImageButton = {backgroundTransparency, imageTransparency},
                            ImageLabel = {backgroundTransparency, imageTransparency},
                            TextButton = {backgroundTransparency, textTransparency},
                            TextLabel = {backgroundTransparency, textTransparency},
                            UIStroke = {transparency},
                        }
                        local d = main:GetDescendants()
                        table.insert(d, main)
                        
                        for i, v in ipairs(d) do 
                            local a = s[v.ClassName]
                            if (a) then
                                for i = 1, #a do 
                                    table.insert(a[i], v)
                                end
                            end
                        end
                        
                        for i,v in ipairs(transparency) do
                            v.Transparency = 1
                            v:Destroy()
                        end
                        
                        transparency = nil
                        scrollBarImageTransparency = nil
                        animCon = renderService.RenderStepped:Connect(function(dt) 
                            dt *= 8
                            for i= 1, #backgroundTransparency do 
                                backgroundTransparency[i].BackgroundTransparency += dt
                            end
                            for i= 1, #imageTransparency do 
                                imageTransparency[i].ImageTransparency += dt
                            end
                            for i= 1, #textTransparency do 
                                textTransparency[i].TextTransparency += dt
                            end
                        end)
                    end)
                    tween(main, {Size = UDim2.fromOffset(main.AbsoluteSize.X, 0)}, 0.5, 1).Completed:Wait()
                    animCon:Disconnect()
                    main:Destroy()
                end)

                return self 
            end
            notif.setTitle = function(self, title) 
                self.instances.title.Text = tostring(title)
                return self 
            end
            notif.setDesc = function(self, text) 
                local desc = self.instances.desc
                local main = self.instances.main
                
                desc.Text = tostring(text)
                
                local c = 0
                while (true) do 
                    c += 1 
                    if (c > 31) then
                        break
                    end
                    local _ = desc.TextFits -- same shitty strat as tooltips
                    if (desc.TextFits == true) then break end 
                    main.Size += UDim2.fromOffset(0, 20)
                end
                
                return self 
            end
            notif.new = function(self) 
                
                local new = setmetatable({}, self)
                new.binds = {}
                
                local instances = {}
                instances.main = self.instances.main:Clone()
                instances.title = instances.main['#title-bar']['#title']
                instances.desc = instances.main['#region']['#desc']

                -- finalize stuff
                instances.main.Parent = uiScreen['#notif-container']
                new.instances = instances
                return new
            end
        end
        elemClasses.notif = notif
    end
        
    -- HOTKEY
    do 
        local hotkey = {} do 
            hotkey.__index = hotkey
            setmetatable(hotkey, elemClasses.baseElement)
            
            hotkey.class = 'hotkey'
            
            do
                local instances = {} do 
                    local controlFrame = Instance.new('Frame')
                    controlFrame.BackgroundTransparency = 1
                    controlFrame.Name = '#control'
                    controlFrame.Size = UDim2.new(1, 0, 0, 20)
                    controlFrame.Visible = true
                    controlFrame.ZIndex = 34
                    
                    instances.controlFrame = controlFrame

                    local back = Instance.new('TextButton') do 
                        back.BackgroundTransparency = 1
                        back.Name = '#back'
                        back.Size = UDim2.fromScale(1, 1)
                        back.Text = ''
                        back.TextTransparency = 1
                        back.ZIndex = 34
                        
                        back.Parent = controlFrame
                        
                        local label = Instance.new('TextLabel') do 
                            label.BackgroundTransparency = 1
                            label.Font = 'SourceSans'
                            label.Name = '#label'
                            label.RichText = true
                            label.Size = UDim2.fromScale(1, 1)
                            label.Text = 'button'
                            label.TextColor3 = theme.TextPrimary
                            label.TextSize = 14
                            label.TextStrokeColor3 = theme.TextStroke
                            label.TextStrokeTransparency = 0.8
                            label.TextTransparency = 0
                            label.TextWrapped = false
                            label.TextXAlignment = 'Left'
                            label.TextYAlignment = 'Center'
                            label.Visible = true
                            label.ZIndex = 35
                            
                            label.Parent = back
                            
                            local padding = Instance.new('UIPadding') do 
                                padding.Name = '#padding'
                                padding.PaddingLeft = UDim.new(0, 6)
                                
                                padding.Parent = label
                            end
                        end
                        
                        local hotkey = Instance.new('TextLabel') do 
                            hotkey.Active = false
                            hotkey.AnchorPoint = Vector2.new(1, 0)
                            hotkey.BackgroundTransparency = 1 
                            hotkey.Font = 'SourceSans'
                            hotkey.Name = '#hotkey'
                            hotkey.Position = UDim2.new(1, -3, 0, 2)
                            hotkey.Size = UDim2.fromOffset(16, 16)
                            hotkey.Text = '[None]'
                            hotkey.TextColor3 = theme.TextDim
                            hotkey.TextScaled = false
                            hotkey.TextSize = 14
                            hotkey.TextStrokeColor3 = theme.TextStroke
                            hotkey.TextStrokeTransparency = 0.8
                            hotkey.TextWrapped = false 
                            hotkey.TextXAlignment = 'Right'
                            hotkey.TextYAlignment = 'Center'
                            hotkey.Visible = true
                            hotkey.ZIndex = 35
                            
                            hotkey.Parent = back
                        end
                    end
                end
                hotkey.instances = instances 
            end
            
            hotkey.set = nil
            hotkey.hotkey = nil 
            hotkey.focused = false
            hotkey.inputCon = nil 
            hotkey.click = function(self) 
                if (self.inputCon) then return end 
                
                local display = self.instances.hotkey 
                
                tween(display, {TextColor3 = theme.Primary}, 0.3, 1)
                self.inputCon = inputService.InputBegan:Connect(function(io, gpe) 
                    local kc = io.KeyCode.Name
                    if (kc == 'Unknown' or kc == 'Escape') then 
                        self.hotkey = nil
                        display.Text = '[None]'
                        self.inputCon:Disconnect()
                        self.inputCon = nil 
                        
                        if (self.focused) then 
                            tween(display, {TextColor3 = theme.TextPrimary}, 0.3, 1)
                        else
                            tween(display, {TextColor3 = theme.TextDim}, 0.3, 1)
                        end
                    else 
                        self.hotkey = io.KeyCode
                        self.set = time()
                        display.Text = ('[%s]'):format(kc)
                        self.inputCon:Disconnect()
                        self.inputCon = nil 
                        
                        if (self.focused) then 
                            tween(display, {TextColor3 = theme.TextPrimary}, 0.3, 1)
                        else
                            tween(display, {TextColor3 = theme.TextDim}, 0.3, 1)
                        end
                    end
                end)
                
                return self
            end
            hotkey.__hotkeyFunc = hotkey.click
            
            hotkey.signals = {
                back = {
                    MouseEnter = function(inst, self) 
                        self.focused = true
                        self:showTooltip()

                        if (self.inputCon) then 
                            tween(self.instances.hotkey, {TextColor3 = theme.Primary}, 0.2, 1)
                        else 
                            tween(self.instances.hotkey, {TextColor3 = theme.TextPrimary}, 0.2, 1)
                        end
                    end,
                    MouseLeave = function(inst, self) 
                        self.focused = false
                        self:hideTooltip()
                        
                        if (self.inputCon) then 
                            tween(self.instances.hotkey, {TextColor3 = theme.Primary}, 0.2, 1)
                        else
                            tween(self.instances.hotkey, {TextColor3 = theme.TextDim}, 0.2, 1)
                        end
                    end,
                    MouseButton1Click = function(inst, self) 
                        self:click()
                    end
                }
            }
            
            hotkey.new = function(self) 
                
                local new = setmetatable({}, self)
                new.binds = {}
                
                local instances = {}
                instances.controlFrame = self.instances.controlFrame:Clone()
                instances.back = instances.controlFrame['#back']
                instances.label = instances.back['#label']
                instances.hotkey = instances.back['#hotkey']
                
                for i, signals in pairs(self.signals) do 
                    local inst = instances[i]
                    for signal, func in pairs(signals) do
                        local h = inst[signal]:Connect(function() 
                            func(inst, new)
                        end)
                    end
                end
                
                table.insert(ui.hotkeys, new)
                
                
                new.instances = instances
                return new
            end
            
            --[[
            hotkey.fireHotkey = function(self, ...) 
                return self:__hotkeyFunc()
            end]]
            
            hotkey.linkToControl = function(self, control) 
                if (control and control.__hotkeyFunc == nil) then
                    return error('couldn\'t find control function', 2)
                elseif (not control) then 
                    control = nil 
                end
                
                self.linkedControl = control 
                return self
            end
            
            hotkey.setHotkey = function(self, hotkey) 
                if (hotkey) then 
                    if (typeof(hotkey) == 'EnumItem') then
                        if (hotkey.EnumType ~= Enum.KeyCode) then
                            return error('expected EnumItem of EnumType KeyCode for hotkey', 2) 
                        end
                    else
                        if (Enum.KeyCode[hotkey]) then
                            hotkey = Enum.KeyCode[hotkey]
                        else
                            return error('expected valid Enum.KeyCode Name, or Enum.KeyCode EnumItem', 2)  
                        end
                    end
                    
                    self.hotkey = hotkey 
                    self.instances.hotkey.Text = ('[%s]'):format(hotkey.Name)
                else
                    self.hotkey = nil
                    self.instances.hotkey.Text = '[None]'
                end
            end
            hotkey.getHotkey = function(self) return self.hotkey end 
            
            elemClasses.section.addHotkey = function(self, settings) 
                if (not typeof(settings) == 'table') then
                    return error('expected type table for settings', 2) 
                end
                
                local s_title = settings.text or 'nil'
                local s_bind = settings.bind or nil
                
                if (s_bind) then 
                    if (typeof(s_bind) == 'EnumItem') then
                        if (s_bind.EnumType ~= Enum.KeyCode) then
                            return error('expected EnumItem of EnumType KeyCode for settings.bind', 2) 
                        end
                    else
                        if (Enum.KeyCode[s_bind]) then
                            s_bind = Enum.KeyCode[s_bind]
                        else
                            return error('expected valid Enum.KeyCode Name, or Enum.KeyCode EnumItem', 2)  
                        end
                    end
                end
                
                local hotkey = hotkey:new()
                hotkey.section = self 
                hotkey.name = s_title
                table.insert(self.controls, hotkey)
                
                hotkey.instances.label.Text = s_title
                if (s_bind) then 
                    hotkey:setBind(s_bind)
                end
                hotkey.instances.controlFrame.Parent = self.instances.controlMenu
                return hotkey
            end
        end
        elemClasses.hotkey = hotkey
    end    
end

-- Dollarware enhancements. Original templates stay authoritative for appearance.
do
    local E = {loading = false, sequence = 0}
    local activeDrag
    local http = game:GetService('HttpService')
    local options = type(args[1]) == 'table' and args[1] or {}
    ui.controls, ui.windows, ui.hotkeys, ui.notifs, ui.binds = {}, {}, {}, {}, {}
    ui.alive, ui.unsaved, ui.profile = true, false, 'default'
    ui.version = '2.0.0'
    E.root = {alive = true, children = {}, connections = {}, tasks = {}, tweens = {}, instances = {}}
    function E.scope(parent)
        local s = {alive = true, children = {}, connections = {}, tasks = {}, tweens = {}, instances = {}, parent = parent or E.root}
        s.parent.children[s] = true
        return s
    end
    function E.clean(s)
        if not s or not s.alive then return end
        if activeDrag and activeDrag.owner == s then local drag = activeDrag; activeDrag = nil; drag.cancel() end
        if s.colorCleanup then local fn = s.colorCleanup; s.colorCleanup = nil; fn() end
        s.alive = false
        for child in pairs(s.children) do E.clean(child) end
        for con in pairs(s.connections) do con:Disconnect() end
        for thread in pairs(s.tasks) do if thread ~= coroutine.running() then pcall(task.cancel, thread) end end
        for object, entry in pairs(s.tweens) do
            entry.connection:Disconnect(); entry.tween:Cancel(); s.tweens[object] = nil
        end
        for inst in pairs(s.instances) do inst:Destroy() end
        table.clear(s.children); table.clear(s.connections); table.clear(s.tasks); table.clear(s.instances)
        if s.parent then s.parent.children[s] = nil end
    end
    function E.connect(s, signal, fn)
        assert(s.alive, 'Owner is destroyed')
        local con = signal:Connect(function(...) if s.alive and ui.alive then fn(...) end end)
        s.connections[con] = true
        return con
    end
    function E.delay(s, seconds, fn)
        local thread
        thread = task.delay(seconds, function()
            s.tasks[coroutine.running()] = nil
            if s.alive and ui.alive then fn() end
        end)
        s.tasks[thread] = true
        return thread
    end
    function E.cancel(s, thread)
        if thread then s.tasks[thread] = nil; pcall(task.cancel, thread) end
    end
    function E.animate(s, object, properties, duration)
        if not s.alive then return end
        local old = s.tweens[object]
        if old then old.connection:Disconnect(); old.tween:Cancel(); s.tweens[object] = nil end
        local speed = math.clamp(options.animationDuration or 0.1, 0, 0.18)
        if speed == 0 then for k,v in pairs(properties) do object[k] = v end; return end
        local t = tweenService:Create(object, TweenInfo.new(math.min(duration or speed, speed), Enum.EasingStyle.Quad, Enum.EasingDirection.Out), properties)
        local entry = {tween = t}
        entry.connection = t.Completed:Connect(function()
            entry.connection:Disconnect()
            if s.tweens[object] == entry then s.tweens[object] = nil end
        end)
        s.tweens[object] = entry
        t:Play()
    end
    function E.copy(value)
        if type(value) ~= 'table' then return value end
        local out = {}; for k,v in pairs(value) do out[k] = E.copy(v) end; return out
    end
    function E.equal(a,b)
        if type(a) ~= type(b) then return false end
        if type(a) ~= 'table' then return a == b end
        for k,v in pairs(a) do if not E.equal(v,b[k]) then return false end end
        for k in pairs(b) do if a[k] == nil then return false end end
        return true
    end
    function E.new(class, props, parent)
        local object = Instance.new(class)
        if object:IsA('GuiObject') then
            object.BorderSizePixel = 0
            object.ZIndex = parent and parent:IsA('GuiObject') and parent.ZIndex + 1 or 34
        end
        for k,v in pairs(props or {}) do object[k] = v end
        object.Parent = parent
        return object
    end
    function E.text(parent, text, props)
        local p = {BackgroundTransparency = 1, Font = Enum.Font.SourceSans, TextSize = 14,
            TextColor3 = theme.TextPrimary, TextStrokeColor3 = theme.TextStroke, TextStrokeTransparency = 0.8,
            TextXAlignment = Enum.TextXAlignment.Left, Text = tostring(text or ''), Size = UDim2.fromScale(1,1)}
        for k,v in pairs(props or {}) do p[k] = v end
        return E.new('TextLabel', p, parent)
    end
    function E.border(object)
        E.new('UICorner', {CornerRadius = UDim.new(0, rounding and 2 or 0)}, object)
        return E.new('UIStroke', {ApplyStrokeMode = Enum.ApplyStrokeMode.Border, Color = theme.Stroke, Thickness = 1}, object)
    end
    function E.box(parent, text, props)
        local p = {BackgroundColor3 = theme.Button1, Font = Enum.Font.SourceSans, TextSize = 14,
            TextColor3 = theme.TextPrimary, TextStrokeColor3 = theme.TextStroke, TextStrokeTransparency = 0.8,
            ClearTextOnFocus = false, Text = tostring(text or ''), Size = UDim2.fromOffset(90,20)}
        for k,v in pairs(props or {}) do p[k] = v end
        local box = E.new('TextBox',p,parent); E.border(box); return box
    end
    function E.button(parent, text, props, scope, fn)
        local p = {BackgroundColor3 = theme.Button1, AutoButtonColor = false, Font = Enum.Font.SourceSans,
            TextSize = 14, TextColor3 = theme.TextPrimary, TextStrokeColor3 = theme.TextStroke,
            TextStrokeTransparency = 0.8, Text = text, Size = UDim2.fromOffset(50,20)}
        for k,v in pairs(props or {}) do p[k] = v end
        local button = E.new('TextButton',p,parent); local stroke = E.border(button)
        E.connect(scope, button.MouseEnter, function() E.animate(scope,button,{BackgroundColor3 = theme.Button2}); E.animate(scope,stroke,{Color = theme.StrokeHover}) end)
        E.connect(scope, button.MouseLeave, function() E.animate(scope,button,{BackgroundColor3 = p.BackgroundColor3}); E.animate(scope,stroke,{Color = theme.Stroke}) end)
        if fn then E.connect(scope,button.Activated,fn) end
        return button
    end
    function E.mouse(input)
        if input then return Vector2.new(input.Position.X,input.Position.Y) end
        return inputService:GetMouseLocation()
    end
    function E.viewport()
        local camera = workspace.CurrentCamera
        return camera and camera.ViewportSize or Vector2.new(1280,720)
    end
    function E.visible(object)
        while object and object ~= uiScreen do
            if object:IsA('GuiObject') and not object.Visible then return false end
            object = object.Parent
        end
        return uiScreen.Enabled
    end
    function E.drag(scope, target, preview, commit)
        E.connect(scope, target.InputBegan, function(input)
            if input.UserInputType ~= Enum.UserInputType.MouseButton1 and input.UserInputType ~= Enum.UserInputType.Touch then return end
            local owner = scope
            while owner and not owner.control do owner = owner.parent end
            if owner and (not owner.control.enabled or not owner.control.alive) then return end
            if activeDrag then activeDrag.cancel() end
            local ds = E.scope(scope)
            local function update(io)
                local point = E.mouse(io)
                local pos,size = target.AbsolutePosition,target.AbsoluteSize
                preview(math.clamp((point.X-pos.X)/math.max(1,size.X),0,1),math.clamp((point.Y-pos.Y)/math.max(1,size.Y),0,1),point)
            end
            local drag
            drag = {cancel = function()
                if activeDrag == drag then activeDrag = nil end
                E.clean(ds)
                if owner and owner.control.alive and owner.control.render then owner.control.render(owner.control.value) end
            end, owner = scope, control = owner and owner.control}
            activeDrag = drag
            update(input)
            E.connect(ds,inputService.InputChanged,function(io)
                if io.UserInputType == Enum.UserInputType.MouseMovement or io == input then update(io) end
            end)
            E.connect(ds,inputService.InputEnded,function(io)
                if io == input or (input.UserInputType == Enum.UserInputType.MouseButton1 and io.UserInputType == Enum.UserInputType.MouseButton1) then
                    E.clean(ds); if activeDrag == drag then activeDrag = nil end
                    if scope.alive then commit() end
                end
            end)
        end)
    end
    function E.closePopup()
        local c = E.popupOwner
        if c and c.closePopup then c:closePopup() end
    end
    function E.popup(c,width,height)
        E.closePopup()
        if not c.alive or not c.enabled then return nil end
        local scope = E.scope(c.scope)
        local shield = E.new('TextButton',{Name = '#popup-shield',BackgroundTransparency = 1,Text = '',AutoButtonColor = false,
            Size = UDim2.fromScale(1,1),ZIndex = 2999},uiScreen)
        scope.instances[shield] = true
        local view,pos = E.viewport(),c.row.AbsolutePosition
        width,height = math.min(width,view.X-12),math.min(height,view.Y-12)
        local y = pos.Y+c.row.AbsoluteSize.Y+3
        if y+height > view.Y-6 then y = math.max(6,pos.Y-height-3) end
        local panel = E.new('Frame',{Name = '#popup',BackgroundColor3 = theme.Window2,
            Position = UDim2.fromOffset(math.clamp(pos.X,6,math.max(6,view.X-width-6)),y),Size = UDim2.fromOffset(width,height),ZIndex = 3000,Active = true},shield)
        E.border(panel)
        c.popup,c.popupScope,E.popupOwner = panel,scope,c
        function c:closePopup()
            if self.popupScope then E.clean(self.popupScope) end
            self.popup,self.popupScope = nil,nil
            if E.popupOwner == self then E.popupOwner = nil end
        end
        E.connect(scope,shield.InputBegan,function(io)
            if io.UserInputType == Enum.UserInputType.MouseButton1 or io.UserInputType == Enum.UserInputType.Touch then
                local p,a,b = E.mouse(io),panel.AbsolutePosition,panel.AbsoluteSize
                if p.X<a.X or p.Y<a.Y or p.X>a.X+b.X or p.Y>a.Y+b.Y then c:closePopup() end
            end
        end)
        return panel,scope
    end
    function E.call(fn,...)
        if type(fn) ~= 'function' then return end
        local ok,err = pcall(fn,...)
        if not ok then warn('[Dollarware callback] '..tostring(err)) end
    end
    function E.emit(c,value)
        if not c.alive then return end
        local fn = c.binds[c.changeEvent or 'onChanged'] or c.callback
        if c.callbackArgs then
            local packed = table.pack(c.callbackArgs(E.copy(value)))
            E.call(fn,table.unpack(packed,1,packed.n))
        else E.call(fn,E.copy(value)) end
    end
    local Common = {}
    function Common:bindToEvent(event,fn) self.binds[event] = fn; return self end
    function Common:fireEvent(event,...) E.call(self.binds[event],...); return self end
    function Common:setTooltip(text) self.tooltip = tostring(text); return self end
    function Common:getId() return self.id end
    local Control = setmetatable({}, {__index = Common}); Control.__index = Control
    function Control:getValue() return E.copy(self.value) end
    function Control:setValue(value,silent)
        if not self.alive then return self end
        if self.normalize then value = self.normalize(value) end
        value = E.copy(value)
        local changed = not E.equal(self.value,value)
        self.value = value
        if self.render then self.render(E.copy(value)) end
        if changed then
            E.refreshDependencies()
            if not E.loading then E.dirty() end
            if not silent then
                E.emit(self,value)
            end
        end
        return self
    end
    function Control:_commit(value)
        if self.alive and self.enabled then self:setValue(value,false) end
        return self
    end
    function Control:reset(silent) return self:setValue(E.copy(self.default),silent) end
    function Control:setEnabled(enabled,reason)
        self.manualEnabled = enabled ~= false; self.disabledReason = reason; E.refreshDependencies(); return self
    end
    function Control:isEnabled() return self.enabled end
    function Control:destroy()
        if not self.alive then return self end
        self.alive = false
        if E.tooltipOwner == self then E.closeTooltip() end
        if self.closePopup then self:closePopup() end
        if E.capture == self then E.endCapture() end
        if activeDrag and activeDrag.owner == self.scope then activeDrag.cancel(); activeDrag = nil end
        E.clean(self.scope)
        self.row:Destroy(); ui.controls[self.id] = nil; E.ids[self.id] = nil
        local idx = table.find(self.section.controls,self); if idx then table.remove(self.section.controls,idx) end
        E.refreshDependencies(); return self
    end
    Control.remove = Control.destroy
    function E.id(settings,parent,kind)
        local leaf = settings.id or tostring(settings.text or kind):lower():gsub('[^%w_-]+','_')
        local id = settings.id and tostring(settings.id) or (parent..'/'..leaf)
        assert(id ~= '' and not E.ids[id], 'Duplicate stable ID: '..id..'; pass an explicit id')
        E.ids[id] = true
        return id
    end
    E.ids = {}
    function E.control(section,s,kind,initial,callback)
        assert(section.alive,'Section is destroyed'); s = s or {}
        local id = E.id(s,section.id,kind)
        local default = initial; if s.default ~= nil then default = s.default end
        local c = setmetatable({id = id,name = s.text or kind,class = kind,settings = s,section = section,window = section.menu.window,
            alive = true,enabled = true,manualEnabled = s.enabled ~= false,value = E.copy(initial),default = E.copy(default),
            callback = callback or s.callback,binds = {},scope = E.scope(section.scope),instances = {},serializable = s.persist ~= false},Control)
        c.row = E.new('Frame',{Name = id,BackgroundTransparency = 1,Size = UDim2.new(1,0,0,20),LayoutOrder = #section.controls+1,ZIndex = 34},section.instances.controlMenu)
        c.instances.controlFrame = c.row
        c.scope.control = c
        c.row:SetAttribute('ControlId',id)
        c.blocker = E.new('TextButton',{Name = '#disabled',Text = '',BackgroundColor3 = theme.Window2,BackgroundTransparency = 0.35,
            AutoButtonColor = false,Size = UDim2.fromScale(1,1),Visible = false,ZIndex = 1900},c.row)
        E.connect(c.scope,c.row.MouseEnter,function()
            if not c.tooltip and c.enabled then return end
            E.closeTooltip()
            local text = c.enabled and c.tooltip or c.disabledReason or 'Unavailable: dependency is disabled'
            E.tooltip = E.new('TextLabel',{BackgroundColor3 = theme.Window3,Font = Enum.Font.SourceSans,TextSize = 14,
                TextColor3 = theme.TextPrimary,TextWrapped = true,Text = text,Size = UDim2.fromOffset(200,44),ZIndex = 3500,
                Position = UDim2.fromOffset(math.min(c.row.AbsolutePosition.X,E.viewport().X-206),math.max(4,c.row.AbsolutePosition.Y-46))},uiScreen)
            E.border(E.tooltip); E.tooltipOwner = c
        end)
        E.connect(c.scope,c.row.MouseLeave,function() if E.tooltipOwner == c then E.closeTooltip() end end)
        table.insert(section.controls,c); ui.controls[id] = c
        E.refreshDependencies()
        return c
    end
    function E.closeTooltip()
        if E.tooltip then E.tooltip:Destroy() end
        E.tooltip,E.tooltipOwner = nil,nil
    end
    function E.refreshDependencies()
        if E.refreshing then return end
        E.refreshing = true
        local function available(c,seen)
            if seen[c] then return false end
            if not c.alive or not c.manualEnabled then return false end
            local dep = c.settings.dependsOn
            if not dep then return true end
            seen[c] = true
            local function test(rule)
                if type(rule) == 'string' then rule = {id = rule} end
                if type(rule) ~= 'table' or not rule.id then return false end
                local other = ui.controls[rule.id]
                if not other or not available(other,seen) then return false end
                if rule.value ~= nil then return E.equal(other.value,rule.value) end
                if rule.predicate then local ok,v = pcall(rule.predicate,other:getValue()); return ok and v == true end
                return other.value ~= nil and other.value ~= false
            end
            local ok = true
            if type(dep) == 'table' and not dep.id then
                for _,rule in ipairs(dep) do if not test(rule) then ok = false; break end end
            else ok = test(dep) end
            seen[c] = nil
            return ok
        end
        for _,c in pairs(ui.controls) do
            local enabled = available(c,{})
            c.enabled = enabled; c.blocker.Visible = not enabled
            if not enabled and activeDrag and activeDrag.control == c then activeDrag.cancel() end
            if not enabled and c.closePopup then c:closePopup() end
            if not enabled and E.capture == c then E.endCapture(); if c.render then c.render(c.value) end end
        end
        E.refreshing = false
    end
    function E.template(c,kind)
        local root = elemClasses[kind].instances.controlFrame:Clone()
        root.Size = UDim2.fromScale(1,1); root.Parent = c.row
        c.instances.template = root
        return root
    end
    function E.addToggle(section,s,callback)
        s = s or {}; local value = s.value; if value == nil then value = s.default; if value == nil then value = s.state or false end end
        local c = E.control(section,s,'toggle',value == true,callback); c.changeEvent = 'onToggle'
        local root = E.template(c,'toggle'); local back = root['#back-toggle']; local toggle = back['#toggle']
        back['#label'].Text = c.name
        c.normalize = function(v) return v == true end
        c.render = function(v)
            toggle.BackgroundColor3 = v and theme.Button3 or theme.Button1
            local icon = toggle:FindFirstChild('#icon')
            if icon then
                icon.Image = v and 'rbxassetid://9801457539' or 'rbxassetid://9801456486'
                icon.ImageColor3 = v and theme.Primary or theme.Secondary; icon.Rotation = v and 0 or 360
            end
            c.toggled = v
        end
        E.connect(c.scope,back.Activated,function() c:_commit(not c.value) end)
        function c:enable(silent) return self:setValue(true,silent) end
        function c:disable(silent) return self:setValue(false,silent) end
        function c:toggle() return self:_commit(not self.value) end
        c.getState = c.getValue; c.render(c.value); return c
    end
    function E.addButton(section,s,callback)
        s = s or {}; local c = E.control(section,s,'button',nil,callback); c.serializable = false
        local kind = (s.style == 'large' or s.style == 2) and 'buttonLarge' or 'buttonSmall'
        local root = E.template(c,kind)
        for _,inst in ipairs(root:GetDescendants()) do if inst.Name == '#label' and inst:IsA('TextLabel') then inst.Text = c.name end end
        function c:click() if self.enabled and self.alive then E.call(self.binds.onClick or self.callback) end; return self end
        local hit = root:FindFirstChildWhichIsA('TextButton',true)
        if hit then E.connect(c.scope,hit.Activated,function() c:click() end) end
        return c
    end
    function E.addLabel(section,s)
        s = s or {}; local c = E.control(section,s,'label',s.text or '',nil); c.serializable = false
        local root = E.template(c,'label'); local label = root['#label']
        if s.center then label.TextXAlignment = Enum.TextXAlignment.Center end
        if s.dim then label.TextColor3 = theme.TextDim end
        c.normalize = function(v) return tostring(v) end; c.render = function(v) label.Text = v end
        c.setText,c.getText = c.setValue,c.getValue; c.render(c.value); return c
    end
    function E.addTextbox(section,s,callback)
        s = s or {}; local c = E.control(section,s,'textbox',s.value or s.default or s.text or '',callback); c.changeEvent = 'onFocusLost'
        local root = E.template(c,'textbox'); local box = root['#textbox']; box.ClearTextOnFocus = false
        box.PlaceholderText = s.placeholder or c.name
        c.normalize = function(v) return tostring(v) end; c.render = function(v) box.Text = v end
        E.connect(c.scope,box.FocusLost,function() c:_commit(box.Text) end)
        c.setText,c.getText = c.setValue,c.getValue; c.render(c.value); return c
    end
    function E.addSlider(section,s,callback)
        s = s or {}; local low,high = s.min or 0,s.max or 100
        assert(type(low) == 'number' and type(high) == 'number' and low < high and math.abs(low)<math.huge and math.abs(high)<math.huge,'Slider bounds must be finite and min less than max')
        local step = s.increment or s.step or 1; assert(type(step) == 'number' and step > 0 and step<math.huge,'Slider step must be finite and positive')
        local function quantize(v)
            assert(type(v) == 'number' and v == v and math.abs(v) < math.huge,'Slider value must be finite')
            if v >= high then return high end
            return math.clamp(low+math.round((v-low)/step)*step,low,high)
        end
        local c = E.control(section,s,'slider',quantize(s.value or s.default or s.valueDefault or low),callback); c.changeEvent = 'onNewValue'
        local root = E.template(c,'slider'); local bar = root['#slider-container']; local fill = bar['#slider-fill']
        local label,val = root['#label'],root['#val']; label.Text = c.name; val.Visible = false
        local entry = E.box(root,'',{BackgroundTransparency = 1,Size = UDim2.new(0,72,1,0),Position = UDim2.new(1,-76,0,0),TextXAlignment = Enum.TextXAlignment.Right,ZIndex = 40})
        for _,child in ipairs(entry:GetChildren()) do child:Destroy() end
        local oldBox = bar:FindFirstChild('#input-box'); if oldBox then oldBox:Destroy() end
        c.normalize = quantize
        local function format(v) return string.format(s.format or '%.14g',v)..(s.units or s.unit or '') end
        c.render = function(v) fill.Size = UDim2.fromScale((v-low)/(high-low),1); entry.Text = format(v) end
        local pending,lastPress,startValue,lastWasDouble = c.value,-math.huge,c.value,false
        local hit = E.new('TextButton',{BackgroundTransparency = 1,Text = '',Size = UDim2.new(1,-80,1,4),Position = UDim2.fromOffset(0,-2),ZIndex = 39,AutoButtonColor = false},root)
        E.drag(c.scope,hit,function(_,_,point)
            if not c.enabled then return end
            if startValue == nil then startValue = c.value end
            local fraction = math.clamp((point.X-bar.AbsolutePosition.X)/math.max(1,bar.AbsoluteSize.X),0,1)
            pending = quantize(low+fraction*(high-low)); c.render(pending)
        end,function()
            if lastWasDouble then lastWasDouble = false; c:_commit(c.default)
            else c:_commit(pending) end
            startValue = nil
        end)
        E.connect(c.scope,hit.InputBegan,function(io)
            if io.UserInputType == Enum.UserInputType.MouseButton1 then
                local now = os.clock(); lastWasDouble = now-lastPress < 0.28; lastPress = now
            end
        end)
        E.connect(c.scope,entry.FocusLost,function()
            local text = entry.Text:match('^%s*(.-)%s*$')
            local units = s.units or s.unit or ''
            if units ~= '' and text:sub(-#units) == units then text = text:sub(1,-#units-1):match('^%s*(.-)%s*$') end
            local number = tonumber(text)
            if number and number == number and math.abs(number)<math.huge then c:_commit(number) end
            c.render(c.value)
        end)
        c.render(c.value); return c
    end
    function E.key(value)
        if value == nil or value == '' or value == 'None' then return nil end
        if typeof(value) == 'EnumItem' then
            assert(value.EnumType == Enum.KeyCode or value.EnumType == Enum.UserInputType,'Expected keyboard or mouse key')
            value = value.Name
        end
        assert(type(value) == 'string','Keybind must be a key name')
        if value:match('^MouseButton[123]$') then return value end
        local ok,key = pcall(function() return Enum.KeyCode[value] end)
        assert(ok and key and value ~= 'Unknown' and value ~= 'Escape' and value ~= 'Backspace','Invalid/reserved keybind: '..value)
        return value
    end
    function E.conflict(key,except)
        if not key then return nil end
        if E.loading then return nil end
        for _,c in pairs(ui.controls) do if c ~= except and c.class == 'hotkey' and c.value == key then return c.id end end
        for _,win in ipairs(ui.windows) do
            if win.minimizeKey == key or win.reopenKey == key then return 'window shortcut: '..win.id end
        end
        return nil
    end
    function E.endCapture(mouseReleasePending)
        E.capture = nil
        local scope = E.captureScope; E.captureScope = nil
        if scope then
            if mouseReleasePending then
                -- Keep the shield over the consuming click until its Activated event ends.
                E.connect(scope,inputService.InputEnded,function(io)
                    if io.UserInputType.Name:match('^MouseButton[123]$') then E.delay(scope,0.03,function() E.clean(scope) end) end
                end)
                E.connect(scope,inputService.WindowFocusReleased,function() E.clean(scope) end)
            else E.clean(scope) end
        end
    end
    function E.addHotkey(section,s,callback)
        s = s or {}; local value = E.key(s.value or s.default or s.bind)
        assert(not E.conflict(value),'Keybind conflict: '..tostring(E.conflict(value)))
        local c = E.control(section,s,'hotkey',value,callback); c.changeEvent = 'onBindChanged'
        local root = E.template(c,'hotkey'); local back = root['#back']; local display = back['#hotkey']; back['#label'].Text = c.name
        c.normalize = function(v) local key = E.key(v); local conflict = E.conflict(key,c); assert(not conflict,'Keybind conflict: '..tostring(conflict)); return key end
        c.render = function(v) display.Text = E.capture == c and '[Press key...]' or '['..(v or 'None')..']'; display.TextColor3 = E.capture == c and theme.Primary or theme.TextDim end
        function c:click()
            if not self.enabled or not self.alive then return self end
            if E.capture then local previous = E.capture; E.endCapture(); previous.render(previous.value) end
            E.closePopup(); E.capture = self
            local scope = E.scope(self.scope); E.captureScope = scope
            local shield = E.new('TextButton',{Name = '#capture-shield',BackgroundTransparency = 1,Text = '',AutoButtonColor = false,
                Size = UDim2.fromScale(1,1),ZIndex = 4000},uiScreen)
            scope.instances[shield] = true
            E.text(shield,'Press a key or mouse button · Esc cancels · Backspace clears',{
                BackgroundColor3 = theme.Window3,BackgroundTransparency = 0,Size = UDim2.fromOffset(380,24),
                Position = UDim2.new(0.5,-190,1,-30),TextXAlignment = Enum.TextXAlignment.Center,ZIndex = 4001})
            self.render(self.value); return self
        end
        function c:linkToControl(control) self.linkedControl = control; return self end
        c.setHotkey,c.setBind = c.setValue,c.setValue
        function c:getHotkey()
            if not self.value then return nil end
            return self.value:match('^MouseButton') and Enum.UserInputType[self.value] or Enum.KeyCode[self.value]
        end
        E.connect(c.scope,back.Activated,function() c:click() end)
        c.render(c.value); return c
    end

-- Dropdowns and lists share IDs so refreshing labels never loses a selection.
do
    local function entries(source)
        assert(type(source) == 'table', 'options/items must be an array')
        local result, known = {}, {}
        for _, item in ipairs(source) do
            local id = type(item) == 'table' and item.id or item
            assert(type(id) == 'string' and id ~= '', 'each option needs a nonempty string id')
            assert(not known[id], 'duplicate option id: ' .. id)
            known[id] = true
            result[#result + 1] = {
                id = id,
                label = type(item) == 'table' and tostring(item.label or id) or id,
                disabled = type(item) == 'table' and item.disabled == true or false,
            }
        end
        return result
    end
    local function index(items, id)
        for i, item in ipairs(items) do if item.id == id then return i, item end end
    end
    local function scroll(parent, position, size, z)
        local frame = E.new('ScrollingFrame', {
            Name = '#options', BackgroundColor3 = theme.Window3,
            BorderColor3 = theme.Inset3, BorderMode = Enum.BorderMode.Inset, BorderSizePixel = 1,
            Position = position, Size = size, CanvasSize = UDim2.new(),
            AutomaticCanvasSize = Enum.AutomaticSize.Y, ScrollBarThickness = 1,
            ScrollBarImageTransparency = 0.5, ScrollingDirection = Enum.ScrollingDirection.Y,
            BottomImage = 'rbxassetid://9416839567', MidImage = 'rbxassetid://9416839567',
            TopImage = 'rbxassetid://9416839567', ZIndex = z,
        }, parent)
        E.new('UIListLayout', {Padding = UDim.new(0, 4), SortOrder = Enum.SortOrder.LayoutOrder}, frame)
        E.new('UIPadding', {PaddingTop = UDim.new(0, 3), PaddingBottom = UDim.new(0, 3),
            PaddingLeft = UDim.new(0, 3), PaddingRight = UDim.new(0, 3)}, frame)
        return frame
    end
    local function cleanRows(holder, scope)
        if scope then E.clean(scope) end
        for _, child in ipairs(holder:GetChildren()) do
            if child:IsA('GuiObject') then child:Destroy() end
        end
    end
    local function selection(c, value)
        if not c.multi then
            if value == nil then return nil end
            assert(type(value) == 'string', 'single selection must be an option id or nil')
            return index(c.options, value) and value or nil
        end
        assert(type(value) == 'table', 'multi selection must be an array of option ids')
        local wanted, result = {}, {}
        for _, id in ipairs(value) do
            assert(type(id) == 'string', 'selection ids must be strings')
            wanted[id] = true
        end
        -- Canonical option order avoids callbacks caused only by table ordering.
        for _, item in ipairs(c.options) do
            if wanted[item.id] then result[#result + 1] = item.id end
        end
        return result
    end
    local function selected(c, id)
        return c.multi and table.find(c.value, id) ~= nil or c.value == id
    end
    local function toggle(c, item)
        if not c.enabled or item.disabled then return end
        if not c.multi then c:_commit(item.id); return end
        local value = c:getValue()
        local i = table.find(value, item.id)
        if i then table.remove(value, i) else value[#value + 1] = item.id end
        c:_commit(value)
    end
    local function summary(c)
        if not c.multi then
            local _, item = index(c.options, c.value)
            return item and item.label or 'None'
        end
        local labels = {}
        for _, id in ipairs(c.value) do
            local _, item = index(c.options, id)
            if item then labels[#labels + 1] = item.label end
        end
        if #labels == 0 then return 'None' end
        if #labels > 2 then return labels[1] .. ', ' .. labels[2] .. ' +' .. (#labels - 2) end
        return table.concat(labels, ', ')
    end
    local function installOptions(c, source)
        c.options = entries(source)
        c.multi = c.settings.multi == true
        c.normalize = function(value) return selection(c, value) end
        local default = c.settings.default
        if default == nil then default = c.default end
        c.default = c.normalize(default == nil and (c.multi and {} or nil) or default)
        c.value = c.normalize(c.value == nil and (c.multi and {} or nil) or c.value)
        c.getOptions = function(self) return E.copy(self.options) end
        c.getOptionOrder = function(self)
            local order = {}
            for _, item in ipairs(self.options) do order[#order + 1] = item.id end
            return order
        end
        c.setOptions = function(self, options, silent)
            if not self.alive then return self end
            local order = self:getOptionOrder()
            self.options = entries(options)
            self:setValue(self.value, silent)
            if self.alive and not silent and not E.equal(order, self:getOptionOrder()) then E.dirty(self.window) end
            return self
        end
        c.addOption = function(self, item, silent)
            local options = self:getOptions()
            options[#options + 1] = item
            return self:setOptions(options, silent)
        end
        c.removeOption = function(self, id, silent)
            local options = self:getOptions()
            local i = index(options, id)
            if i then table.remove(options, i); self:setOptions(options, silent) end
            return self
        end
        c.reorderOptions = function(self, order, silent)
            assert(type(order) == 'table' and #order == #self.options, 'order must contain every option id')
            local replacement, seen = {}, {}
            for _, id in ipairs(order) do
                local _, item = index(self.options, id)
                assert(item and not seen[id], 'invalid/duplicate option id in order')
                seen[id] = true
                replacement[#replacement + 1] = item
            end
            if E.equal(self:getOptionOrder(), order) then return self end
            self.options = replacement
            -- Reordering is layout state; preserve selection membership without a value callback.
            self.value = self.normalize(self.value)
            self.render()
            E.refreshDependencies()
            if not silent then
                E.dirty(self.window)
                if self.fireEvent then self:fireEvent('onReorder', self:getOptionOrder()) end
            end
            return self
        end
        c.moveOption = function(self, id, destination, silent)
            local order = self:getOptionOrder()
            local i = table.find(order, id)
            assert(i and type(destination) == 'number', 'invalid option or destination')
            table.remove(order, i)
            table.insert(order, math.clamp(math.floor(destination), 1, #order + 1), id)
            return self:reorderOptions(order, silent)
        end
        E.refreshDependencies()
    end

    function E.addDropdown(section, settings, callback)
        settings = settings or {}
        local initial = settings.value
        if initial == nil then initial = settings.default end
        if settings.multi and initial == nil then initial = {} end
        local c = E.control(section, settings, 'dropdown', initial, callback)
        c.changeEvent = 'onSelectionChanged'
        installOptions(c, settings.options or {})
        local button = E.button(c.row, '', {Name = '#button', Position = UDim2.fromOffset(3, 2),
            Size = UDim2.new(1, -6, 0, 16), ZIndex = 35, TextSize = 14,
            TextTruncate = Enum.TextTruncate.AtEnd}, c.scope, function()
            if c.enabled then if c.popup then c:closePopup() else c:open() end end
        end)
        c.instances.button = button
        c.instances.label = button
        local redraw
        c.render = function()
            if not c.alive then return end
            button.Text = (settings.text or 'Dropdown') .. ': ' .. summary(c) .. '  ▾'
            if c.popup and redraw then redraw() end
        end
        c.open = function(self)
            if not self.enabled or not self.alive then return self end
            if self.popup then return self end
            local panel, scope = E.popup(self, math.max(220, self.row.AbsoluteSize.X), settings.popupHeight or 250)
            local z = panel.ZIndex + 1
            E.text(panel, settings.text or 'Dropdown', {Position = UDim2.fromOffset(6, 2),
                Size = UDim2.new(1, -12, 0, 18), ZIndex = z})
            local search = E.box(panel, '', {Name = '#search', PlaceholderText = 'Search options...',
                Position = UDim2.fromOffset(6, 24), Size = UDim2.new(1, -12, 0, 20), ZIndex = z})
            local actionsY = 49
            local clearWidth = self.multi and 0.5 or 1
            if self.multi then
                E.button(panel, 'Select all', {Position = UDim2.fromOffset(6, actionsY),
                    Size = UDim2.new(0.5, -8, 0, 18), ZIndex = z}, scope, function()
                    if not self.enabled then return end
                    local value = self:getValue()
                    for _, item in ipairs(self.options) do
                        if not item.disabled and not table.find(value, item.id) then value[#value + 1] = item.id end
                    end
                    self:_commit(value)
                end)
            end
            E.button(panel, 'Clear', {Position = UDim2.new(self.multi and 0.5 or 0, self.multi and 2 or 6, 0, actionsY),
                Size = UDim2.new(clearWidth, self.multi and -8 or -12, 0, 18), ZIndex = z}, scope, function()
                if self.enabled then self:_commit(self.multi and {} or nil) end
            end)
            local holder = scroll(panel, UDim2.fromOffset(6, 72), UDim2.new(1, -12, 1, -78), z)
            local rowsScope
            redraw = function()
                if not self.alive or not self.popup then return end
                local canvas = holder.CanvasPosition
                cleanRows(holder, rowsScope)
                rowsScope = E.scope(scope)
                local query, count = string.lower(search.Text), 0
                for i, item in ipairs(self.options) do
                    if string.find(string.lower(item.label .. ' ' .. item.id), query, 1, true) then
                        count += 1
                        local row = E.new('Frame', {Name = item.id, BackgroundTransparency = 1,
                            Size = UDim2.new(1, -1, 0, 20), LayoutOrder = i, ZIndex = z + 1}, holder)
                        local isSelected = selected(self, item.id)
                        local choose = E.button(row, item.label, {Position = UDim2.fromOffset(0, 0),
                            Size = UDim2.new(1, -42, 1, 0), TextXAlignment = Enum.TextXAlignment.Left,
                            TextColor3 = item.disabled and theme.TextDim or (isSelected and theme.Primary or theme.TextPrimary),
                            TextTruncate = Enum.TextTruncate.AtEnd, ZIndex = z + 2}, rowsScope, function()
                            toggle(self, item)
                            if not self.multi and not item.disabled then self:closePopup() end
                        end)
                        E.new('UIPadding', {PaddingLeft = UDim.new(0, self.multi and 23 or 5)}, choose)
                        if self.multi then
                            local check = E.new('Frame', {BackgroundColor3 = theme.Button1, BorderColor3 = theme.Stroke, BorderSizePixel = 1,
                                Position = UDim2.fromOffset(5, 4), Size = UDim2.fromOffset(12, 12), ZIndex = z + 3}, choose)
                            E.text(check, isSelected and '✓' or '', {Size = UDim2.fromScale(1, 1),
                                TextColor3 = theme.Primary, TextXAlignment = Enum.TextXAlignment.Center, ZIndex = z + 4})
                        end
                        E.button(row, '↑', {Position = UDim2.new(1, -39, 0, 0), Size = UDim2.fromOffset(18, 20),
                            ZIndex = z + 2}, rowsScope, function() if self.enabled then self:moveOption(item.id, i - 1) end end)
                        E.button(row, '↓', {Position = UDim2.new(1, -18, 0, 0), Size = UDim2.fromOffset(18, 20),
                            ZIndex = z + 2}, rowsScope, function() if self.enabled then self:moveOption(item.id, i + 1) end end)
                    end
                end
                if count == 0 then E.text(holder, 'No matching options', {Size = UDim2.new(1, 0, 0, 20),
                    TextColor3 = theme.TextDim, ZIndex = z + 1}) end
                holder.CanvasPosition = canvas
            end
            E.connect(scope, search:GetPropertyChangedSignal('Text'), redraw)
            self.instances.search, self.instances.options = search, holder
            redraw()
            search:CaptureFocus()
            return self
        end
        c.close = function(self) if self.closePopup then self:closePopup() end; return self end
        c.getSummary = function(self) return summary(self) end
        c.selectAll = function(self, silent)
            assert(self.multi, 'selectAll requires multi=true')
            local value = self:getValue()
            for _, item in ipairs(self.options) do
                if not item.disabled and not table.find(value, item.id) then value[#value + 1] = item.id end
            end
            return self:setValue(value, silent)
        end
        c.clear = function(self, silent) return self:setValue(self.multi and {} or nil, silent) end
        c.refresh = c.setOptions
        c.render()
        return c
    end

    function E.addList(section, settings, callback)
        settings = settings or {}
        local initial = settings.value
        if initial == nil then initial = settings.default end
        if settings.multi and initial == nil then initial = {} end
        local source = settings.items or settings.options or {}
        if settings.provider then
            local ok, result = pcall(function() return entries(settings.provider()) end)
            if ok then source = result else warn('Dollarware list provider: ' .. tostring(result)) end
        end
        local c = E.control(section, settings, 'list', initial, callback)
        c.changeEvent = 'onSelectionChanged'
        installOptions(c, source)
        c.row.Size = UDim2.new(1, 0, 0, math.max(90, settings.height or 160))
        E.text(c.row, settings.text or 'List', {Position = UDim2.fromOffset(6, 0),
            Size = UDim2.new(1, -38, 0, 20), ZIndex = 35})
        local search = E.box(c.row, '', {Name = '#search', PlaceholderText = 'Search...',
            Position = UDim2.fromOffset(3, 23), Size = UDim2.new(1, -6, 0, 20), ZIndex = 35})
        local holder = scroll(c.row, UDim2.fromOffset(3, 48), UDim2.new(1, -6, 1, -51), 35)
        local rowsScope
        c.render = function()
            if not c.alive then return end
            local canvas = holder.CanvasPosition
            cleanRows(holder, rowsScope)
            rowsScope = E.scope(c.scope)
            local query, count = string.lower(search.Text), 0
            for i, item in ipairs(c.options) do
                if string.find(string.lower(item.label .. ' ' .. item.id), query, 1, true) then
                    count += 1
                    E.button(holder, (c.multi and (selected(c, item.id) and '☑ ' or '☐ ') or '') .. item.label,
                        {Name = item.id, Size = UDim2.new(1, -1, 0, 20), LayoutOrder = i,
                        TextTruncate = Enum.TextTruncate.AtEnd,
                        TextColor3 = item.disabled and theme.TextDim or (selected(c, item.id) and theme.Primary or theme.TextPrimary),
                        ZIndex = 36}, rowsScope, function() toggle(c, item) end)
                end
            end
            if count == 0 then E.text(holder, 'No matching items', {Size = UDim2.new(1, 0, 0, 20),
                TextColor3 = theme.TextDim, ZIndex = 36}) end
            holder.CanvasPosition = canvas
        end
        E.connect(c.scope, search:GetPropertyChangedSignal('Text'), c.render)
        c.setItems, c.getItems = c.setOptions, c.getOptions
        c.addItem, c.removeItem = c.addOption, c.removeOption
        c.refresh = function(self, items, silent)
            if items == nil and settings.provider then
                local ok, result = pcall(function() return entries(settings.provider()) end)
                if not ok then warn('Dollarware list provider: ' .. tostring(result)); return self end
                items = result
            end
            if items ~= nil then self:setItems(items, silent) else self.render() end
            return self
        end
        E.button(c.row, '↻', {Position = UDim2.new(1, -24, 0, 1), Size = UDim2.fromOffset(20, 18),
            ZIndex = 35}, c.scope, function() if c.enabled then c:refresh() end end)
        c.instances.search, c.instances.options = search, holder
        c.render()
        return c
    end

    function E.addContainer(section, settings)
        settings = settings or {}
        local c = E.control(section, settings, 'container', nil)
        c.row.Size = UDim2.new(1, 0, 0, math.max(24, settings.height or 130))
        c.serializable = false
        if settings.text then E.text(c.row, settings.text, {Position = UDim2.fromOffset(6, 0),
            Size = UDim2.new(1, -12, 0, 20), ZIndex = 35}) end
        local top = settings.text and 23 or 3
        c.content = E.new('Frame', {Name = '#custom-content', BackgroundColor3 = theme.Window3,
            BorderColor3 = theme.Stroke, BorderSizePixel = 1, Position = UDim2.fromOffset(3, top),
            Size = UDim2.new(1, -6, 1, -top - 3), ClipsDescendants = true, ZIndex = 35}, c.row)
        c.instances.content = c.content
        local cleanups, contentScope = {}, E.scope(c.scope)
        c.addCleanup = function(self, resource)
            assert(self.alive, 'Container is destroyed')
            assert(type(resource) == 'function' or typeof(resource) == 'RBXScriptConnection'
                or typeof(resource) == 'Instance' or type(resource) == 'thread', 'unsupported cleanup resource')
            cleanups[#cleanups + 1] = resource
            return resource
        end
        c.connect = function(self, signal, fn) return E.connect(contentScope, signal, fn) end
        c.clear = function(self)
            if not self.alive or self.clearing then return self end
            self.clearing = true
            E.clean(contentScope)
            contentScope = E.scope(self.scope)
            for i = #cleanups, 1, -1 do
                local resource = cleanups[i]
                cleanups[i] = nil
                pcall(function()
                    if type(resource) == 'function' then resource()
                    elseif typeof(resource) == 'RBXScriptConnection' then resource:Disconnect()
                    elseif typeof(resource) == 'Instance' then resource:Destroy()
                    elseif type(resource) == 'thread' and resource ~= coroutine.running() then task.cancel(resource) end
                end)
            end
            self.content:ClearAllChildren()
            self.clearing = false
            return self
        end
        local destroy = c.destroy
        c.destroy = function(self)
            if self.alive then self:clear() end
            return destroy(self)
        end
        c.remove = c.destroy
        return c
    end
end

-- Original Dollarware swatch; lazy HSV/RGB/hex/opacity editing.
function E.addColorPicker(section, settings, callback)
    settings = settings or {}
    local initial = settings.value or settings.default or {
        color = settings.color or Color3.new(1, 1, 1),
        opacity = settings.opacity == nil and 1 or settings.opacity,
    }
    local function normalize(value, fallbackOpacity)
        if typeof(value) == 'Color3' then value = {color = value, opacity = fallbackOpacity} end
        assert(type(value) == 'table' and typeof(value.color) == 'Color3', 'Expected {color = Color3, opacity = number}')
        local opacity = value.opacity == nil and 1 or tonumber(value.opacity)
        assert(opacity and opacity == opacity and math.abs(opacity) < math.huge, 'Invalid opacity')
        local color = value.color
        for _, component in ipairs({color.R, color.G, color.B}) do
            assert(component == component and math.abs(component) < math.huge, 'Invalid color component')
        end
        return {color = Color3.new(math.clamp(color.R, 0, 1), math.clamp(color.G, 0, 1), math.clamp(color.B, 0, 1)),
            opacity = math.clamp(opacity, 0, 1)}
    end
    initial = normalize(initial, settings.opacity or 1)
    local default = settings.default == nil and E.copy(initial) or normalize(settings.default, initial.opacity)
    local c = E.control(section, settings, 'picker', initial, callback)
    c.changeEvent = 'onNewColor'
    c.callbackArgs = function(value) return value.color, value.opacity end
    c.normalize = function(value) return normalize(value, c.value.opacity) end
    c.value = initial
    c.default = default
    local original = elemClasses.picker.instances.controlFrame:Clone()
    original.Size = UDim2.fromScale(1, 1)
    original.Parent = c.row
    local click = original['#click-region']
    local label, swatch = click['#label'], click['#picker']
    local display = swatch['#display']
    label.Text = settings.text or settings.id or 'Color'
    label.RichText = false
    c.instances.controlFrame, c.instances.clickRegion = c.row, click
    c.instances.label, c.instances.picker, c.instances.display = label, swatch, display
    local refreshPopup
    c.render = function(value)
        display.BackgroundColor3 = value.color
        display.BackgroundTransparency = 1 - value.opacity
        if refreshPopup then refreshPopup(value) end
    end
    function c:getColor() return self.value.color end
    function c:getOpacity() return self.value.opacity end
    function c:setColor(color, silent) return self:setValue({color = color, opacity = self.value.opacity}, silent) end
    function c:setOpacity(opacity, silent) return self:setValue({color = self.value.color, opacity = opacity}, silent) end
    function c:getHSV()
        local h, s, v = self.value.color:ToHSV()
        return h, s, v, self.value.opacity
    end
    function c:setHSV(h, s, v, opacity, silent)
        return self:setValue({color = Color3.fromHSV(h % 1, math.clamp(s, 0, 1), math.clamp(v, 0, 1)),
            opacity = opacity == nil and self.value.opacity or opacity}, silent)
    end
    function c:openPrompt()
        if not self.alive or not self.enabled then return self end
        if self.popup then self:closePopup(); return self end
        local panel, scope = E.popup(self, 316, 310)
        local z = panel.ZIndex + 1
        E.text(panel, label.Text, {Position = UDim2.fromOffset(8, 4), Size = UDim2.new(1, -40, 0, 20), ZIndex = z})
        E.button(panel, '×', {Position = UDim2.new(1, -26, 0, 5), Size = UDim2.fromOffset(18, 18), ZIndex = z}, scope,
            function() self:closePopup() end)
        local function frame(parent, props)
            props.ZIndex = props.ZIndex or z
            props.BorderSizePixel = props.BorderSizePixel or 0
            return E.new('Frame', props, parent)
        end
        local function stroke(target)
            E.new('UIStroke', {Color = theme.Stroke, Thickness = 1, ApplyStrokeMode = Enum.ApplyStrokeMode.Border}, target)
        end
        local sv = frame(panel, {Position = UDim2.fromOffset(8, 30), Size = UDim2.fromOffset(272, 130), Active = true})
        stroke(sv)
        local white = frame(sv, {Size = UDim2.fromScale(1, 1), BackgroundColor3 = Color3.new(1, 1, 1), ZIndex = z + 1})
        E.new('UIGradient', {Transparency = NumberSequence.new(0, 1)}, white)
        local black = frame(sv, {Size = UDim2.fromScale(1, 1), BackgroundColor3 = Color3.new(), ZIndex = z + 2})
        E.new('UIGradient', {Rotation = 90, Transparency = NumberSequence.new(1, 0)}, black)
        local cursor = frame(sv, {AnchorPoint = Vector2.new(0.5, 0.5), Size = UDim2.fromOffset(7, 7),
            BackgroundTransparency = 1, ZIndex = z + 3})
        E.new('UICorner', {CornerRadius = UDim.new(1, 0)}, cursor)
        E.new('UIStroke', {Color = Color3.new(1, 1, 1), Thickness = 1}, cursor)
        local hue = frame(panel, {Position = UDim2.fromOffset(288, 30), Size = UDim2.fromOffset(18, 130),
            BackgroundColor3 = Color3.new(1, 1, 1), Active = true})
        stroke(hue)
        local spectrum = {}
        for i = 0, 6 do spectrum[i + 1] = ColorSequenceKeypoint.new(i / 6, Color3.fromHSV(i / 6, 1, 1)) end
        E.new('UIGradient', {Rotation = 90, Color = ColorSequence.new(spectrum)}, hue)
        local hueCursor = frame(hue, {Position = UDim2.fromScale(0, 0), Size = UDim2.new(1, 0, 0, 2),
            BackgroundColor3 = Color3.new(1, 1, 1), ZIndex = z + 3})
        local alpha = frame(panel, {Position = UDim2.fromOffset(8, 169), Size = UDim2.fromOffset(298, 16),
            BackgroundColor3 = Color3.fromRGB(140, 140, 140), Active = true, ClipsDescendants = true})
        stroke(alpha)
        for y = 0, 1 do
            for x = 0, 37 do
                if (x + y) % 2 == 0 then
                    frame(alpha, {Position = UDim2.fromOffset(x * 8, y * 8), Size = UDim2.fromOffset(8, 8),
                        BackgroundColor3 = Color3.fromRGB(75, 75, 75), ZIndex = z + 1})
                end
            end
        end
        local alphaColor = frame(alpha, {Size = UDim2.fromScale(1, 1), ZIndex = z + 2})
        E.new('UIGradient', {Transparency = NumberSequence.new(1, 0)}, alphaColor)
        local alphaCursor = frame(alpha, {Size = UDim2.new(0, 2, 1, 0), BackgroundColor3 = Color3.new(1, 1, 1), ZIndex = z + 3})
        local fields = {}
        local function field(name, x, y, width)
            E.text(panel, name, {Position = UDim2.fromOffset(x, y), Size = UDim2.fromOffset(16, 20),
                TextColor3 = theme.TextDim, ZIndex = z})
            local box = E.box(panel, '', {Position = UDim2.fromOffset(x + 18, y), Size = UDim2.fromOffset(width, 20), ZIndex = z})
            fields[name] = box
            return box
        end
        field('H', 8, 195, 66); field('S', 108, 195, 66); field('V', 208, 195, 80)
        field('R', 8, 223, 66); field('G', 108, 223, 66); field('B', 208, 223, 80)
        field('A', 8, 251, 66)
        E.text(panel, 'Hex', {Position = UDim2.fromOffset(108, 251), Size = UDim2.fromOffset(28, 20),
            TextColor3 = theme.TextDim, ZIndex = z})
        fields.Hex = E.box(panel, '', {Position = UDim2.fromOffset(138, 251), Size = UDim2.fromOffset(168, 20), ZIndex = z})
        E.text(panel, 'H: degrees  S/V/A: %  RGB: 0–255', {Position = UDim2.fromOffset(8, 280),
            Size = UDim2.fromOffset(298, 20), TextColor3 = theme.TextDim, TextSize = 12, ZIndex = z})
        local draft = E.copy(self.value)
        local h, s, v = draft.color:ToHSV()
        local function hex(value)
            return string.format('#%02X%02X%02X%02X', math.round(value.color.R * 255), math.round(value.color.G * 255),
                math.round(value.color.B * 255), math.round(value.opacity * 255))
        end
        local function paint()
            sv.BackgroundColor3 = Color3.fromHSV(h, 1, 1)
            cursor.Position = UDim2.fromScale(s, 1 - v)
            hueCursor.Position = UDim2.new(0, 0, h, -1)
            alphaColor.BackgroundColor3 = draft.color
            alphaCursor.Position = UDim2.new(draft.opacity, -1, 0, 0)
            local values = {H = h * 360, S = s * 100, V = v * 100, A = draft.opacity * 100,
                R = draft.color.R * 255, G = draft.color.G * 255, B = draft.color.B * 255}
            for name, value in pairs(values) do fields[name].Text = string.format('%.1f', value) end
            fields.Hex.Text = hex(draft)
            display.BackgroundColor3 = draft.color
            display.BackgroundTransparency = 1 - draft.opacity
        end
        local function sync(value)
            draft = E.copy(value)
            local nextH, nextS, nextV = draft.color:ToHSV()
            -- Preserve a chosen hue while the cursor passes through gray/black.
            if nextS > 0 then h = nextH end
            s, v = nextS, nextV
            paint()
        end
        refreshPopup = sync
        local function commit()
            if self.alive and self.enabled then self:_commit(draft) else sync(self.value) end
        end
        E.drag(scope, sv, function(x, y)
            s, v = x, 1 - y
            draft.color = Color3.fromHSV(h, s, v)
            paint()
        end, commit)
        E.drag(scope, hue, function(_, y)
            h = y
            draft.color = Color3.fromHSV(h, s, v)
            paint()
        end, commit)
        E.drag(scope, alpha, function(x)
            draft.opacity = x
            paint()
        end, commit)
        for name, box in pairs(fields) do
            E.connect(scope, box.FocusLost, function()
                if not self.enabled then sync(self.value); return end
                if name == 'Hex' then
                    local text = box.Text:gsub('^#', '')
                    if (#text ~= 6 and #text ~= 8) or not text:match('^%x+$') then sync(self.value); return end
                    local red, green, blue = tonumber(text:sub(1, 2), 16), tonumber(text:sub(3, 4), 16), tonumber(text:sub(5, 6), 16)
                    draft = {color = Color3.fromRGB(red, green, blue), opacity = #text == 8 and tonumber(text:sub(7, 8), 16) / 255 or self.value.opacity}
                    h, s, v = draft.color:ToHSV()
                else
                    local number = tonumber(box.Text)
                    if not number or number ~= number or math.abs(number) == math.huge then sync(self.value); return end
                    if name == 'H' then h = math.clamp(number, 0, 360) / 360
                    elseif name == 'S' then s = math.clamp(number, 0, 100) / 100
                    elseif name == 'V' then v = math.clamp(number, 0, 100) / 100
                    elseif name == 'A' then draft.opacity = math.clamp(number, 0, 100) / 100
                    else
                        number = math.clamp(number, 0, 255) / 255
                        local color = draft.color
                        draft.color = Color3.new(name == 'R' and number or color.R, name == 'G' and number or color.G, name == 'B' and number or color.B)
                        h, s, v = draft.color:ToHSV()
                    end
                    if name == 'H' or name == 'S' or name == 'V' then draft.color = Color3.fromHSV(h, s, v) end
                end
                commit()
                if self.alive and self.popup == panel then sync(self.value) end
            end)
        end
        -- The popup owns this cleanup, including a canceled drag's visual preview.
        scope.colorCleanup = function()
            refreshPopup = nil
            if self.alive then
                display.BackgroundColor3 = self.value.color
                display.BackgroundTransparency = 1 - self.value.opacity
            end
        end
        paint()
        return self
    end
    c.click, c.__hotkeyFunc = c.openPrompt, c.openPrompt
    E.connect(c.scope, click.Activated, function() c:openPrompt() end)
    E.connect(c.scope, click.MouseEnter, function()
        if c.enabled then swatch.BackgroundColor3 = theme.Button2 end
    end)
    E.connect(c.scope, click.MouseLeave, function() swatch.BackgroundColor3 = theme.Button1 end)
    c.render(c.value)
    return c
end

    -- Window/menu/section behavior uses verbatim upstream visual templates.
    local Window = setmetatable({}, {__index = Common}); Window.__index = Window
    local Menu = setmetatable({}, {__index = Common}); Menu.__index = Menu
    local Section = setmetatable({}, {__index = Common}); Section.__index = Section
    function Window:setTitle(text) self.name = tostring(text); self.instances.title.Text = self.name; return self end
    function Window:setIcon(asset) self.instances.titleBar['#icon'].Image = asset; return self end
    function Window:getPosition() return self.instances.mainFrame.Position end
    function Window:getSize(target) return target and self.size or self.instances.mainFrame.Size end
    function Window:setPosition(position,silent)
        if typeof(position) == 'Vector2' then position = UDim2.fromOffset(position.X,position.Y) end
        assert(typeof(position) == 'UDim2','Position must be Vector2 or UDim2')
        local view = E.viewport()
        local x,y = position.X.Scale*view.X+position.X.Offset,position.Y.Scale*view.Y+position.Y.Offset
        self.instances.mainFrame.Position = UDim2.fromOffset(math.clamp(x,0,math.max(0,view.X-80)),math.clamp(y,0,math.max(0,view.Y-26)))
        if not silent then E.dirty() end; return self
    end
    function Window:setSize(size,silent)
        if typeof(size) == 'Vector2' then size = UDim2.fromOffset(size.X,size.Y) end
        assert(typeof(size) == 'UDim2','Size must be Vector2 or UDim2')
        local view = E.viewport()
        self.size = UDim2.fromOffset(math.clamp(size.X.Scale*view.X+size.X.Offset,400,math.max(400,view.X)),
            math.clamp(size.Y.Scale*view.Y+size.Y.Offset,300,math.max(300,view.Y)))
        self.instances.mainFrame.Size = self.minimized and UDim2.fromOffset(self.size.X.Offset,26) or self.size
        if not silent then E.dirty() end; return self
    end
    function Window:setMinimized(value,silent)
        self.minimized = value == true; E.closePopup()
        local mf,icon = self.instances.mainFrame,self.instances.buttonMin['#icon']
        E.animate(self.scope,mf,{Size = self.minimized and UDim2.fromOffset(self.size.X.Offset,26) or self.size})
        self.instances.pageRegion.Visible = not self.minimized; self.instances.sideBar.Visible = not self.minimized
        icon.Image = self.minimized and 'rbxassetid://9642646619' or 'rbxassetid://9801458532'
        icon.Rotation = self.minimized and 45 or 0; icon.ImageColor3 = self.minimized and theme.Primary or theme.TextPrimary
        if not silent then E.dirty() end; return self
    end
    function Window:minimize() return self:setMinimized(not self.minimized) end
    function Window:reopen() self.instances.mainFrame.Visible = true; self:setMinimized(false); return self end
    function Window:setVisible(visible) self.instances.mainFrame.Visible = visible ~= false; E.closePopup(); E.dirty(); return self end
    function Window:setShortcuts(minimizeKey,reopenKey,silent)
        local min,open = E.key(minimizeKey),E.key(reopenKey)
        assert(not min or min ~= open,'Minimize and reopen shortcuts must differ')
        for _,key in ipairs({min or false,open or false}) do
            if key then
                for _,c in pairs(ui.controls) do assert(c.class ~= 'hotkey' or c.value ~= key,'Shortcut conflicts with '..c.id) end
                for _,w in ipairs(ui.windows) do if w ~= self then assert(w.minimizeKey ~= key and w.reopenKey ~= key,'Shortcut conflicts with '..w.id) end end
            end
        end
        self.minimizeKey,self.reopenKey = min,open
        if not silent then E.dirty() end; return self
    end
    function Window:destroy()
        if not self.alive then return self end
        self.alive = false
        while #self.menus > 0 do self.menus[#self.menus]:destroy() end
        if E.popupOwner and E.popupOwner.window == self then E.closePopup() end
        E.clean(self.scope); self.instances.mainFrame:Destroy(); E.ids[self.id] = nil
        local i = table.find(ui.windows,self); if i then table.remove(ui.windows,i) end
        return self
    end
    function Menu:select(silent)
        if not self.alive then return self end
        E.closePopup(); E.closeTooltip()
        for _,m in ipairs(self.window.menus) do
            m.selected = m == self
            m.instances.menuFrame.Visible = m.selected
            m.instances.menuFrame.Position = UDim2.fromOffset(1,1)
            E.animate(m.scope,m.instances.pageSelector,{BackgroundColor3 = m.selected and theme.Button3 or theme.Button1,
                TextColor3 = m.selected and theme.Primary or theme.TextPrimary})
        end
        self.window.selectedMenu = self
        if not silent then E.dirty() end; return self
    end
    function Menu:deselect() self.selected = false; self.instances.menuFrame.Visible = false; return self end
    function Menu:destroy()
        if not self.alive then return self end
        self.alive = false
        while #self.sections > 0 do self.sections[#self.sections]:destroy() end
        E.clean(self.scope); self.instances.menuFrame:Destroy(); self.instances.pageSelector:Destroy(); E.ids[self.id] = nil
        local i = table.find(self.window.menus,self); if i then table.remove(self.window.menus,i) end
        if self.window.selectedMenu == self then
            self.window.selectedMenu = nil
            if self.window.menus[1] then self.window.menus[1]:select(true) end
        end
        return self
    end
    function Section:setCollapsed(value,silent)
        self.minimized = value == true
        self.instances.controlMenu.Visible = not self.minimized
        self.instances.sectionFrame.AutomaticSize = self.minimized and Enum.AutomaticSize.None or Enum.AutomaticSize.Y
        self.instances.sectionFrame.Size = UDim2.new(1,-4,0,16)
        self.instances.minimizeButton['#icon'].Rotation = self.minimized and 180 or 0
        if E.popupOwner and E.popupOwner.section == self then E.closePopup() end
        if not silent then E.dirty() end; return self
    end
    function Section:minimize() return self:setCollapsed(not self.minimized) end
    function Section:reset(silent)
        E.resetControls(self.controls,silent)
        return self
    end
    function Section:destroy()
        if not self.alive then return self end
        self.alive = false
        while #self.controls > 0 do self.controls[#self.controls]:destroy() end
        E.clean(self.scope); self.instances.sectionFrame:Destroy(); E.ids[self.id] = nil
        local i = table.find(self.menu.sections,self); if i then table.remove(self.menu.sections,i) end
        return self
    end
    function Window:addMenu(s)
        assert(self.alive,'Window is destroyed'); s = s or {}
        local menu = setmetatable({id = E.id(s,self.id,'menu'),name = s.text or 'Menu',window = self,sections = {},binds = {},alive = true,scope = E.scope(self.scope),instances = {}},Menu)
        local inst = menu.instances
        inst.menuFrame = elemClasses.menu.instances.menuFrame:Clone()
        inst.leftRegion,inst.rightRegion = inst.menuFrame['#left-region'],inst.menuFrame['#right-region']
        inst.rightRegion.AutomaticSize = Enum.AutomaticSize.Y; inst.rightRegion.Size = UDim2.fromScale(0.5,0)
        inst.menuFrame.CanvasSize = UDim2.new(); inst.menuFrame.AutomaticCanvasSize = Enum.AutomaticSize.Y
        inst.pageSelector = elemClasses.menu.instances.pageSelector:Clone(); inst.pageSelector.Text = menu.name; inst.pageSelector.RichText = false
        inst.pageSelector.LayoutOrder = #self.menus+1
        inst.pageSelector.Parent = self.instances.tabMenu; inst.menuFrame.Parent = self.instances.pageRegion
        table.insert(self.menus,menu)
        E.connect(menu.scope,inst.pageSelector.Activated,function() menu:select() end)
        E.connect(menu.scope,inst.pageSelector.MouseEnter,function() E.animate(menu.scope,inst.pageSelector,{BackgroundColor3 = menu.selected and theme.Button4 or theme.Button2}) end)
        E.connect(menu.scope,inst.pageSelector.MouseLeave,function() E.animate(menu.scope,inst.pageSelector,{BackgroundColor3 = menu.selected and theme.Button3 or theme.Button1}) end)
        E.connect(menu.scope,inst.menuFrame:GetPropertyChangedSignal('CanvasPosition'),function() E.dirty() end)
        if not self.selectedMenu then menu:select(true) else inst.menuFrame.Visible = false end
        return menu
    end
    function Menu:addSection(s)
        assert(self.alive,'Menu is destroyed'); s = s or {}
        local section = setmetatable({id = E.id(s,self.id,'section'),name = s.text or 'Section',menu = self,controls = {},binds = {},
            alive = true,minimized = false,scope = E.scope(self.scope),instances = {}},Section)
        local inst = section.instances
        inst.sectionFrame = elemClasses.section.instances.sectionFrame:Clone()
        local titlebar = inst.sectionFrame['#title-bar']
        inst.title,inst.minimizeButton,inst.controlMenu = titlebar['#title'],titlebar['#min'],inst.sectionFrame['#menu']
        inst.title.Text = section.name; inst.title.RichText = false; inst.title.Size = UDim2.new(1,-34,1,0)
        section.side = s.side == 'left' and 'left' or s.side == 'right' and 'right' or (#self.sections%2 == 0 and 'left' or 'right')
        inst.sectionFrame.Parent = section.side == 'left' and self.instances.leftRegion or self.instances.rightRegion
        inst.sectionFrame.LayoutOrder = #self.sections+1
        inst.controlMenu:FindFirstChildOfClass('UIListLayout').SortOrder = Enum.SortOrder.LayoutOrder
        inst.minimizeButton.Visible = s.showMinButton ~= false
        E.connect(section.scope,inst.minimizeButton.Activated,function() section:minimize() end)
        E.button(titlebar,'↺',{Name = '#reset',Size = UDim2.fromOffset(12,12),Position = UDim2.new(1,-29,0,1),TextSize = 12,ZIndex = 35},section.scope,function() section:reset() end)
        table.insert(self.sections,section)
        return section
    end
    function ui.newWindow(s)
        assert(ui.alive,'GUI is destroyed'); s = s or {}
        local w = setmetatable({id = E.id(s,'ui','window'),name = s.text or 'Dollarware',menus = {},binds = {},alive = true,
            scope = E.scope(),instances = {},minimized = false},Window)
        local inst = w.instances; inst.mainFrame = elemClasses.window.instances.mainFrame:Clone()
        inst.titleBar = inst.mainFrame['#title-bar']; inst.title = inst.titleBar['#title']
        inst.buttonClose,inst.buttonMin = inst.titleBar['#button-close'],inst.titleBar['#button-min']
        inst.sideBar,inst.pageRegion = inst.mainFrame['#sidebar'],inst.mainFrame['#page-region']
        inst.tabMenu,inst.resizeHandle = inst.sideBar['#menu'],inst.mainFrame['#resize-handle']
        inst.gradient = inst.mainFrame['#trim']['#gradient']; inst.titleBar['#fade'].Visible = false
        inst.mainFrame.Parent = uiScreen; inst.resizeHandle.Visible = s.resize == true
        table.insert(ui.windows,w)
        w:setTitle(w.name); if s.icon then w:setIcon(s.icon) end
        w:setSize(s.size or Vector2.new(450,350),true)
        w:setPosition(s.position or UDim2.fromScale(0.6+0.02*(#ui.windows-1),0.6+0.02*(#ui.windows-1)),true)
        w:setShortcuts(s.minimizeKey == nil and (#ui.windows == 1 and 'RightShift' or nil) or s.minimizeKey,s.reopenKey,true)
        E.connect(w.scope,inst.buttonClose.Activated,function()
            if #ui.windows == 1 then ui.destroy() else w:destroy() end
        end)
        E.connect(w.scope,inst.buttonMin.Activated,function() w:minimize() end)
        for _,button in ipairs({inst.buttonClose,inst.buttonMin}) do
            E.connect(w.scope,button.MouseEnter,function() E.animate(w.scope,button,{BackgroundColor3 = theme.Button2}) end)
            E.connect(w.scope,button.MouseLeave,function() E.animate(w.scope,button,{BackgroundColor3 = theme.Button1}) end)
        end
        local start,origin
        E.connect(w.scope,inst.titleBar.InputBegan,function(io)
            if io.UserInputType == Enum.UserInputType.MouseButton1 or io.UserInputType == Enum.UserInputType.Touch then
                start,origin = E.mouse(io),inst.mainFrame.AbsolutePosition
            end
        end)
        E.drag(w.scope,inst.titleBar,function(_,_,point)
            if start and origin then w:setPosition(origin+point-start,true) end
        end,function() start,origin = nil,nil; E.dirty() end)
        if s.resize then
            local resizeStart,originalSize
            E.connect(w.scope,inst.resizeHandle.InputBegan,function(io)
                if io.UserInputType == Enum.UserInputType.MouseButton1 or io.UserInputType == Enum.UserInputType.Touch then resizeStart,originalSize = E.mouse(io),Vector2.new(w.size.X.Offset,w.size.Y.Offset) end
            end)
            E.drag(w.scope,inst.resizeHandle,function(_,_,point)
                if resizeStart and not w.minimized then w:setSize(originalSize+point-resizeStart,true) end
            end,function() resizeStart,originalSize = nil,nil; E.dirty() end)
        end
        inst.tabMenu.Size = UDim2.new(1,-2,1,-42)
        w.profileButton = E.button(inst.sideBar,'Profile: '..ui.profile,{Position = UDim2.new(0,4,1,-38),Size = UDim2.new(1,-8,0,18),TextSize = 12,ZIndex = 54},w.scope,function() ui:openProfiles(w) end)
        w.status = E.text(inst.sideBar,'Ready',{Position = UDim2.new(0,4,1,-18),Size = UDim2.new(1,-8,0,16),TextSize = 12,TextColor3 = theme.TextDim,ZIndex = 54,TextTruncate = Enum.TextTruncate.AtEnd})
        return w
    end
    function E.finish(c)
        if c.normalize then c.default = c.normalize(c.default) end
        if c.render then c.render(c.value) end
        E.refreshDependencies()
        return c
    end
    local constructors = {Toggle = 'addToggle',Button = 'addButton',Label = 'addLabel',Textbox = 'addTextbox',Slider = 'addSlider',Hotkey = 'addHotkey',
        Keybind = 'addHotkey',Dropdown = 'addDropdown',List = 'addList',Container = 'addContainer',ColorPicker = 'addColorPicker'}
    for suffix,method in pairs(constructors) do
        Section['add'..suffix] = function(self,s,callback)
            local count = #self.controls
            local ok,result = pcall(function() return E.finish(E[method](self,s,callback)) end)
            if not ok then
                while #self.controls>count do self.controls[#self.controls]:destroy() end
                error(result,2)
            end
            return result
        end
    end

    -- JSON profiles use an injected adapter, available file APIs, or session memory.
    local storage = options.storage
    if not storage and type(readfile) == 'function' and type(writefile) == 'function' then
        storage = {read = function(key) if type(isfile) ~= 'function' or isfile(key) then return readfile(key) end end,
            write = function(key,text) writefile(key,text) end}
    end
    local storageKey = options.storageKey or 'dollarware-profiles.json'
    local store = {version = 1,active = 'default',profiles = {}}
    ui.persistence = storage and 'Persistent' or 'Session'
    ui.autosave = options.autosave ~= false
    function ui:configureStorage(adapter,key)
        assert(type(adapter) == 'table' and type(adapter.read) == 'function' and type(adapter.write) == 'function','Storage needs read(key) and write(key,text)')
        local nextKey = key or storageKey
        local raw = adapter.read(nextKey)
        local nextStore = {version = 1,active = self.profile,profiles = {}}
        if raw then
            nextStore = http:JSONDecode(raw)
            assert(type(nextStore) == 'table' and nextStore.version == 1 and type(nextStore.profiles) == 'table','Invalid profile store')
        end
        storage,storageKey,store = adapter,nextKey,nextStore
        self.persistence = 'Persistent'
        self.profile = type(store.active) == 'string' and store.active or 'default'
        E.storageError = nil
        if E.status then E.status() end
        return self
    end
    if storage then
        local ok,value = pcall(storage.read,storageKey)
        if ok and value then
            local parsed,data = pcall(http.JSONDecode,http,value)
            if parsed and type(data) == 'table' and data.version == 1 and type(data.profiles) == 'table' then
                store = data; ui.profile = type(data.active) == 'string' and data.active or 'default'
            else E.storageError = 'Invalid profile file; import or save to replace' end
        elseif not ok then E.storageError = tostring(value) end
    end
    local function pack(value)
        if value == nil then return {__dw = 'nil'} end
        if typeof(value) == 'Color3' then return {__dw = 'Color3',r = value.R,g = value.G,b = value.B} end
        if type(value) == 'table' then local out = {}; for k,v in pairs(value) do out[k] = pack(v) end; return out end
        return value
    end
    local function unpackValue(value)
        if type(value) ~= 'table' then return value end
        if value.__dw == 'nil' then return nil end
        if value.__dw == 'Color3' then
            for _,channel in ipairs({'r','g','b'}) do assert(type(value[channel]) == 'number' and value[channel] == value[channel] and math.abs(value[channel]) < math.huge,'Invalid color in profile') end
            return Color3.new(value.r,value.g,value.b)
        end
        local out = {}; for k,v in pairs(value) do out[k] = unpackValue(v) end; return out
    end
    E.pack = pack
    local function rect(value) return {value.X.Scale,value.X.Offset,value.Y.Scale,value.Y.Offset} end
    local function readRect(value)
        assert(type(value) == 'table' and #value == 4,'Invalid layout rectangle')
        for i = 1,4 do assert(type(value[i]) == 'number' and value[i] == value[i] and math.abs(value[i]) < math.huge,'Invalid layout coordinate') end
        return UDim2.new(value[1],value[2],value[3],value[4])
    end
    function ui:exportConfig()
        local config = {version = 1,controls = {},windows = {}}
        for id,c in pairs(ui.controls) do
            if c.alive and c.serializable then config.controls[id] = {kind = c.class,value = pack(c:getValue()),order = c.getOptionOrder and c:getOptionOrder() or nil} end
        end
        for _,w in ipairs(ui.windows) do
            local data = {position = rect(w:getPosition()),size = rect(w.size),minimized = w.minimized,visible = w.instances.mainFrame.Visible,
                selected = w.selectedMenu and w.selectedMenu.id,minimizeKey = w.minimizeKey,reopenKey = w.reopenKey,menus = {}}
            for _,m in ipairs(w.menus) do
                local md = {scroll = {m.instances.menuFrame.CanvasPosition.X,m.instances.menuFrame.CanvasPosition.Y},sections = {}}
                for _,s in ipairs(m.sections) do md.sections[s.id] = {collapsed = s.minimized,side = s.side} end
                data.menus[m.id] = md
            end
            config.windows[w.id] = data
        end
        return config
    end
    function ui:exportJSON() return http:JSONEncode(self:exportConfig()) end
    function ui:importConfig(config,silent)
        if type(config) == 'string' then config = http:JSONDecode(config) end
        assert(type(config) == 'table' and config.version == 1 and type(config.controls) == 'table' and type(config.windows) == 'table','Unsupported profile schema')
        if silent == nil then silent = true end
        local staged,keys,layout = {},{},{}
        -- Validate the entire known state before touching any controls or layout.
        for id,c in pairs(ui.controls) do
            local record = config.controls[id]
            local value = c:getValue()
            if record and c.serializable then
                assert(type(record) == 'table' and record.kind == c.class and record.value ~= nil,'Invalid control record: '..id)
                value = unpackValue(record.value)
                value = c.class == 'hotkey' and E.key(value) or (c.normalize and c.normalize(value) or value)
                local order
                if record.order ~= nil and c.reorderOptions then
                    assert(type(record.order) == 'table','Invalid option order')
                    local remaining,seen = {},{}
                    order = {}
                    for _,key in ipairs(c:getOptionOrder()) do remaining[key] = true end
                    for _,key in ipairs(record.order) do
                        assert(type(key) == 'string' and not seen[key],'Invalid/duplicate option ID in order')
                        seen[key] = true
                        if remaining[key] then order[#order+1] = key; remaining[key] = nil end
                    end
                    for _,key in ipairs(c:getOptionOrder()) do if remaining[key] then order[#order+1] = key end end
                end
                staged[id] = {value = value,order = order,before = c:getValue()}
            end
            if c.class == 'hotkey' and value then assert(not keys[value],'Duplicate profile keybind: '..value); keys[value] = id end
        end
        for _,w in ipairs(ui.windows) do
            local data = config.windows[w.id]
            local min,open = w.minimizeKey,w.reopenKey
            if data then
                assert(type(data) == 'table' and type(data.menus) == 'table','Invalid window state')
                min,open = E.key(data.minimizeKey),E.key(data.reopenKey)
                local valid = {position = readRect(data.position),size = readRect(data.size),data = data}
                for _,md in pairs(data.menus) do
                    assert(type(md) == 'table' and type(md.scroll) == 'table' and type(md.sections) == 'table','Invalid menu state')
                    for i = 1,2 do assert(type(md.scroll[i]) == 'number' and md.scroll[i] == md.scroll[i] and math.abs(md.scroll[i])<math.huge,'Invalid scroll state') end
                end
                layout[w] = valid
            end
            for _,key in ipairs({min or false,open or false}) do
                if key then assert(not keys[key],'Profile shortcut conflict: '..key); keys[key] = w.id end
            end
        end
        E.layoutVersion = (E.layoutVersion or 0)+1
        local layoutVersion = E.layoutVersion
        local previousLoading = E.loading; E.loading = true
        local ok,err = pcall(function()
            E.closePopup(); E.closeTooltip()
            if E.capture then local old = E.capture; E.endCapture(); old.render(old.value) end
            for id,record in pairs(staged) do
                local c = ui.controls[id]
                if record.order and c.reorderOptions then
                    c:reorderOptions(record.order,true)
                end
                c:setValue(record.value,true)
            end
            for w,valid in pairs(layout) do
                local data = valid.data
                w.minimizeKey,w.reopenKey = E.key(data.minimizeKey),E.key(data.reopenKey)
                w:setPosition(valid.position,true); w:setSize(valid.size,true); w:setMinimized(data.minimized,true)
                w.instances.mainFrame.Visible = data.visible ~= false
                for _,m in ipairs(w.menus) do
                    local md = data.menus[m.id]
                    if md then
                        for _,s in ipairs(m.sections) do
                            local sd = md.sections[s.id]
                            if type(sd) == 'table' then
                                s:setCollapsed(sd.collapsed,true)
                                if sd.side == 'left' or sd.side == 'right' then
                                    s.side = sd.side; s.instances.sectionFrame.Parent = sd.side == 'left' and m.instances.leftRegion or m.instances.rightRegion
                                end
                            end
                        end
                        m.instances.menuFrame.CanvasPosition = Vector2.new(math.max(0,md.scroll[1]),math.max(0,md.scroll[2]))
                        -- AutomaticSize settles after reparent/collapse; restore scroll again then.
                        E.delay(m.scope,0,function()
                            if E.layoutVersion ~= layoutVersion then return end
                            local loading = E.loading; E.loading = true
                            m.instances.menuFrame.CanvasPosition = Vector2.new(math.max(0,md.scroll[1]),math.max(0,md.scroll[2]))
                            E.loading = loading
                        end)
                    end
                    if m.id == data.selected then m:select(true) end
                end
            end
        end)
        E.loading = previousLoading; E.refreshDependencies()
        if not ok then error(err,2) end
        if not E.loading then E.dirty() end
        if not silent then
            for id,record in pairs(staged) do
                local c = ui.controls[id]
                if c and not E.equal(record.before,c.value) then E.emit(c,c.value) end
            end
        end
        return self
    end
    local autosaveTask
    function E.status(message)
        for _,w in ipairs(ui.windows) do
            w.profileButton.Text = 'Profile: '..ui.profile..(ui.unsaved and ' *' or '')
            w.status.Text = message or (E.storageError and 'Save error' or (ui.unsaved and 'Unsaved' or 'Saved')..' · '..ui.persistence)
        end
    end
    function E.dirty()
        if E.loading or not ui.alive then return end
        local current = ui:exportConfig()
        ui.unsaved = not E.baseline or not E.equal(current,E.baseline)
        E.status()
        E.cancel(E.root,autosaveTask); autosaveTask = nil
        if ui.autosave and ui.unsaved then autosaveTask = E.delay(E.root,options.autosaveDelay or 0.65,function() autosaveTask = nil; ui:saveProfile(ui.profile) end) end
    end
    local function persist()
        if not storage then return true end
        local ok,err = pcall(function() storage.write(storageKey,http:JSONEncode(store)) end)
        if not ok then E.storageError = tostring(err); E.status('Save failed'); return false,err end
        E.storageError = nil; return true
    end
    local function profileName(name)
        assert(type(name) == 'string','Profile name must be a string')
        name = name:match('^%s*(.-)%s*$')
        assert(#name>0 and #name<=48 and not name:find('[%c]'),'Profile name must be 1–48 printable characters')
        return name
    end
    function ui:saveProfile(name)
        name = profileName(name or self.profile)
        local config = self:exportConfig(); local old = store.profiles[name]; local oldActive = store.active
        store.profiles[name],store.active = config,name
        local ok,err = persist()
        if not ok then store.profiles[name],store.active = old,oldActive; return false,err end
        self.profile,self.unsaved,E.baseline = name,false,E.copy(config)
        E.cancel(E.root,autosaveTask); autosaveTask = nil; E.status()
        return true
    end
    function ui:loadProfile(name)
        name = profileName(name or self.profile)
        local config = store.profiles[name]; if not config then return false,'Profile not found: '..name end
        local previous = {config = self:exportConfig(),profile = self.profile,active = store.active,baseline = E.baseline,unsaved = self.unsaved}
        local ok,err = pcall(self.importConfig,self,E.copy(config),true)
        if not ok then return false,err end
        self.profile,store.active = name,name
        E.baseline,self.unsaved = self:exportConfig(),false
        E.cancel(E.root,autosaveTask); autosaveTask = nil
        local saved,saveError = persist()
        if not saved then
            self:importConfig(previous.config,true)
            self.profile,store.active,E.baseline,self.unsaved = previous.profile,previous.active,previous.baseline,previous.unsaved
            E.cancel(E.root,autosaveTask); autosaveTask = nil
        end
        if saved then E.call(self.binds.onProfileLoaded,name) end
        E.status(); return saved,saveError
    end
    function ui:restore()
        if store.profiles[self.profile] then return self:loadProfile(self.profile) end
        E.baseline,self.unsaved = self:exportConfig(),false; E.status('Ready · '..self.persistence); return true
    end
    function ui:listProfiles()
        local result = {}; for name in pairs(store.profiles) do result[#result+1] = name end; table.sort(result); return result
    end
    function ui:deleteProfile(name)
        name = profileName(name); local old = store.profiles[name]
        if not old then return false,'Profile not found' end
        local previousActive = store.active
        if self.profile == name then store.active = name == 'default' and 'untitled' or 'default' end
        store.profiles[name] = nil
        local ok,err = persist(); if not ok then store.profiles[name],store.active = old,previousActive; return false,err end
        if self.profile == name then
            E.cancel(E.root,autosaveTask); autosaveTask = nil
            self.profile = store.active; E.baseline = nil; self.unsaved = true
        end
        E.status(); return true
    end
    function ui:setAutosave(value)
        self.autosave = value == true
        E.cancel(E.root,autosaveTask); autosaveTask = nil
        if self.autosave and self.unsaved then E.dirty() end
        E.status(); return self
    end
    function E.resetControls(controls,silent)
        local config = ui:exportConfig()
        for _,c in ipairs(controls) do if c.alive and c.serializable then config.controls[c.id].value = pack(c.default) end end
        return ui:importConfig(config,silent == true)
    end
    function ui:reset(silent)
        local controls = {}; for _,c in pairs(self.controls) do controls[#controls+1] = c end
        E.resetControls(controls,silent)
        return self
    end
    function ui:getControl(id) return self.controls[id] end
    function ui:setStatus(message) E.status(tostring(message)); return self end
    local function anchor(w,row)
        return {row = row,window = w,scope = w.scope,alive = w.alive,enabled = true}
    end
    function ui:openProfiles(w)
        w = w or self.windows[1]; if not w or not w.alive then return end
        local owner = anchor(w,w.profileButton); local panel,scope = E.popup(owner,290,300)
        E.text(panel,'Profiles · '..self.persistence,{Position = UDim2.fromOffset(8,4),Size = UDim2.new(1,-16,0,20)})
        local name = E.box(panel,self.profile,{Position = UDim2.fromOffset(8,28),Size = UDim2.new(1,-16,0,22),PlaceholderText = 'Profile name'})
        local notice = E.text(panel,'',{Position = UDim2.fromOffset(8,250),Size = UDim2.new(1,-16,0,20),TextColor3 = theme.TextDim,TextTruncate = Enum.TextTruncate.AtEnd})
        local function action(fn)
            local called,ok,err = pcall(fn)
            notice.Text = called and (ok and 'Done' or tostring(err)) or tostring(ok)
        end
        local holder = E.new('ScrollingFrame',{BackgroundColor3 = theme.Window3,Position = UDim2.fromOffset(8,83),Size = UDim2.new(1,-16,0,128),
            CanvasSize = UDim2.new(),AutomaticCanvasSize = Enum.AutomaticSize.Y,ScrollBarThickness = 1},panel)
        E.new('UIListLayout',{Padding = UDim.new(0,4),SortOrder = Enum.SortOrder.LayoutOrder},holder)
        local listScope
        local function refresh()
            if listScope then E.clean(listScope) end; listScope = E.scope(scope)
            for _,child in ipairs(holder:GetChildren()) do if child:IsA('GuiObject') then child:Destroy() end end
            for i,profile in ipairs(self:listProfiles()) do E.button(holder,profile,{Size = UDim2.new(1,-3,0,20),LayoutOrder = i},listScope,function() name.Text = profile end) end
        end
        E.button(panel,'Save / New',{Position = UDim2.fromOffset(8,56),Size = UDim2.fromOffset(86,20)},scope,function() action(function() return self:saveProfile(name.Text) end); refresh() end)
        E.button(panel,'Load',{Position = UDim2.fromOffset(102,56),Size = UDim2.fromOffset(84,20)},scope,function() local chosen = name.Text; owner:closePopup(); local ok,err = self:loadProfile(chosen); if not ok then self.notify({title = 'Profile',message = tostring(err)}) end end)
        E.button(panel,'Delete',{Position = UDim2.fromOffset(194,56),Size = UDim2.fromOffset(88,20)},scope,function() action(function() return self:deleteProfile(name.Text) end); refresh() end)
        local auto
        auto = E.button(panel,'Autosave: '..tostring(self.autosave),{Position = UDim2.fromOffset(8,220),Size = UDim2.fromOffset(132,20)},scope,function() self:setAutosave(not self.autosave); auto.Text = 'Autosave: '..tostring(self.autosave) end)
        E.button(panel,'Reset all',{Position = UDim2.fromOffset(148,220),Size = UDim2.fromOffset(134,20)},scope,function() self:reset(); notice.Text = 'Defaults restored' end)
        E.button(panel,'Close',{Position = UDim2.fromOffset(8,274),Size = UDim2.new(1,-16,0,18)},scope,function() owner:closePopup() end)
        refresh()
    end
    function ui:openSearch(w)
        w = w or self.windows[1]; if not w or not w.alive then return end
        local owner = anchor(w,w.instances.titleBar); local panel,scope = E.popup(owner,350,280)
        local query = E.box(panel,'',{Position = UDim2.fromOffset(6,6),Size = UDim2.new(1,-12,0,24),PlaceholderText = 'Search settings · Ctrl+F'})
        local results = E.new('ScrollingFrame',{BackgroundTransparency = 1,Position = UDim2.fromOffset(6,36),Size = UDim2.new(1,-12,1,-42),
            CanvasSize = UDim2.new(),AutomaticCanvasSize = Enum.AutomaticSize.Y,ScrollBarThickness = 1},panel)
        E.new('UIListLayout',{Padding = UDim.new(0,4),SortOrder = Enum.SortOrder.LayoutOrder},results)
        local rows
        local function refresh()
            if rows then E.clean(rows) end; rows = E.scope(scope)
            for _,child in ipairs(results:GetChildren()) do if child:IsA('GuiObject') then child:Destroy() end end
            local ids = {}; for id,c in pairs(self.controls) do if c.alive then ids[#ids+1] = id end end; table.sort(ids)
            local q = query.Text:lower(); local count = 0
            for _,id in ipairs(ids) do
                local c = self.controls[id]; local text = c.section.menu.name..' / '..c.section.name..' / '..c.name
                if q == '' or (text..' '..id):lower():find(q,1,true) then
                    count += 1
                    E.button(results,text,{Size = UDim2.new(1,-3,0,24),LayoutOrder = count,TextXAlignment = Enum.TextXAlignment.Left,TextTruncate = Enum.TextTruncate.AtEnd},rows,function()
                        if not c.alive then return end
                        owner:closePopup(); c.window:reopen(); c.section.menu:select(); c.section:setCollapsed(false)
                        local page = c.section.menu.instances.menuFrame
                        page.CanvasPosition = Vector2.new(0,math.max(0,page.CanvasPosition.Y+c.row.AbsolutePosition.Y-page.AbsolutePosition.Y-20))
                        local highlight = E.new('UIStroke',{Color = theme.Primary,Thickness = 1},c.row)
                        c.scope.instances[highlight] = true
                        E.delay(c.scope,0.5,function() c.scope.instances[highlight] = nil; highlight:Destroy() end)
                    end)
                end
            end
            if count == 0 then E.text(results,'No matching settings',{Size = UDim2.new(1,0,0,22),TextColor3 = theme.TextDim}) end
        end
        E.connect(scope,query:GetPropertyChangedSignal('Text'),refresh); refresh(); query:CaptureFocus()
    end
    function ui.notify(s)
        if not ui.alive then return end; s = s or {}
        local cap = math.clamp(math.floor(options.maxNotifications or 4),1,8)
        local function reflow()
            for i,n in ipairs(ui.notifs) do n.frame.Position = UDim2.new(1,-238,1,-(i*66+8)) end
        end
        local function remove(n)
            local i = table.find(ui.notifs,n); if not i then return end
            table.remove(ui.notifs,i); E.clean(n.scope); reflow()
        end
        while #ui.notifs >= cap do remove(ui.notifs[1]) end
        local n = {scope = E.scope()}
        n.frame = E.new('Frame',{Name = '#notification',BackgroundColor3 = theme.Window2,Size = UDim2.fromOffset(230,58),ZIndex = 3600},uiScreen)
        n.scope.instances[n.frame] = true; E.border(n.frame)
        E.text(n.frame,tostring(s.title or 'Dollarware'):sub(1,80),{Position = UDim2.fromOffset(6,2),Size = UDim2.new(1,-28,0,18),TextColor3 = theme.Primary,TextTruncate = Enum.TextTruncate.AtEnd})
        E.text(n.frame,tostring(s.message or ''):sub(1,500),{Position = UDim2.fromOffset(6,22),Size = UDim2.new(1,-12,0,32),TextWrapped = true,TextTruncate = Enum.TextTruncate.AtEnd,TextSize = 13})
        E.button(n.frame,'×',{Position = UDim2.new(1,-22,0,3),Size = UDim2.fromOffset(16,16)},n.scope,function() remove(n) end)
        table.insert(ui.notifs,n); reflow()
        E.delay(n.scope,math.clamp(tonumber(s.duration) or 3,0.5,15),function() remove(n) end)
        return {destroy = function() remove(n) end}
    end
    E.connect(E.root,inputService.InputBegan,function(input,processed)
        local key = input.UserInputType == Enum.UserInputType.Keyboard and input.KeyCode.Name or input.UserInputType.Name
        if E.capture then
            local c = E.capture
            if key == 'Escape' then E.endCapture(); c.render(c.value); return end
            if key == 'Backspace' then E.endCapture(); c:_commit(nil); c.render(c.value); return end
            if input.UserInputType == Enum.UserInputType.Keyboard or key:match('^MouseButton[123]$') then
                local ok,valid = pcall(E.key,key); if not ok then return end
                local conflict = E.conflict(valid,c)
                if conflict then ui.notify({title = 'Keybind conflict',message = conflict}); return end
                E.endCapture(key:match('^MouseButton[123]$') ~= nil); c:_commit(valid); c.render(c.value)
            end
            return
        end
        if key == 'Escape' then E.closePopup(); E.closeTooltip(); return end
        local ctrl = inputService:IsKeyDown(Enum.KeyCode.LeftControl) or inputService:IsKeyDown(Enum.KeyCode.RightControl)
        if key == 'F' and ctrl then ui:openSearch(); return end
        if processed or inputService:GetFocusedTextBox() then return end
        for _,w in ipairs(ui.windows) do
            if key == w.reopenKey then w:reopen(); return end
            if key == w.minimizeKey then w:minimize(); return end
        end
        if E.popupOwner then return end
        for _,c in pairs(ui.controls) do
            if c.class == 'hotkey' and c.enabled and c.value == key then
                local linked = c.linkedControl
                if linked and linked.alive and linked.enabled then
                    if linked.class == 'toggle' then linked:toggle() elseif linked.click then linked:click() end
                else E.call(c.binds.onPressed or c.settings.onPressed,c:getHotkey()) end
                return
            end
        end
    end)
    E.connect(E.root,inputService.WindowFocusReleased,function()
        if activeDrag then activeDrag.cancel() end
        if E.capture then local c = E.capture; E.endCapture(); if c.alive then c.render(c.value) end end
    end)
    function ui:bindToEvent(event,fn) self.binds[event] = fn; return self end
    function ui.destroy()
        if not ui.alive or ui.destroying then return end
        ui.destroying = true
        E.call(ui.binds.onPreDestroy)
        if ui.autosave and ui.unsaved then ui:saveProfile(ui.profile) end
        E.closePopup(); E.closeTooltip(); E.endCapture()
        while #ui.windows > 0 do ui.windows[#ui.windows]:destroy() end
        E.clean(E.root); ui.alive = false
        for _,class in pairs(elemClasses) do
            for _,inst in pairs(class.instances or {}) do inst:Destroy() end
        end
        tooltip.instances.main:Destroy(); hint.instances.main:Destroy(); uiScreen:Destroy()
        table.clear(ui.notifs); table.clear(ui.controls); table.clear(E.ids)
        E.call(ui.binds.onDestroy); table.clear(ui.binds)
    end
    ui.Destroy = ui.destroy
    -- Closing/destroying the ScreenGui externally also tears down owned resources.
    E.connect(E.root,uiScreen.Destroying,function() if ui.alive then ui.destroy() end end)
-- A runnable showcase of the enhanced library; no game-specific behavior.
function ui:demo()
    for _,existing in ipairs(self.windows) do if existing.id == 'dollarware-demo' then existing:reopen(); return existing end end
    local window = self.newWindow({id = 'dollarware-demo',text = 'Dollarware',resize = true,
        size = Vector2.new(720,520),position = UDim2.fromScale(0.16,0.16),minimizeKey = 'RightShift',reopenKey = 'Insert'})
    local general = window:addMenu({id = 'general',text = 'General'})
    local left = general:addSection({id = 'controls',text = 'Controls',side = 'left'})
    local enabled = left:addToggle({id = 'enabled',text = 'Enable preview',default = true})
    local speed = left:addSlider({id = 'speed',text = 'Speed',min = 0,max = 100,step = 0.25,default = 25,units = ' %',dependsOn = 'enabled'})
    left:addDropdown({id = 'mode',text = 'Mode',options = {'Classic','Smooth','Precise'},default = 'Classic'})
    left:addDropdown({id = 'layers',text = 'Layers',multi = true,options = {'Grid','Outline','Glow','Labels','Markers'},default = {'Grid','Outline'}})
    local picker = left:addColorPicker({id = 'accent',text = 'Preview color',color = theme.Primary,opacity = 0.85,dependsOn = 'enabled'})
    left:addHotkey({id = 'preview-bind',text = 'Toggle preview',bind = 'P'}):linkToControl(enabled)
    left:addTextbox({id = 'caption',text = 'Caption',default = 'Dollarware preview',placeholder = 'Preview caption'})
    local right = general:addSection({id = 'live-preview',text = 'Live preview',side = 'right'})
    local preview = right:addContainer({id = 'preview',text = 'Custom content',height = 132,dependsOn = 'enabled'})
    local tile = E.new('Frame',{Position = UDim2.fromOffset(12,12),Size = UDim2.new(1,-24,1,-24),BackgroundColor3 = picker:getColor()},preview.content)
    E.border(tile)
    local caption = E.text(tile,'Dollarware preview',{TextXAlignment = Enum.TextXAlignment.Center,Size = UDim2.fromScale(1,1)})
    local function redraw()
        tile.BackgroundColor3 = picker:getColor(); tile.BackgroundTransparency = 1-picker:getOpacity()
        tile.Size = UDim2.new(0.5+speed:getValue()/200,-24,1,-24)
        caption.Text = self.controls.caption:getValue()
    end
    picker:bindToEvent('onNewColor',redraw); speed:bindToEvent('onNewValue',redraw)
    self.controls.caption:bindToEvent('onFocusLost',redraw)
    self:bindToEvent('onProfileLoaded',redraw)
    local list = right:addList({id = 'items',text = 'Live items',height = 160,items = {'Preview 1','Preview 2','Preview 3'},default = 'Preview 1'})
    local number = 3
    right:addButton({id = 'add-item',text = 'Add a list item'},function() number += 1; list:addItem('Preview '..number) end)
    right:addButton({id = 'notification',text = 'Send notification'},function() self.notify({title = 'Dollarware',message = 'Ready · Ctrl+F searches every setting'}) end)
    local info = window:addMenu({id = 'help',text = 'Help'})
    local help = info:addSection({id = 'shortcuts',text = 'Shortcuts',side = 'left'})
    help:addLabel({id = 'help-1',text = 'Ctrl+F · Search all settings'})
    help:addLabel({id = 'help-2',text = 'RightShift · Minimize / restore'})
    help:addLabel({id = 'help-3',text = 'Insert · Reopen'})
    help:addLabel({id = 'help-4',text = 'P · Toggle preview'})
    help:addLabel({id = 'help-5',text = 'Slider · Double-click to reset'})
    help:addLabel({id = 'help-6',text = '↺ · Reset section'})
    help:addButton({id = 'profiles-button',text = 'Profiles / Reset all'},function() self:openProfiles(window) end)
    local ok,err = self:restore()
    if not ok then self.notify({title = 'Profile',message = tostring(err)}) end
    redraw()
    return window
end

end
return ui
