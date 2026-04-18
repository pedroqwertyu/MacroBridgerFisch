#Include FindText.ahk
#Requires AutoHotkey v2.0

FindText(, , 0)
MsgBox "Atenção, bote sua vara no '9', a bait no '0' e olhe para a agua quando for pescar. `nEVITE: `n- jogar acima de 60 fps`n- pescar com o gráfico acima de 3. `n- pescar em lugares altos. `n- pescar lugares sem muito espaço e/ou muito relevo."

global modoAtual := "auto"

global HUD := Gui("-Caption +ToolWindow +AlwaysOnTop")
HUD.BackColor := "0F0F0F"

; Título
HUD.SetFont("s8 w400 c666666", "Consolas")
HUD.Add("Text", "x0 y10 w210 Center", "Bridger Autofisch by pororoca")

; --- Modos (coluna esquerda) ---
HUD.SetFont("s8 w400 c00ff4c", "Consolas")
HUD.Add("Text", "x14 y35 vModoAuto", "◉ Full Auto").OnEvent("Click", (*) => SelecionarModo("auto"))

HUD.SetFont("s8 w400 c666666", "Consolas")
HUD.Add("Text", "x14 y53 w90 vModoMinigame", "○ Minigame").OnEvent("Click", (*) => SelecionarModo("minigame"))

HUD.SetFont("s8 w400 c666666", "Consolas")
HUD.Add("Text", "x14 y71 w90 vModoAutoclick", "○ Autoclick").OnEvent("Click", (*) => SelecionarModo("autoclick"))

; --- Estado (coluna direita) ---
HUD.SetFont("s8 w700 cffffff", "Consolas")
HUD.Add("Text", "x157 y35", "Estado:")

HUD.SetFont("s8 w700 cFF5F5F", "Consolas")
HUD.Add("Text", "x115 y53 w81 Right vStatusText", "DESLIGADO")

; --- Rodapé ---
HUD.SetFont("s7 w400 c333333", "Consolas")
HUD.Add("Text", "x0 y97 w210 Center", "F1 Toggle  ·  F2 Sair")

; --- Funções ---
SelecionarModo(modo) {
    global modoAtual
    modoAtual := modo

    HUD["ModoAuto"].SetFont(modo = "auto" ? "s8 w400 c00ff4c" : "s8 w400 c666666", "Consolas")
    HUD["ModoAuto"].Text := modo = "auto" ? "◉ Full Auto" : "○ Full Auto"

    HUD["ModoMinigame"].SetFont(modo = "minigame" ? "s8 w400 c00ff4c" : "s8 w400 c666666", "Consolas")
    HUD["ModoMinigame"].Text := modo = "minigame" ? "◉ Minigame" : "○ Minigame"

    HUD["ModoAutoclick"].SetFont(modo = "autoclick" ? "s8 w400 c00ff4c" : "s8 w400 c666666", "Consolas")
    HUD["ModoAutoclick"].Text := modo = "autoclick" ? "◉ Autoclick" : "○ Autoclick"
}

; --- Exibição e arraste ---
HUD.Show("w210 h120 x" . ((A_ScreenWidth / 2) - 105) . " y" . ((A_ScreenHeight / 2) - 54) . " NoActivate")

OnMessage(0x0201, WM_LBUTTONDOWN)
WM_LBUTTONDOWN(wParam, lParam, msg, hwnd) {
    PostMessage(0xA1, 2, , , HUD.Hwnd)
}

global offSetRange := 50

global teclaF :=
    "|<>**50$36.00000000000S00000SDzzzzqTzzzzqM00006S00006C0000620000620zz0620zzzq20U03q20U00o30U00w30U00Q30U00031U00031U00031U00031U00031U00031U0C031U0S031U0O031zzm030002030002030006030006030006031zzq031U0K031U0K031U0S031U00031U00031U00031U00030U00030U00030U00020U00020U00020U00020U00020k00020k000C0y000Q0C000M06000Tzy000000000U"
global teclaG :=
    "|<>**80$41.000Ds3U00DzzrU03s01v00S000601k000A0C0000M0s0T00k3U7zw1U60w0S30M3U07Y1UA003820k003EA1U006UE600071U8000030k00004100000M200000kA00001UM000020U000041000008200000E400000U8000010E000020U000041000Tzs2000U0k4001k7UA003kB0M000UG0E0010a0U0021A1U00428100084E3000E8k6000UEU60010VU6002110C00A230C01k43070S08303zU0E700000U300003030000S03k003k01w03w000Dzy02"
global teclaR :=
    "|<>**50$42.0000000Dzzz000Tzzzy00M000DU0S0001s0C0000Q020000C020zz06020w7k3020U0s3020U0Q1030U0A1U30U061U30U061U31U061U31U061U31U061U31U061U31U061U31U0A1U31U0A1031U0s3031U7k3031zz06031zk0A031U00Q031k01k031s0DU031s3y0031g1U0031a0k0031X0s0031VUA0031VkC0031Us70031UM30030UA1U030UC0k030U60M020U30A020U1UC020U1U7020U0k3U20k0M1U20k0M0kC0y0w0SQ0C0k0CM060U02Tzy0zzy0000000U"
global teclaT :=
    "|<>**50$39.0000003k0000QP00006XTw01zoNzzzzwn000006M00000n000006M00000n3zUDy6Pzw1zynM0U80qS04102nk0U80S004100000kM00006300000kM00006300000kM00006300000kM00006300000kM00006300000kM00006300000kM00006300000kM00006300000kM00006300000kM00006300000kM00006300000kM00006300000U800004100000U800004100000U800004100000U8000041U000DUDU001k0Q000A01U001zzw00000000U"
    global hexPeixe := [0x001519, 0x49A8B7, 0x468699, 0x4E898C, 0x438188, 0x477B82, 0x5AA8B2, 0x48908C, 0x1d4b4f]
    global hexBolinha := [0xD92827, 0x5C0503, 0xFF2D2D]
    global hexTextoCaixa := [0x4a86bc, 0x2c679d, 0x265287]
    global hexCaixa := [0x201714]
    
global teclas := Map(
    "f", teclaF,
    "g", teclaG,
    "r", teclaR,
    "t", teclaT
)

global ativo := false

F1:: {
    global ativo, modoAtual
    ativo := !ativo
    HUD["StatusText"].Text := ativo ? "ATIVO" : "DESLIGADO"
    HUD["StatusText"].Opt(ativo ? "c00ff4c" : "cFF5F5F")

    if ativo {
        if modoAtual = "auto"
            SetTimer(Main, 20)
        else if modoAtual = "minigame"
            SetTimer(ChecarMinigame.Bind(offSetRange), 20)
        else if modoAtual = "autoclick"
            SetTimer(Autoclick, 20)
    } else {
        SetTimer(Main, 0)
        SetTimer(ChecarMinigame.Bind(offSetRange), 0)
        SetTimer(Autoclick, 0)
        ToolTip("")
    }
}

Autoclick(){
    Click
    Sleep 200
}

Main() {
    PegarNaVara()
    loop {
        if !ativo {
            break
        }
        Pescar()
        Sleep(400)
        minigameApareceu := ChecarMinigame(offSetRange)
        if minigameApareceu = true {
            iniciouMinigame := A_TickCount
            ToolTip("Fazendo o minigame das teclas...")
            loop {
                ChecarMinigame(offSetRange)
                Sleep(50)
                if A_TickCount - iniciouMinigame >= 4000 {
                    ToolTip("terminado")
                    break
                }
            }
            iniciouContagem := A_TickCount
            loop {
                pegouBau := ChecarItem(975,171,offSetRange,5,hexTextoCaixa)
                if pegouBau = true{
                    ToolTip("Pegou um baú")
                    Send "{Control}"
                    Send "{Control}"
                    MouseMove(0, -350, 0, "R")
                    loop {
                        acharBau := ChecarItem(966,340,1,10,hexCaixa)
                        if acharBau = false{
                            Send "{w down}"
                            Sleep 50
                            Send "{w up}"
                            Sleep 50
                        } else{
                            ToolTip("Achou bau")
                            Sleep 700
                            Send "{e down}"
                            Sleep 2000
                            Send "{e up}"
                            break
                        }
                    }
                    break
                }
                if A_TickCount - iniciouContagem >= 1000{
                    ToolTip("Pegou um item raro")
                    break
                }
            }
        }
    }
}


Pescar() {
    Send 0
    Click
    Sleep(300)
    Send 9
    Sleep(500)
    Click
    sleep(1500)
    inicioBolinha := A_TickCount
    loop {
        bolinhaApareceu := ChecarItem(975,171,offSetRange,20,hexBolinha)
        if bolinhaApareceu = true {
            ToolTip("Pescando...")
            break
        }
        if A_TickCount - inicioBolinha >= 2000 {
            MouseMove(5, 5, , "R")
            ToolTip("Bugou, pera aí")
            return
        }
    }
    Sleep(500)
    inicio := A_TickCount
    loop {
        peixeApareceu := ChecarItem(975,171,(offSetRange+20), 4, hexPeixe)
        if peixeApareceu && A_TickCount - inicio >= 4000 {
            ToolTip("Peixe foi achado")
            Sleep(700)
            Click
            return
        } else if A_TickCount - inicio >= 25000 {
            ToolTip("Não achei, pera aí")
            return
        }
        if !ativo {
            break
        }
    }
}

ChecarItem(pontoX, pontoY, offSet, tolerancia, array) {

    for _, cor in array {
        encontrou := PixelSearch(&px, &py, pontoX - offSet, pontoY - offSet, pontoX + offSet, pontoy + offSet, cor, tolerancia)
        if encontrou {
            return true
        }
    }
    return false
}

ChecarMinigame(offSet) {
    global teclas
    for tecla, padrao in teclas {
        teclaAtual := FindText(&X, &Y, 961 - offSet, 551 - offSet, 961 + offSet, 551 + offSet, 0.1, 0.1, padrao)
        if teclaAtual {
            Send(tecla)
            return true
        }
    }
    return false
}

PegarNaVara() {

    Send "{i Down}"
    sleep 1400
    Send "{i Up}"
    Send "{o Down}"
    sleep 500
    Send "{o Up}"
    Send "{Control}"
    MouseGetPos(&xPos, &yPos)
    loop 3 {
        MouseMove(xPos, yPos + (A_Index * (500 // 3)), 0)
        Sleep(50)
    }
    Sleep(300)
    Send "{Control}"
    Sleep(200)
    MouseMove(0, -350, 0, "R")
}

F2:: {
    ExitApp
}
