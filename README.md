# ✅ Honest Greens iOS Developer Test

Una aplicación **iOS nativa** desarrollada en **SwiftUI** para una prueba tecnica para una empresa de restauración.  
Este proyecto forma parte de mi portfolio como desarrollador iOS.

---

## 🚀 Características
- 🎨 Diseño limpio con **Design System** propio y animaciones creativas en SwiftUI.
- 🧪 UI reactiva para las diferentes resoluciones (iPhone SE, iPad, etc).
- 🔐 Gestión de strings con última tecnologia de Apple (String.catalog) para dar soporte a lenguajes ingles y castellano.
- 🏗️ Arquitectura modular, escalable y testeable (tests simples añadidos).

---

## 🛠️ Tecnologías
- **Lenguaje:** Swift 5.10+
- **UI Framework:** SwiftUI
- **Control de versiones:** Git & GitHub Projects

---

## 📂 Estructura del proyecto
HgDeveloperTest/  
├─ HgDeveloperTest/ # Target de la app  
│ ├─ App/ # Punto de entrada y configuración  
│ │ └─ HgDeveloperTestApp.swift  
│ ├─ Components/
│ ├─ Core/ # Infra compartida  
│ │ ├─ DesignSystem/ # Colores, tipografías, estilos  
│ │ └─ Utils/ # Extensiones, helpers  
│ ├─ Features/ # Por funcionalidades (feature-first)  
│ │ ├─ Home/  
│ │ │ ├─ Components/  
│ │ │ ├─ Models/  
│ │ │ ├─ ViewModel/ # Lógica MVVM 
│ │ │ └─ View/ # Vista SwiftUI  
│ │ └─ Tiers/  
│ │ └─ TiersInfo/ 
│ ├─ Resources/  
│ │ ├─ Videso  
│ │ ├─ Fonts  
│ │ ├─ Assets.xcassets  
│ │ └─ Localizable.strings  
│ └─ Config/  
├─ ToDoHabitsAppTests/ # Tests unitarios  
├─ ToDoHabitsAppUITests/ # Tests de UI  
├─ .gitignore  
├─ LICENSE  
└─ README.md   

---

## 📌 Guión de instalación
- Clonar repositorio con git clone https://github.com/DaniPM99/hg-ios-test.git
- Inicar la app desde xCode
- En el componente donde aparecen los datos del perfil del usuario aparecen dos botones "+" y "-" que se pueden utilizar para añadir y restar puntos respectivamente de 0 a 200 para ver los diferentes tiers y como reacciona toda la app a los diferentes puntos, esto si se recibieran de una api unicamente habria que actualizar el valor que se modifica con la respuesta para adaptarlo a ella.
- Aun así los puntos se inicializan de forma aleatoria entre un rango entre 0 y 200.

---

## 📜 Licencia
Este proyecto está bajo la licencia [MIT](LICENSE).
