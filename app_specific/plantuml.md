
# PLANT UML oneline commands

* stdlib
* listopeniconic
* version
* listfonts
* emoji
* listsprite

example - list all (imported) sprites:

```text
@startuml
!define osaPuml https://raw.githubusercontent.com/Crashedmind/PlantUML-opensecurityarchitecture2-icons/master
!include osaPuml/Common.puml
!include osaPuml/User/all.puml
!include osaPuml/Hardware/all.puml
!include osaPuml/Misc/all.puml
!include osaPuml/Server/all.puml
!include osaPuml/Site/all.puml
listsprite
@enduml
```
