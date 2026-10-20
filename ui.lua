local Config = {
    -- [1] PlatoBoost Settings
    ServiceId       = 35093, -- Your PlatoBoost Service ID
    PlatoSecret     = "9b7a24a7-cbe2-4e1f-836d-07083333ec81", -- Your PlatoBoost Secret Key

    -- [2] Anti-Bypass / Global Secret Variable
    Secret          = "320fda38a1b4447b8bcc142e2c1570abac67e8f474f", -- This makes the script ONLY run from the key script. Even if they copy the original obfuscated script to bypass the key, they won't be able to!
    
    -- [3] Scripts & Links
    MainScriptURL   = "https://raw.githubusercontent.com/indnoname/aimbot/refs/heads/main/keyapi", -- The raw URL of your main script
    
    -- [4] Social Media Settings (Set to true to show, false to hide)
    ShowDiscord     = true,
    DiscordURL      = "https://discord.gg/Wbxf5tA38B",
    
    ShowInstagram   = false,
    InstagramURL    = "https://www.instagram.com/oyb0i/",
    
    ShowYoutube     = false,
    YoutubeURL      = "https://www.youtube.com/channel/UCAlXXV1Hbvf7WbfXARuVtiQ",

    -- [5] File System
    KeyFileName     = "Mykey.txt", -- The name of the file where the valid key will be saved for auto-login

    -- [6] GUI Management
    OldGuiName      = "anything", -- Name of the old GUI to destroy if it's already open
    MainGuiName     = "anything", -- Name of the main script's GUI to check if it's already executing

    -- [7] Hub Information & UI Text
    HubName         = "valiant", -- The main title shown at the top of the GUI
    HubDescription  = "https://discord.gg/Wbxf5tA38B" -- The text shown below the title
}

-------------------------------------------------------------------------------
--! LIBRARIES (JSON & CRYPTOGRAPHY) - DO NOT MODIFY
-------------------------------------------------------------------------------
local a=2^32;local b=a-1;local function c(d,e)local f,g=0,1;while d~=0 or e~=0 do local h,i=d%2,e%2;local j=(h+i)%2;f=f+j*g;d=math.floor(d/2)e=math.floor(e/2)g=g*2 end;return f%a end;local function k(d,e,l,...)local m;if e then d=d%a;e=e%a;m=c(d,e)if l then m=k(m,l,...)end;return m elseif d then return d%a else return 0 end end;local function n(d,e,l,...)local m;if e then d=d%a;e=e%a;m=(d+e-c(d,e))/2;if l then m=n(m,l,...)end;return m elseif d then return d%a else return b end end;local function o(p)return b-p end;local function q(d,r)if r<0 then return lshift(d,-r)end;return math.floor(d%2^32/2^r)end;local function s(p,r)if r>31 or r<-31 then return 0 end;return q(p%a,r)end;local function lshift(d,r)if r<0 then return s(d,-r)end;return d*2^r%2^32 end;local function t(p,r)p=p%a;r=r%32;local u=n(p,2^r-1)return s(p,r)+lshift(u,32-r)end;local v={0x428a2f98,0x71374491,0xb5c0fbcf,0xe9b5dba5,0x3956c25b,0x59f111f1,0x923f82a4,0xab1c5ed5,0xd807aa98,0x12835b01,0x243185be,0x550c7dc3,0x72be5d74,0x80deb1fe,0x9bdc06a7,0xc19bf174,0xe49b69c1,0xefbe4786,0x0fc19dc6,0x240ca1cc,0x2de92c6f,0x4a7484aa,0x5cb0a9dc,0x76f988da,0x983e5152,0xa831c66d,0xb00327c8,0xbf597fc7,0xc6e00bf3,0xd5a79147,0x06ca6351,0x14292967,0x27b70a85,0x2e1b2138,0x4d2c6dfc,0x53380d13,0x650a7354,0x766a0abb,0x81c2c92e,0x92722c85,0xa2bfe8a1,0xa81a664b,0xc24b8b70,0xc76c51a3,0xd192e819,0xd6990624,0xf40e3585,0x106aa070,0x19a4c116,0x1e376c08,0x2748774c,0x34b0bcb5,0x391c0cb3,0x4ed8aa4a,0x5b9cca4f,0x682e6ff3,0x748f82ee,0x78a5636f,0x84c87814,0x8cc70208,0x90befffa,0xa4506ceb,0xbef9a3f7,0xc67178f2}local function w(x)return string.gsub(x,".",function(l)return string.format("%02x",string.byte(l))end)end;local function y(z,A)local x=""for B=1,A do local C=z%256;x=string.char(C)..x;z=(z-C)/256 end;return x end;local function D(x,B)local A=0;for B=B,B+3 do A=A*256+string.byte(x,B)end;return A end;local function E(F,G)local H=64-(G+9)%64;G=y(8*G,8)F=F.."\128"..string.rep("\0",H)..G;assert(#F%64==0)return F end;local function I(J)J[1]=0x6a09e667;J[2]=0xbb67ae85;J[3]=0x3c6ef372;J[4]=0xa54ff53a;J[5]=0x510e527f;J[6]=0x9b05688c;J[7]=0x1f83d9ab;J[8]=0x5be0cd19;return J end;local function K(F,B,J)local L={}for M=1,16 do L[M]=D(F,B+(M-1)*4)end;for M=17,64 do local N=L[M-15]local O=k(t(N,7),t(N,18),s(N,3))N=L[M-2]L[M]=(L[M-16]+O+L[M-7]+k(t(N,17),t(N,19),s(N,10)))%a end;local d,e,l,P,Q,R,S,T=J[1],J[2],J[3],J[4],J[5],J[6],J[7],J[8]for B=1,64 do local O=k(t(d,2),t(d,13),t(d,22))local U=k(n(d,e),n(d,l),n(e,l))local V=(O+U)%a;local W=k(t(Q,6),t(Q,11),t(Q,25))local X=k(n(Q,R),n(o(Q),S))local Y=(T+W+X+v[B]+L[B])%a;T=S;S=R;R=Q;Q=(P+Y)%a;P=l;l=e;e=d;d=(Y+V)%a end;J[1]=(J[1]+d)%a;J[2]=(J[2]+e)%a;J[3]=(J[3]+l)%a;J[4]=(J[4]+P)%a;J[5]=(J[5]+Q)%a;J[6]=(J[6]+R)%a;J[7]=(J[7]+S)%a;J[8]=(J[8]+T)%a end;local function Z(F)F=E(F,#F)local J=I({})for B=1,#F,64 do K(F,B,J)end;return w(y(J[1],4)..y(J[2],4)..y(J[3],4)..y(J[4],4)..y(J[5],4)..y(J[6],4)..y(J[7],4)..y(J[8],4))end;local e;local l={["\\"]="\\",["\""]="\"",["\b"]="b",["\f"]="f",["\n"]="n",["\r"]="r",["\t"]="t"}local P={["/"]="/"}for Q,R in pairs(l)do P[R]=Q end;local S=function(T)return"\\"..(l[T]or string.format("u%04x",T:byte()))end;local B=function(M)return"null"end;local v=function(M,z)local _={}z=z or{}if z[M]then error("circular reference")end;z[M]=true;if rawget(M,1)~=nil or next(M)==nil then local A=0;for Q in pairs(M)do if type(Q)~="number"then error("invalid table: mixed or invalid key types")end;A=A+1 end;if A~=#M then error("invalid table: sparse array")end;for a0,R in ipairs(M)do table.insert(_,e(R,z))end;z[M]=nil;return"["..table.concat(_,",").."]"else for Q,R in pairs(M)do if type(Q)~="string"then error("invalid table: mixed or invalid key types")end;table.insert(_,e(Q,z)..":"..e(R,z))end;z[M]=nil;return"{"..table.concat(_,",").."}"end end;local g=function(M)return'"'..M:gsub('[%z\1-\31\\\"]',S)..'"'end;local a1=function(M)if M~=M or M<=-math.huge or M>=math.huge then error("unexpected number value '"..tostring(M).."'")end;return string.format("%.14g",M)end;local j={["nil"]=B,["table"]=v,["string"]=g,["number"]=a1,["boolean"]=tostring}e=function(M,z)local x=type(M)local a2=j[x]if a2 then return a2(M,z)end;error("unexpected type '"..x.."'")end;local a3=function(M)return e(M)end;local a4;local N=function(...)local _={}for a0=1,select("#",...)do _[select(a0,...)]=true end;return _ end;local L=N(" ","\t","\r","\n")local p=N(" ","\t","\r","\n","]","}",",")local a5=N("\\","/",'"',"b","f","n","r","t","u")local m=N("true","false","null")local a6={["true"]=true,["false"]=false,["null"]=nil}local a7=function(a8,a9,aa,ab)for a0=a9,#a8 do if aa[a8:sub(a0,a0)]~=ab then return a0 end end;return#a8+1 end;local ac=function(a8,a9,J)local ad=1;local ae=1;for a0=1,a9-1 do ae=ae+1;if a8:sub(a0,a0)=="\n"then ad=ad+1;ae=1 end end;error(string.format("%s at line %d col %d",J,ad,ae))end;local af=function(A)local a2=math.floor;if A<=0x7f then return string.char(A)elseif A<=0x7ff then return string.char(a2(A/64)+192,A%64+128)elseif A<=0xffff then return string.char(a2(A/4096)+224,a2(A%4096/64)+128,A%64+128)elseif A<=0x10ffff then return string.char(a2(A/262144)+240,a2(A%262144/4096)+128,a2(A%4096/64)+128,A%64+128)end;error(string.format("invalid unicode codepoint '%x'",A))end;local ag=function(ah)local ai=tonumber(ah:sub(1,4),16)local aj=tonumber(ah:sub(7,10),16)if aj then return af((ai-0xd800)*0x400+aj-0xdc00+0x10000)else return af(ai)end end;local ak=function(a8,a0)local _=""local al=a0+1;local Q=al;while al<=#a8 do local am=a8:byte(al)if am<32 then ac(a8,al,"control character in string")elseif am==92 then _=_..a8:sub(Q,al-1)al=al+1;local T=a8:sub(al,al)if T=="u"then local an=a8:match("^[dD][89aAbB]%x%x\\u%x%x%x%x",al+1)or a8:match("^%x%x%x%x",al+1)or ac(a8,al-1,"invalid unicode escape in string")_=_..ag(an)al=al+#an else if not a5[T]then ac(a8,al-1,"invalid escape char '"..T.."' in string")end;_=_..P[T]end;Q=al+1 elseif am==34 then _=_..a8:sub(Q,al-1)return _,al+1 end;al=al+1 end;ac(a8,a0,"expected closing quote for string")end;local ao=function(a8,a0)local am=a7(a8,a0,p)local ah=a8:sub(a0,am-1)local A=tonumber(ah)if not A then ac(a8,a0,"invalid number '"..ah.."'")end;return A,am end;local ap=function(a8,a0)local am=a7(a8,a0,p)local aq=a8:sub(a0,am-1)if not m[aq]then ac(a8,a0,"invalid literal '"..aq.."'")end;return a6[aq],am end;local ar=function(a8,a0)local _={}local A=1;a0=a0+1;while 1 do local am;a0=a7(a8,a0,L,true)if a8:sub(a0,a0)=="]"then a0=a0+1;break end;am,a0=a4(a8,a0)_[A]=am;A=A+1;a0=a7(a8,a0,L,true)local as=a8:sub(a0,a0)a0=a0+1;if as=="]"then break end;if as~=","then ac(a8,a0,"expected ']' or ','")end end;return _,a0 end;local at=function(a8,a0)local _={}a0=a0+1;while 1 do local au,M;a0=a7(a8,a0,L,true)if a8:sub(a0,a0)=="}"then a0=a0+1;break end;if a8:sub(a0,a0)~='"'then ac(a8,a0,"expected string for key")end;au,a0=a4(a8,a0)a0=a7(a8,a0,L,true)if a8:sub(a0,a0)~=":"then ac(a8,a0,"expected ':' after key")end;a0=a7(a8,a0+1,L,true)M,a0=a4(a8,a0)_[au]=M;a0=a7(a8,a0,L,true)local as=a8:sub(a0,a0)a0=a0+1;if as=="}"then break end;if as~=","then ac(a8,a0,"expected '}' or ','")end end;return _,a0 end;local av={['"']=ak,["0"]=ao,["1"]=ao,["2"]=ao,["3"]=ao,["4"]=ao,["5"]=ao,["6"]=ao,["7"]=ao,["8"]=ao,["9"]=ao,["-"]=ao,["t"]=ap,["f"]=ap,["n"]=ap,["["]=ar,["{"]=at}a4=function(a8,a9)local as=a8:sub(a9,a9)local a2=av[as]if a2 then return a2(a8,a9)end;ac(a8,a9,"unexpected character '"..as.."'")end;local aw=function(a8)if type(a8)~="string"then error("expected argument of type string, got "..type(a8))end;local _,a9=a4(a8,a7(a8,1,L,true))a9=a7(a8,a9,L,true)if a9<=#a8 then ac(a8,a9,"trailing garbage")end;return _ end;
local lEncode, lDecode, lDigest = a3, aw, Z;

-------------------------------------------------------------------------------
--! CORE FUNCTIONS (REQUESTS & VERIFICATION)
-------------------------------------------------------------------------------

local useNonce = true 

local function safeRequest(options)
    local req = request or http_request or syn_request or (http and http.request )
    if not req then return nil, "HTTP requests not supported" end
    local success, response = pcall(function() return req(options) end)
    if success and type(response) == "table" then 
        return response 
    else 
       
        return nil, "Connection Error: " .. tostring(response or "Unknown") 
    end
end

local fSetClipboard = setclipboard or toclipboard or function() end
local fStringChar, fToString, fOsTime, fMathRandom, fMathFloor = string.char, tostring, os.time, math.random, math.floor
local fGetHwid = gethwid or function() return game:GetService("RbxAnalyticsService"):GetClientId() end

local cachedLink, cachedTime = "", 0
local host = "https://api.platoboost.com"

local function checkConnectivity( )
    local response, err = safeRequest({Url = host .. "/public/connectivity", Method = "GET"})
    if not response or (response.StatusCode ~= 200 and response.StatusCode ~= 429) then
        host = "https://api.platoboost.net"
        local fallbackResponse, fallbackErr = safeRequest({Url = host .. "/public/connectivity", Method = "GET"})
        if not fallbackResponse then
            return false 
        end
    end
    return true
end

local function generateNonce()
    local str = ""
    for _ = 1, 16 do str = str .. fStringChar(fMathFloor(fMathRandom() * (122 - 97 + 1)) + 97) end
    return str
end

local function cacheLink()
    local isConnected = checkConnectivity()
    if not isConnected then
        return false, "Delta/Network Error! Use VPN or change Executor."
    end
    
    if cachedTime + (10*60) < fOsTime() then
        local response, err = safeRequest({
            Url = host .. "/public/start",
            Method = "POST",
            Body = lEncode({service = Config.ServiceId, identifier = lDigest(fGetHwid())}),
            Headers = {["Content-Type"] = "application/json"}
        })
        if response and response.StatusCode == 200 then
            local decoded = lDecode(response.Body)
            if decoded.success then
                cachedLink = decoded.data.url
                cachedTime = fOsTime()
                return true, cachedLink
            end
        end
        return false, err or "Server Unreachable"
    end
    return true, cachedLink
end

local function redeemKey(key)
    local nonce = generateNonce()
    local body = {identifier = lDigest(fGetHwid()), key = key}
    if useNonce then body.nonce = nonce end
    
    local response, err = safeRequest({
        Url = host .. "/public/redeem/" .. fToString(Config.ServiceId),
        Method = "POST",
        Body = lEncode(body),
        Headers = {["Content-Type"] = "application/json"}
    })
    
    if response and response.StatusCode == 200 then
        local decoded = lDecode(response.Body)
        if decoded.success and decoded.data.valid then
            if useNonce then
                if decoded.data.hash == lDigest("true" .. "-" .. nonce .. "-" .. Config.PlatoSecret) then 
                    if writefile then writefile(Config.KeyFileName, key) end
                    return true, "Success" 
                end
                return false, "Integrity Check Failed"
            end
            if writefile then writefile(Config.KeyFileName, key) end
            return true, "Success"
        end
        return false, decoded.message or "Invalid Key"
    end
    return false, err or "Server Error"
end

-------------------------------------------------------------------------------
--! GUI & MAIN SCRIPT EXECUTION
-------------------------------------------------------------------------------

local function StartMainScript()
    local player = game:GetService("Players").LocalPlayer
    local pGui = player:WaitForChild("PlayerGui")
    
    if pGui:FindFirstChild(Config.OldGuiName) then 
        pGui[Config.OldGuiName]:Destroy() 
        task.wait(0.1)
    end
    
    _G[Config.Secret] = true 
    
    loadstring(game:HttpGet(Config.MainScriptURL))()
end


local function CreateGUI()
    local Players = game:GetService("Players")
    local TweenService = game:GetService("TweenService")
    local UserInputService = game:GetService("UserInputService")

    local player = Players.LocalPlayer
    local playerGui = player:WaitForChild("PlayerGui")

    -- VALIANT / GRAPHITE INTERFACE
    local RED = Color3.fromRGB(218, 60, 76)
    local RED_DARK = Color3.fromRGB(105, 31, 42)
    local BG = Color3.fromRGB(15, 15, 18)
    local PANEL = Color3.fromRGB(24, 24, 29)
    local INPUT_BG = Color3.fromRGB(20, 20, 24)
    local WHITE = Color3.fromRGB(235, 233, 235)
    local MUTED = Color3.fromRGB(151, 148, 154)
    local GREEN = Color3.fromRGB(105, 198, 142)

    local old = playerGui:FindFirstChild("OYB_KeySystem")
    if old then old:Destroy() end

    local coreGui
    pcall(function()
        coreGui = game:GetService("CoreGui")
    end)

    local targetParent = playerGui

    if coreGui then
        local success = pcall(function()
            targetParent = coreGui
        end)
        if not success then
            targetParent = playerGui
        end
    end

    pcall(function()
        local oldCore = coreGui and coreGui:FindFirstChild("OYB_KeySystem")
        if oldCore then oldCore:Destroy() end
    end)

    local socialCount = 0
    if Config.ShowDiscord then socialCount += 1 end
    if Config.ShowInstagram then socialCount += 1 end
    if Config.ShowYoutube then socialCount += 1 end

    local WIDTH = 356
    local HEIGHT = 380 + socialCount * 43

    local ScreenGui = Instance.new("ScreenGui")
    ScreenGui.Name = "OYB_KeySystem"
    ScreenGui.ResetOnSpawn = false
    ScreenGui.IgnoreGuiInset = true
    ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    ScreenGui.DisplayOrder = 100
    ScreenGui.Parent = targetParent

    -- Dim overlay
    local Overlay = Instance.new("Frame")
    Overlay.Name = "Overlay"
    Overlay.Size = UDim2.fromScale(1, 1)
    Overlay.BackgroundColor3 = Color3.new(0, 0, 0)
    Overlay.BackgroundTransparency = 1
    Overlay.BorderSizePixel = 0
    Overlay.ZIndex = 1
    Overlay.Parent = ScreenGui

    local MainFrame = Instance.new("Frame")
    MainFrame.Name = "MainFrame"
    MainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
    MainFrame.Position = UDim2.fromScale(0.5, 0.5)
    MainFrame.Size = UDim2.fromOffset(WIDTH, HEIGHT)
    MainFrame.BackgroundColor3 = BG
    MainFrame.BackgroundTransparency = 1
    MainFrame.BorderSizePixel = 0
    MainFrame.ClipsDescendants = true
    MainFrame.ZIndex = 2
    MainFrame.Parent = ScreenGui

    local Shadow = Instance.new("Frame")
    Shadow.Name = "SoftShadow"
    Shadow.AnchorPoint = Vector2.new(0.5, 0.5)
    Shadow.Position = UDim2.new(0.5, 0, 0.5, 5)
    Shadow.Size = UDim2.fromOffset(WIDTH + 8, HEIGHT + 8)
    Shadow.BackgroundColor3 = Color3.new(0, 0, 0)
    Shadow.BackgroundTransparency = 0.62
    Shadow.BorderSizePixel = 0
    Shadow.ZIndex = 1
    Shadow.Parent = ScreenGui

    local ShadowCorner = Instance.new("UICorner")
    ShadowCorner.CornerRadius = UDim.new(0, 15)
    ShadowCorner.Parent = Shadow

    local Corner = Instance.new("UICorner")
    Corner.CornerRadius = UDim.new(0, 12)
    Corner.Parent = MainFrame

    local Scale = Instance.new("UIScale")
    Scale.Scale = 0.94
    Scale.Parent = MainFrame

    local Stroke = Instance.new("UIStroke")
    Stroke.Color = RED_DARK
    Stroke.Thickness = 1
    Stroke.Transparency = 0.22
    Stroke.Parent = MainFrame

    local function New(className, properties, parent)
        local object = Instance.new(className)

        for property, value in pairs(properties) do
            object[property] = value
        end

        object.Parent = parent
        return object
    end

    local function Round(object, radius)
        local corner = Instance.new("UICorner")
        corner.CornerRadius = UDim.new(0, radius or 7)
        corner.Parent = object
        return corner
    end

    local function AddStroke(object, color, thickness, transparency)
        local stroke = Instance.new("UIStroke")
        stroke.Color = color
        stroke.Thickness = thickness or 1
        stroke.Transparency = transparency or 0
        stroke.Parent = object
        return stroke
    end

    local function Label(name, text, size, position, fontSize, color, font)
        return New("TextLabel", {
            Name = name,
            Text = text,
            Size = size,
            Position = position,
            BackgroundTransparency = 1,
            TextColor3 = color or WHITE,
            Font = font or Enum.Font.Gotham,
            TextSize = fontSize or 13,
            TextXAlignment = Enum.TextXAlignment.Left,
            TextYAlignment = Enum.TextYAlignment.Center,
            BorderSizePixel = 0,
            ZIndex = 4
        }, MainFrame)
    end

    -- Header accent
    local Accent = New("Frame", {
        Name = "TopAccent",
        Size = UDim2.new(1, 0, 0, 3),
        Position = UDim2.new(0, 0, 0, 0),
        BackgroundColor3 = RED,
        BorderSizePixel = 0,
        ZIndex = 5
    }, MainFrame)

    -- Brand mark
    local Logo = New("Frame", {
        Name = "Logo",
        Size = UDim2.fromOffset(40, 40),
        Position = UDim2.fromOffset(20, 22),
        BackgroundColor3 = Color3.fromRGB(40, 13, 19),
        BorderSizePixel = 0,
        ZIndex = 4
    }, MainFrame)

    Round(Logo, 11)
    AddStroke(Logo, RED_DARK, 1, 0.15)

    New("TextLabel", {
        Name = "LogoText",
        Size = UDim2.fromScale(1, 1),
        BackgroundTransparency = 1,
        Text = "v",
        TextColor3 = RED,
        Font = Enum.Font.GothamBlack,
        TextSize = 27,
        ZIndex = 5
    }, Logo)

    Label(
        "BrandTitle",
        "VALIANT",
        UDim2.new(1, -125, 0, 29),
        UDim2.fromOffset(76, 23),
        22,
        WHITE,
        Enum.Font.GothamBlack
    )

    Label(
        "BrandSubtitle",
        "PRIVATE ACCESS  /  CLIENT PORTAL",
        UDim2.new(1, -125, 0, 18),
        UDim2.fromOffset(77, 51),
        9,
        RED,
        Enum.Font.GothamBold
    )

    local CloseBtn = New("TextButton", {
        Name = "CloseButton",
        Size = UDim2.fromOffset(31, 31),
        Position = UDim2.new(1, -42, 0, 22),
        BackgroundColor3 = PANEL,
        Text = "×",
        TextColor3 = MUTED,
        Font = Enum.Font.GothamMedium,
        TextSize = 23,
        AutoButtonColor = false,
        BorderSizePixel = 0,
        ZIndex = 6
    }, MainFrame)

    Round(CloseBtn, 8)

    CloseBtn.MouseEnter:Connect(function()
        TweenService:Create(CloseBtn, TweenInfo.new(0.15), {
            BackgroundColor3 = Color3.fromRGB(65, 18, 26),
            TextColor3 = RED
        }):Play()
    end)

    CloseBtn.MouseLeave:Connect(function()
        TweenService:Create(CloseBtn, TweenInfo.new(0.15), {
            BackgroundColor3 = PANEL,
            TextColor3 = MUTED
        }):Play()
    end)

    local closing = false
    local function CloseGUI()
        if closing then return end
        closing = true
        CloseBtn.Active = false

        TweenService:Create(
            Overlay,
            TweenInfo.new(0.18, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
            {BackgroundTransparency = 1}
        ):Play()

        TweenService:Create(
            MainFrame,
            TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.In),
            {BackgroundTransparency = 1}
        ):Play()

        TweenService:Create(
            Scale,
            TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.In),
            {Scale = 0.96}
        ):Play()

        task.delay(0.22, function()
            if ScreenGui and ScreenGui.Parent then
                ScreenGui:Destroy()
            end
        end)
    end

    CloseBtn.MouseButton1Click:Connect(CloseGUI)

    -- Description
    Label(
        "Description",
        Config.HubDescription,
        UDim2.new(1, -44, 0, 34),
        UDim2.fromOffset(22, 76),
        12,
        MUTED
    ).TextWrapped = true

    -- Divider
    New("Frame", {
        Name = "HeaderDivider",
        Size = UDim2.new(1, -44, 0, 1),
        Position = UDim2.fromOffset(22, 116),
        BackgroundColor3 = Color3.fromRGB(45, 43, 48),
        BorderSizePixel = 0,
        ZIndex = 3
    }, MainFrame)

    local currentY = 130

    -- Social buttons
    local function AddSocialButton(name, text, url, color)
        local button = New("TextButton", {
            Name = name,
            Size = UDim2.new(1, -44, 0, 35),
            Position = UDim2.fromOffset(22, currentY),
            BackgroundColor3 = PANEL,
            Text = "",
            AutoButtonColor = false,
            BorderSizePixel = 0,
            ZIndex = 4
        }, MainFrame)

        Round(button, 8)
        AddStroke(button, Color3.fromRGB(48, 46, 51), 1, 0.2)

        New("Frame", {
            Name = "ColorAccent",
            Size = UDim2.new(0, 3, 1, -12),
            Position = UDim2.fromOffset(8, 6),
            BackgroundColor3 = color,
            BorderSizePixel = 0,
            ZIndex = 5
        }, button)

        New("TextLabel", {
            Name = "ButtonText",
            Size = UDim2.new(1, -35, 1, 0),
            Position = UDim2.fromOffset(22, 0),
            BackgroundTransparency = 1,
            Text = text,
            TextColor3 = WHITE,
            Font = Enum.Font.GothamBold,
            TextSize = 11,
            TextXAlignment = Enum.TextXAlignment.Left,
            ZIndex = 5
        }, button)

        New("TextLabel", {
            Name = "Arrow",
            Size = UDim2.fromOffset(25, 35),
            Position = UDim2.new(1, -30, 0, 0),
            BackgroundTransparency = 1,
            Text = "›",
            TextColor3 = color,
            Font = Enum.Font.GothamBold,
            TextSize = 21,
            ZIndex = 5
        }, button)

        button.MouseEnter:Connect(function()
            TweenService:Create(button, TweenInfo.new(0.15), {
                BackgroundColor3 = Color3.fromRGB(37, 27, 31)
            }):Play()
        end)

        button.MouseLeave:Connect(function()
            TweenService:Create(button, TweenInfo.new(0.15), {
                BackgroundColor3 = PANEL
            }):Play()
        end)

        button.MouseButton1Click:Connect(function()
            pcall(function()
                fSetClipboard(url)
            end)

            Status.Text = text .. " LINK COPIED"
            Status.TextColor3 = color
        end)

        currentY += 43
    end

    if Config.ShowDiscord then
        AddSocialButton(
            "DiscordButton",
            "DISCORD COMMUNITY",
            Config.DiscordURL,
            Color3.fromRGB(115, 135, 255)
        )
    end

    if Config.ShowInstagram then
        AddSocialButton(
            "InstagramButton",
            "INSTAGRAM",
            Config.InstagramURL,
            Color3.fromRGB(240, 85, 135)
        )
    end

    if Config.ShowYoutube then
        AddSocialButton(
            "YoutubeButton",
            "YOUTUBE CHANNEL",
            Config.YoutubeURL,
            RED
        )
    end

    if socialCount > 0 then
        New("Frame", {
            Name = "SocialDivider",
            Size = UDim2.new(1, -44, 0, 1),
            Position = UDim2.fromOffset(22, currentY + 1),
            BackgroundColor3 = Color3.fromRGB(45, 43, 48),
            BorderSizePixel = 0,
            ZIndex = 3
        }, MainFrame)

        currentY += 13
    end

    Label(
        "KeyLabel",
        "YOUR ACCESS KEY",
        UDim2.new(1, -44, 0, 19),
        UDim2.fromOffset(22, currentY),
        10,
        RED,
        Enum.Font.GothamBold
    )

    currentY += 25

    local KeyInput = New("TextBox", {
        Name = "KeyInput",
        Size = UDim2.new(1, -44, 0, 43),
        Position = UDim2.fromOffset(22, currentY),
        BackgroundColor3 = INPUT_BG,
        Text = "",
        PlaceholderText = "Paste your key here",
        PlaceholderColor3 = Color3.fromRGB(112, 108, 116),
        TextColor3 = WHITE,
        Font = Enum.Font.Code,
        TextSize = 13,
        ClearTextOnFocus = false,
        TextXAlignment = Enum.TextXAlignment.Left,
        BorderSizePixel = 0,
        ZIndex = 4
    }, MainFrame)

    Round(KeyInput, 8)
    local InputStroke = AddStroke(
        KeyInput,
        Color3.fromRGB(53, 50, 56),
        1,
        0
    )

    -- Left padding
    New("UIPadding", {
        PaddingLeft = UDim.new(0, 12),
        PaddingRight = UDim.new(0, 10)
    }, KeyInput)

    KeyInput.Focused:Connect(function()
        TweenService:Create(InputStroke, TweenInfo.new(0.15), {
            Color = RED,
            Transparency = 0
        }):Play()
    end)

    KeyInput.FocusLost:Connect(function()
        TweenService:Create(InputStroke, TweenInfo.new(0.15), {
            Color = Color3.fromRGB(53, 50, 56),
            Transparency = 0
        }):Play()
    end)

    currentY += 55

    -- Buttons: fixed widths with a clear 12px gap between them
    local function MakeButton(name, text, x, color)
        local button = New("TextButton", {
            Name = name,
            Size = UDim2.fromOffset(147, 42),
            Position = UDim2.fromOffset(x, currentY),
            BackgroundColor3 = color,
            BackgroundTransparency = 0,
            Text = text,
            TextColor3 = WHITE,
            Font = Enum.Font.GothamBold,
            TextSize = 11,
            AutoButtonColor = false,
            BorderSizePixel = 0,
            ZIndex = 4
        }, MainFrame)

        Round(button, 10)

        local stroke = AddStroke(
            button,
            color == RED
                and Color3.fromRGB(255, 95, 110)
                or Color3.fromRGB(65, 65, 76),
            1,
            0.25
        )

        button.MouseEnter:Connect(function()
            TweenService:Create(
                button,
                TweenInfo.new(0.18, Enum.EasingStyle.Quad),
                {
                    BackgroundColor3 = color:Lerp(
                        Color3.new(1, 1, 1), 0.1
                    )
                }
            ):Play()

            TweenService:Create(
                stroke,
                TweenInfo.new(0.18),
                {Transparency = 0}
            ):Play()
        end)

        button.MouseLeave:Connect(function()
            TweenService:Create(
                button,
                TweenInfo.new(0.18, Enum.EasingStyle.Quad),
                {BackgroundColor3 = color}
            ):Play()

            TweenService:Create(
                stroke,
                TweenInfo.new(0.18),
                {Transparency = 0.25}
            ):Play()
        end)

        return button
    end

    local VerifyBtn = MakeButton(
        "VerifyButton",
        "VERIFY KEY",
        22,
        RED
    )

    local GetKeyBtn = MakeButton(
        "GetKeyButton",
        "GET ACCESS LINK  ↗",
        181,
        Color3.fromRGB(34, 33, 38)
    )

    currentY += 52

    local Status = Label(
        "StatusLabel",
        "●  READY  —  WAITING FOR KEY",
        UDim2.new(1, -44, 0, 22),
        UDim2.fromOffset(22, currentY),
        10,
        MUTED,
        Enum.Font.GothamMedium
    )

    Status.TextWrapped = true

    currentY += 25

    -- Footer
    New("Frame", {
        Name = "FooterDivider",
        Size = UDim2.new(1, -44, 0, 1),
        Position = UDim2.fromOffset(22, currentY),
        BackgroundColor3 = Color3.fromRGB(45, 43, 48),
        BorderSizePixel = 0,
        ZIndex = 3
    }, MainFrame)

    Label(
        "Footer",
        "VALIANT     •     ACCESS PORTAL",
        UDim2.new(1, -44, 0, 22),
        UDim2.fromOffset(22, currentY + 5),
        9,
        Color3.fromRGB(115, 111, 119),
        Enum.Font.GothamBold
    )

    -- Dynamic height
    HEIGHT = currentY + 36
    MainFrame.Size = UDim2.fromOffset(WIDTH, HEIGHT)
    Shadow.Size = UDim2.fromOffset(WIDTH + 8, HEIGHT + 8)

    -- Drag support
    local dragging = false
    local dragStart
    local startPosition

    local function updateDrag(input)
        local delta = input.Position - dragStart

        MainFrame.Position = UDim2.new(
            startPosition.X.Scale,
            startPosition.X.Offset + delta.X,
            startPosition.Y.Scale,
            startPosition.Y.Offset + delta.Y
        )
    end

    local dragArea = Logo

    dragArea.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1
            or input.UserInputType == Enum.UserInputType.Touch then

            dragging = true
            dragStart = input.Position
            startPosition = MainFrame.Position

            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    dragging = false
                end
            end)
        end
    end)

    UserInputService.InputChanged:Connect(function(input)
        if dragging and (
            input.UserInputType == Enum.UserInputType.MouseMovement
            or input.UserInputType == Enum.UserInputType.Touch
        ) then
            updateDrag(input)
        end
    end)

    -- Button loading state
    local busy = false

    VerifyBtn.MouseButton1Click:Connect(function()
        if busy then return end

        local key = KeyInput.Text
        if key == "" then
            Status.Text = "●  PLEASE ENTER YOUR KEY"
            Status.TextColor3 = RED
            return
        end

        busy = true
        VerifyBtn.Text = "VERIFYING..."
        Status.Text = "●  VERIFYING ACCESS KEY..."
        Status.TextColor3 = MUTED

        task.spawn(function()
            local callOK, success, msg = pcall(redeemKey, key)

            if not callOK then
                success = false
                msg = "Verification error"
            end

            if not ScreenGui.Parent then return end

            if success then
                Status.Text = "●  ACCESS GRANTED"
                Status.TextColor3 = GREEN
                VerifyBtn.Text = "ACCESS GRANTED"

                task.wait(0.5)

                if ScreenGui.Parent then
                    CloseGUI()
                    task.delay(0.23, StartMainScript)
                end
            else
                Status.Text = "●  " .. tostring(msg)
                Status.TextColor3 = RED
                VerifyBtn.Text = "VERIFY KEY"
                busy = false
            end
        end)
    end)

    GetKeyBtn.MouseButton1Click:Connect(function()
        if busy then return end

        busy = true
        GetKeyBtn.Text = "PLEASE WAIT..."
        Status.Text = "●  GENERATING KEY LINK..."
        Status.TextColor3 = MUTED

        task.spawn(function()
            local callOK, success, result = pcall(cacheLink)

            if not ScreenGui.Parent then return end

            if callOK and success then
                local copied = pcall(function()
                    fSetClipboard(result)
                end)

                if copied then
                    Status.Text = "●  KEY LINK COPIED"
                    Status.TextColor3 = GREEN
                else
                    Status.Text = "●  LINK READY"
                    Status.TextColor3 = RED
                end
            else
                Status.Text = "●  " .. tostring(result or "Connection error")
                Status.TextColor3 = RED
            end

            GetKeyBtn.Text = "GET ACCESS LINK  ↗"
            busy = false
        end)
    end)

    -- Saved-key auto login
    if isfile and readfile then
        local fileOK, exists = pcall(isfile, Config.KeyFileName)

        if fileOK and exists then
            task.spawn(function()
                local readOK, savedKey = pcall(readfile, Config.KeyFileName)

                if not readOK or type(savedKey) ~= "string"
                    or savedKey == "" or not ScreenGui.Parent then
                    return
                end

                busy = true
                Status.Text = "●  CHECKING SAVED KEY..."
                Status.TextColor3 = MUTED

                local callOK, success, msg = pcall(redeemKey, savedKey)

                if not ScreenGui.Parent then return end

                if callOK and success then
                    Status.Text = "●  AUTO LOGIN SUCCESS"
                    Status.TextColor3 = GREEN

                    task.wait(0.5)

                    if ScreenGui.Parent then
                        CloseGUI()
                        task.delay(0.23, StartMainScript)
                    end
                else
                    Status.Text = "●  SAVED KEY INVALID"
                    Status.TextColor3 = RED
                    busy = false
                end
            end)
        end
    end

    -- Open animation: subtle, smooth scale-up (94% -> 100%) + fade
    -- Uses Quad easing to avoid the large bounce/overshoot effect.
    TweenService:Create(
        Overlay,
        TweenInfo.new(0.28, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
        {BackgroundTransparency = 0.4}
    ):Play()

    TweenService:Create(
        MainFrame,
        TweenInfo.new(0.38, Enum.EasingStyle.Quart, Enum.EasingDirection.Out),
        {BackgroundTransparency = 0}
    ):Play()

    TweenService:Create(
        Scale,
        TweenInfo.new(0.38, Enum.EasingStyle.Quart, Enum.EasingDirection.Out),
        {Scale = 1}
    ):Play()

    task.delay(0.42, function()
        if Overlay and Overlay.Parent then
            TweenService:Create(
                Overlay,
                TweenInfo.new(0.22, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                {BackgroundTransparency = 1}
            ):Play()
        end
    end)
end

local player = game:GetService("Players").LocalPlayer
local pGui = player:WaitForChild("PlayerGui")

if pGui:FindFirstChild(Config.MainGuiName) then
    StartMainScript() 
    return
end

CreateGUI()
