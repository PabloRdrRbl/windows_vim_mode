; #NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
SendMode "Input"  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir A_ScriptDir  ; Ensures a consistent starting directory.

; Define a variable to keep track of whether Vim mode is active
global vimMode := false

; Toggle Vim mode on or off with the Esc key
Esc::
{
global vimMode
    if (vimMode) {
        ; If Vim mode is active, deactivate it
        vimMode := false
        Tooltip("Vim Mode: OFF")
        Sleep(1000)  ; Display the tooltip for 1 second
        ToolTip("")  ; Clear the tooltip
    } else {
        ; If Vim mode is not active, activate it
        vimMode := true
        Tooltip("Vim Mode: ON")
        Sleep(1000)  ; Display the tooltip for 1 second
        ;ToolTip("")  ; Clear the tooltip
    }
    return
}

; Remap keys for Vim mode when active
#HotIf vimMode
h::Send {LEFT}         ; h            ->    LEFT                 (Cursor left one character)
b::Send ^{LEFT}        ; b            ->    CTRL + LEFT          (Cursor left per word)
+h::Send +{LEFT}       ; SHIFT + h    ->    SHIFT + LEFT         (Select one character)
+b::Send +^{LEFT}      ; SHIFT + b    ->    SHIFT + CTRL + LEFT  (Select per word)

l::Send {RIGHT}        ; l            ->    RIGHT                (Cursor right one character)
w::Send ^{RIGHT}       ; w            ->    CTRL + RIGHT         (Cursor right per word)
+l::Send +{RIGHT}      ; SHIFT + l    ->    SHIFT + RIGHT        (Select one character)
+w::Send +^{RIGHT}     ; SHIFT + W    ->    SHIFT + CTRL + RIGHT (Select per word)

k::Send {UP}           ; k            ->    UP                   (Cursor up line)
+k::Send +{UP}         ; SHIFT + k    ->    SHIFT + UP           (Select one line)

j::Send {DOWN}         ; j            ->    LEFT                 (Cursor down line)
+j::Send +{DOWN}       ; SHIFT + j    ->    SHIFT + LEFT         (Select one line)

a::Send {HOME}         ; a            ->    HOME                 (Cursor to beginning of line)
+a::Send +{HOME}       ; SHIFT + a    ->    SHIFT + HOME         (Select to beginning of line)
f::Send {END}          ; f            ->    END                  (Cursor to end of line)
+f::Send +{END}        ; SHIFT + f    ->    SHIFT + END          (Select to end of line)

m::Send {Del}          ; m            ->    DEL                  (Delete one character)
n::Send {Backspace}    ; n            ->    BACKSPACE            (Backspace one character)

u::Send ^{z}           ; u            ->    CTRL + z             (Undo)
+u::Send ^{y}          ; SHIFT + u    ->    CTRL + y             (Redo)
#HotIf
