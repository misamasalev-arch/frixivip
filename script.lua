local plr = game.Players.LocalPlayer

local gui = plr:WaitForChild("PlayerGui")

local ts = game:GetService("TweenService")

local UserInputService = game:GetService("UserInputService")

local vip = {

    primary = Color3.fromRGB(168,85,247),

    secondary = Color3.fromRGB(59,130,246),

    bg = Color3.fromRGB(15,15,25),

    surf = Color3.fromRGB(30,30,45),

    accent = Color3.fromRGB(250,204,21),

    good = Color3.fromRGB(34,197,94),

    txt = Color3.fromRGB(240,240,255)

}

local loadGui = Instance.new("ScreenGui")

loadGui.Name = "vipLoader"

loadGui.ZIndexBehavior = Enum.ZIndexBehavior.Global

loadGui.ResetOnSpawn = false

loadGui.Parent = gui

local blur = Instance.new("BlurEffect")

blur.Size = 0

blur.Parent = game:GetService("Lighting")

local bg = Instance.new("Frame")

bg.Size = UDim2.new(1,0,1,0)

bg.BackgroundColor3 = Color3.fromRGB(5,5,10)

bg.BackgroundTransparency = .1

bg.Parent = loadGui

local wrap = Instance.new("Frame")

wrap.Size = UDim2.new(0,400,0,180)

wrap.Position = UDim2.new(.5,-200,.5,-90)

wrap.BackgroundColor3 = vip.bg

wrap.Parent = loadGui

local wrapCorner = Instance.new("UICorner")

wrapCorner.CornerRadius = UDim.new(0,20)

wrapCorner.Parent = wrap

local wrapStroke = Instance.new("UIStroke")

wrapStroke.Color = vip.primary

wrapStroke.Thickness = 2

wrapStroke.Parent = wrap

local border = Instance.new("Frame")

border.Size = UDim2.new(1,4,1,4)

border.Position = UDim2.new(0,-2,0,-2)

border.BackgroundTransparency = 1

border.Parent = wrap

local g = Instance.new("UIGradient")

g.Color = ColorSequence.new({ColorSequenceKeypoint.new(0, vip.primary), ColorSequenceKeypoint.new(.5, vip.accent), ColorSequenceKeypoint.new(1, vip.primary)})

g.Rotation = 90

g.Parent = border

local brCorner = Instance.new("UICorner")

brCorner.CornerRadius = UDim.new(0,22)

brCorner.Parent = border

local ico = Instance.new("ImageLabel")

ico.Size = UDim2.new(0,60,0,60)

ico.Position = UDim2.new(.5,-30,.2,-30)

ico.BackgroundTransparency = 1

ico.Image = "rbxassetid://6031075938"

ico.ImageColor3 = vip.accent

ico.Parent = wrap

local title = Instance.new("TextLabel")

title.Size = UDim2.new(1,-40,0,30)

title.Position = UDim2.new(0,20,.4,0)

title.BackgroundTransparency = 1

title.Text = "FRIXI VIP LOADER"

title.Font = Enum.Font.GothamBold

title.TextSize = 22

title.TextColor3 = Color3.new(1,1,1)

title.Parent = wrap

local subtitle = Instance.new("TextLabel")

subtitle.Size = UDim2.new(1,-40,0,20)

subtitle.Position = UDim2.new(0,20,.55,0)

subtitle.BackgroundTransparency = 1

subtitle.Text = "Initializing premium features..."

subtitle.Font = Enum.Font.Gotham

subtitle.TextSize = 14

subtitle.TextColor3 = Color3.fromRGB(180,180,200)

subtitle.Parent = wrap

local bar = Instance.new("Frame")

bar.Size = UDim2.new(.8,0,0,16)

bar.Position = UDim2.new(.1,0,.75,0)

bar.BackgroundColor3 = Color3.fromRGB(40,40,60)

bar.Parent = wrap

local barCorner = Instance.new("UICorner")

barCorner.CornerRadius = UDim.new(1,0)

barCorner.Parent = bar

local fill = Instance.new("Frame")

fill.Size = UDim2.new(0,0,1,0)

fill.BackgroundColor3 = vip.primary

fill.Parent = bar

local fillC = Instance.new("UICorner")

fillC.CornerRadius = UDim.new(1,0)

fillC.Parent = fill

local fg = Instance.new("UIGradient")

fg.Color = ColorSequence.new({ColorSequenceKeypoint.new(0, vip.primary), ColorSequenceKeypoint.new(1, vip.secondary)})

fg.Parent = fill

local percent = Instance.new("TextLabel")

percent.Size = UDim2.new(1,0,0,20)

percent.Position = UDim2.new(0,0,.9,0)

percent.BackgroundTransparency = 1

percent.Text = "0%"

percent.Font = Enum.Font.GothamBold

percent.TextSize = 16

percent.TextColor3 = vip.accent

percent.Parent = wrap

task.spawn(function()

    while true do

        g.Rotation = g.Rotation + 1

        task.wait(.01)

    end

end)

for i = 1,100 do

    ts:Create(fill, TweenInfo.new(.02, Enum.EasingStyle.Linear), {Size = UDim2.new(i/100,0,1,0)}):Play()

    percent.Text = i .. "%"

    if i == 30 then subtitle.Text = "Loading core modules..."

    elseif i == 60 then subtitle.Text = "Authenticating premium access..."

    elseif i == 85 then subtitle.Text = "Applying VIP configurations..."

    end

    task.wait(.02)

end

ts:Create(wrap, TweenInfo.new(.5, Enum.EasingStyle.Quad), {Position = UDim2.new(.5,-200,1.5,0)}):Play()

task.wait(.5)

loadGui:Destroy()

local menuGui = Instance.new("ScreenGui")

menuGui.Name = "frixiVipMenu"

menuGui.ZIndexBehavior = Enum.ZIndexBehavior.Global

menuGui.ResetOnSpawn = false

menuGui.Parent = gui

local main = Instance.new("Frame")

main.Size = UDim2.new(0,320,0,220)

main.Position = UDim2.new(.5,-160,.5,-110)

main.BackgroundColor3 = vip.bg

main.BackgroundTransparency = .1

main.Parent = menuGui

local mainC = Instance.new("UICorner")

mainC.CornerRadius = UDim.new(0,24)

mainC.Parent = main

local mainStroke = Instance.new("UIStroke")

mainStroke.Color = vip.primary

mainStroke.Thickness = 2

mainStroke.Transparency = .5

mainStroke.Parent = main

local dragging, dragInput, dragStart, startPos

local function update(input)

    local delta = input.Position - dragStart

    main.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)

end

main.InputBegan:Connect(function(input)

    if input.UserInputType == Enum.UserInputType.MouseButton1 then

        dragging = true

        dragStart = input.Position

        startPos = main.Position

        input.Changed:Connect(function()

            if input.UserInputState == Enum.UserInputState.End then dragging = false end

        end)

    end

end)

main.InputChanged:Connect(function(input)

    if input.UserInputType == Enum.UserInputType.MouseMovement then

        dragInput = input

    end

end)

UserInputService.InputChanged:Connect(function(input)

    if input == dragInput and dragging then update(input) end

end)

local glow = Instance.new("ImageLabel")

glow.Size = UDim2.new(1,40,1,40)

glow.Position = UDim2.new(0,-20,0,-20)

glow.BackgroundTransparency = 1

glow.Image = "rbxassetid://8992230673"

glow.ImageColor3 = vip.primary

glow.ImageTransparency = .8

glow.ScaleType = Enum.ScaleType.Slice

glow.SliceCenter = Rect.new(100,100,100,100)

glow.Parent = main

local header = Instance.new("Frame")

header.Size = UDim2.new(1,0,0,60)

header.BackgroundColor3 = vip.surf

header.Parent = main

local hC = Instance.new("UICorner")

hC.CornerRadius = UDim.new(0,24)

hC.Parent = header

local hGrad = Instance.new("UIGradient")

hGrad.Color = ColorSequence.new({ColorSequenceKeypoint.new(0, vip.primary), ColorSequenceKeypoint.new(1, Color3.fromRGB(30,30,45))})

hGrad.Transparency = NumberSequence.new(.7)

hGrad.Parent = header

local crown = Instance.new("ImageLabel")

crown.Size = UDim2.new(0,36,0,36)

crown.Position = UDim2.new(.1,0,.5,-18)

crown.BackgroundTransparency = 1

crown.Image = "rbxassetid://6031075938"

crown.ImageColor3 = vip.accent

crown.Parent = header

local hTitle = Instance.new("TextLabel")

hTitle.Size = UDim2.new(.7,0,1,0)

hTitle.Position = UDim2.new(.25,0,0,0)

hTitle.BackgroundTransparency = 1

hTitle.Text = "FRIXI VIP ACCESS"

hTitle.Font = Enum.Font.GothamBlack

hTitle.TextSize = 20

hTitle.TextColor3 = vip.txt

hTitle.TextXAlignment = Enum.TextXAlignment.Left

hTitle.Parent = header

local hSub = Instance.new("TextLabel")

hSub.Size = UDim2.new(.7,0,0,20)

hSub.Position = UDim2.new(.25,0,.6,0)

hSub.BackgroundTransparency = 1

hSub.Text = "Premium Script Suite"

hSub.Font = Enum.Font.Gotham

hSub.TextSize = 12

hSub.TextColor3 = Color3.fromRGB(200,200,220)

hSub.TextXAlignment = Enum.TextXAlignment.Left

hSub.Parent = header

local btn = Instance.new("TextButton")

btn.Size = UDim2.new(.8,0,0,56)

btn.Position = UDim2.new(.1,0,.4,0)

btn.BackgroundColor3 = vip.surf

btn.AutoButtonColor = false

btn.Text = ""

btn.Parent = main

local btnC = Instance.new("UICorner")

btnC.CornerRadius = UDim.new(0,16)

btnC.Parent = btn

local btnStroke = Instance.new("UIStroke")

btnStroke.Color = vip.primary

btnStroke.Thickness = 2

btnStroke.Parent = btn

local btnGrad = Instance.new("UIGradient")

btnGrad.Color = ColorSequence.new({ColorSequenceKeypoint.new(0, vip.primary), ColorSequenceKeypoint.new(.5, vip.secondary), ColorSequenceKeypoint.new(1, vip.primary)})

btnGrad.Rotation = 45

btnGrad.Transparency = NumberSequence.new(.5)

btnGrad.Parent = btn

local btnIcon = Instance.new("ImageLabel")

btnIcon.Size = UDim2.new(0,28,0,28)

btnIcon.Position = UDim2.new(.15,0,.5,-14)

btnIcon.BackgroundTransparency = 1

btnIcon.Image = "rbxassetid://6031280882"

btnIcon.ImageColor3 = vip.accent

btnIcon.Parent = btn

local btnText = Instance.new("TextLabel")

btnText.Size = UDim2.new(.6,0,1,0)

btnText.Position = UDim2.new(.3,0,0,0)

btnText.BackgroundTransparency = 1

btnText.Text = "GET SCRIPT"

btnText.Font = Enum.Font.GothamBold

btnText.TextSize = 16

btnText.TextColor3 = vip.txt

btnText.TextXAlignment = Enum.TextXAlignment.Left

btnText.Parent = btn

local btnSub = Instance.new("TextLabel")

btnSub.Size = UDim2.new(.6,0,0,20)

btnSub.Position = UDim2.new(.3,0,.6,0)

btnSub.BackgroundTransparency = 1

btnSub.Text = "Click to receive"

btnSub.Font = Enum.Font.Gotham

btnSub.TextSize = 12

btnSub.TextColor3 = Color3.fromRGB(180,180,200)

btnSub.TextXAlignment = Enum.TextXAlignment.Left

btnSub.Parent = btn

local err = Instance.new("TextLabel")

err.Size = UDim2.new(.8,0,0,40)

err.Position = UDim2.new(.1,0,.75,0)

err.BackgroundTransparency = 1

err.Text = ""

err.Font = Enum.Font.Gotham

err.TextSize = 14

err.TextColor3 = vip.txt

err.Parent = main

ts:Create(main, TweenInfo.new(.8, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {Position = UDim2.new(.5,-160,.5,-110)}):Play()

btn.MouseEnter:Connect(function()

    ts:Create(btnStroke, TweenInfo.new(.2), {Thickness = 3}):Play()

    ts:Create(btnGrad, TweenInfo.new(.2), {Rotation = 90}):Play()

end)

btn.MouseLeave:Connect(function()

    ts:Create(btnStroke, TweenInfo.new(.2), {Thickness = 2}):Play()

    ts:Create(btnGrad, TweenInfo.new(.2), {Rotation = 45}):Play()

end)

btn.MouseButton1Click:Connect(function()

    local link = "https://www.roblox.com/game-pass/1627325973/Unlock-script-VIP"

    pcall(function() setclipboard(link) end)

    err.Text = "Copied to clipboard"

    err.TextColor3 = vip.accent

    ts:Create(err, TweenInfo.new(0.25), {TextColor3 = vip.good}):Play()

    ts:Create(btnGrad, TweenInfo.new(.2), {Rotation = 90}):Play()

    task.wait(.25)

    ts:Create(btnGrad, TweenInfo.new(.2), {Rotation = 45}):Play()

    task.delay(2,function() err.Text = "" end)

end)