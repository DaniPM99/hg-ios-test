# ✅ Honest Greens iOS Developer Test

Una aplicación **iOS nativa** desarrollada en **SwiftUI** para una prueba tecnica para una empresa de restauración.  
Este proyecto forma parte de mi portfolio como desarrollador iOS.

---

## 🚀 Características
- 🎨 Diseño limpio con **Design System** propio y animaciones creativas en SwiftUI.
- 🧪 Soporte para **Feature Flags** (activación progresiva de funcionalidades).
- 🔐 Gestión segura de credenciales con **.xcconfig & Secrets**.
- 🏗️ Arquitectura modular, escalable y testeable.

---

## 🛠️ Tecnologías
- **Lenguaje:** Swift 5.10+
- **UI Framework:** SwiftUI
- **Gestión de configuración:** `.xcconfig` + Secrets
- **Control de versiones:** Git & GitHub Projects

---

## 📂 Estructura del proyecto
HgDeveloperTest/  
├─ HgDeveloperTest/ # Target de la app  
│ ├─ App/ # Punto de entrada y configuración  
│ │ └─ HgDeveloperTestApp.swift  
│ ├─ Core/ # Infra compartida  
│ │ ├─ DesignSystem/ # Colores, tipografías, estilos  
│ │ ├─ Persistence/ # SwiftData stack, migraciones  
│ │ └─ Utils/ # Extensiones, helpers  
│ ├─ Features/ # Por funcionalidades (feature-first)  
│ │ ├─ Home/  
│ │ │ ├─ Models/
│ │ │ ├─ ViewModel/ # Lógica MVVM 
│ │ │ └─ View/ # Vista SwiftUI  
│ │ └─ Tiers/  
│ │ └─ TiersInfo/ 
│ ├─ Resources/  
│ │ ├─ Assets.xcassets  
│ │ └─ Localizable.strings  
│ └─ Config/  
│ ├─ Debug.xcconfig  
│ └─ Release.xcconfig  
├─ ToDoHabitsAppTests/ # Tests unitarios  
├─ ToDoHabitsAppUITests/ # Tests de UI  
├─ .gitignore  
├─ LICENSE  
└─ README.md   

---

## 📌 Roadmap
- [x] Configurar repo en GitHub con `.gitignore` y licencia.
- [ ] Crear Design System.
- [ ] Añadir vistas.
- [ ] Añadir navegación con animaciones.
- [ ] Integrar animaciones.
- [ ] Configurar Feature Flags.

---

## 📜 Licencia
Este proyecto está bajo la licencia [MIT](LICENSE).
