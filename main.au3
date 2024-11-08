; C?u hình du?ng d?n file TXT
Global $txtFile = "D:\data_reddit\data.txt"  ; duong dan data

; Hàm d?c d? li?u t? file TXT
Func ReadTXT($filePath)
    Local $file = FileOpen($filePath, 0)
    If $file = -1 Then
        MsgBox(0, "Error", "Da co van de voi file du lieu txt")
        Exit
    EndIf

    Local $data[0][2] ; luu du lieu bai dang
    Local $line
    Local $i = 0

    While 1
        $line = FileReadLine($file)
        If @error = -1 Then ExitLoop

        Local $fields = StringSplit($line, "|")
        ReDim $data[UBound($data) + 1][2]
        $data[$i][0] = $fields[1] ; title
        $data[$i][1] = $fields[2] ; body post
        $i += 1
    WEnd
    FileClose($file)
    Return $data
EndFunc

Func PostToReddit($title, $body)
    ; Mo Firefõ
	TrayTip("Bat dau thuc thi - Firefox Ver.", "AutoPost Reddit", 10, 1)
	Sleep(3000)
	TrayTip("", "", "")
    ShellExecute("C:\Program Files\Mozilla Firefox\firefox.exe", "https://www.reddit.com/submit")

    Sleep(6000) ; doi load trang


; nhay tab toi truogn chon subreddit (dropdown list opt_)
    Send("{TAB 12}")

	Send("{space}")
	Sleep(3000)
	Send("{DOWN}")
	Send("{ENTER}")
Sleep(4000)
	; nhay toi truong title
	Send("{TAB 19}")

	Send($title)
	Sleep(1000)

	; nhay den truong body
	Send("{TAB}")
    Send($body)
    Sleep(1000)

    ; Ðang bài
    Send("{TAB 4}") ; nhay den nut post

    Send("{ENTER}")
    Sleep(5000)
	MouseClick("left", 800, 600) ; check this
EndFunc

; doc du lieu
Local $posts = ReadTXT($txtFile)
For $i = 0 To UBound($posts) - 1
    PostToReddit($posts[$i][0], $posts[$i][1])
Next
