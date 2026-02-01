pasmo --name Martian --tap main.asm martian.tap martian.log
pasmo --name Int --tap int.asm int.tap int.log
copy /b loader.tap+martian.tap+int.tap SpaceBattle.tap