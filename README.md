# Emprec - Sitio Web Corporativo

## 📋 Descripción del Proyecto

**Emprec** es el sitio web corporativo de una empresa de construcción y desarrollo inmobiliario. El sitio presenta los servicios de la empresa, muestra su portafolio de obras y proyectos, y proporciona información de contacto para ambas oficinas (Buenos Aires y Córdoba).

### 🏢 Sobre la Empresa
Emprec se especializa en:
- Construcción de edificios comerciales y residenciales
- Desarrollo de proyectos inmobiliarios
- Obras para bancos y franquicias
- Construcción de locales comerciales y oficinas
- Proyectos de viviendas unifamiliares

## 🛠️ Tecnologías Utilizadas

### Frontend
- **HTML5** - Estructura semántica del sitio
- **CSS3** - Estilos personalizados y responsive design
- **Bootstrap 5** - Framework CSS para grid system y componentes
- **SCSS** - Preprocesador CSS para organización de estilos
- **JavaScript** - Interactividad y funcionalidades del cliente

### Herramientas de Desarrollo
- **Sass/SCSS** - Para compilación de estilos
- **Git** - Control de versiones
- **PowerShell** - Scripts de automatización (Windows)

### Estructura de Archivos
```
emprec/
├── css/                    # Estilos CSS compilados
├── scss/                   # Archivos SCSS fuente
├── js/                     # Scripts JavaScript
├── images/                 # Imágenes del sitio
├── fonts/                  # Fuentes personalizadas
├── icons/                  # Íconos SVG
├── video/                  # Archivos de video
├── include/                # Archivos PHP incluidos
├── *.html                  # Páginas principales
└── *.php                   # Scripts PHP para formularios
```

## 🚀 Requisitos del Sistema

### Servidor Web
- **Apache** o **Nginx** con soporte para PHP
- **PHP 7.4+** (para formularios de contacto)
- **Módulo mod_rewrite** habilitado (para URLs amigables)

### Navegadores Soportados
- Chrome 90+
- Firefox 88+
- Safari 14+
- Edge 90+

### Resoluciones Responsive
- **Desktop**: 1280px - 1920px
- **Tablet**: 768px - 1279px
- **Mobile**: 320px - 767px

## 📦 Instalación y Configuración

### 1. Clonar el Repositorio
```bash
git clone [URL_DEL_REPOSITORIO]
cd emprec
```

### 2. Configurar el Servidor Web
- Copiar todos los archivos al directorio web del servidor
- Asegurar permisos de lectura para todos los archivos
- Configurar el servidor para servir archivos estáticos

### 3. Configurar PHP (Opcional)
Si se utilizan formularios de contacto:
```php
// Configurar en php.ini o .htaccess
upload_max_filesize = 10M
post_max_size = 10M
max_execution_time = 30
```

### 4. Compilar SCSS (Opcional)
Si se modifican archivos SCSS:
```bash
# Instalar Sass
npm install -g sass

# Compilar estilos
sass scss/main.scss css/custom.css
```

## 🌐 Estructura de Páginas

### Páginas Principales
- **index.html** - Página de inicio con servicios y contacto
- **about.html** - Información corporativa
- **services.html** - Servicios detallados
- **policies.html** - Políticas corporativas

### Páginas de Proyectos
- **desarrollos.html** - Desarrollo inmobiliario
- **bancos.html** - Obras para bancos
- **locales.html** - Locales comerciales
- **oficinas.html** - Construcción de oficinas

### Páginas de Obras
- **obras_*.html** - Categorías de obras
- **o1.html - o15.html** - Obras individuales
- **b1.html - b4.html** - Proyectos bancarios
- **l1.html - l5.html** - Locales específicos

## 🎨 Características del Diseño

### Sistema de Colores
- **Primario**: #d4191e (Rojo corporativo)
- **Secundario**: #efefef (Gris claro)
- **Acento**: #c8c8c8 (Gris medio)
- **Texto**: #545255 (Gris oscuro)

### Tipografía
- **Títulos**: Fuentes personalizadas
- **Cuerpo**: Sistema de fuentes del navegador
- **Responsive**: Escalado automático según resolución

### Componentes
- **Header**: Navegación principal con menú responsive
- **Footer**: Información de contacto y enlaces
- **Formularios**: Validación HTML5 y estilos personalizados
- **Cards**: Sistema de tarjetas para proyectos
- **Grid**: Sistema de columnas responsive

## 📱 Responsive Design

### Breakpoints
```css
/* Mobile */
@media (max-width: 767px) { ... }

/* Tablet */
@media (min-width: 768px) and (max-width: 991px) { ... }

/* Desktop */
@media (min-width: 992px) { ... }

/* Desktop específico */
@media (min-width: 1280px) and (max-width: 1439px) { ... }
```

### Adaptaciones
- **Menú**: Se convierte en hamburguesa en mobile
- **Grid**: Columnas se apilan en pantallas pequeñas
- **Imágenes**: Escalado automático
- **Texto**: Tamaños adaptativos

## 🔧 Mantenimiento

### Actualización de Contenido
- Modificar archivos HTML directamente
- Actualizar imágenes en `/images/`
- Mantener estructura de enlaces

### Modificación de Estilos
- Editar archivos SCSS en `/scss/`
- Compilar a CSS antes de subir
- Probar en múltiples navegadores

### Optimización
- Comprimir imágenes antes de subir
- Minificar CSS/JS para producción
- Configurar cache del servidor

## 📞 Soporte

Para soporte técnico o consultas sobre el proyecto:
- **Email**: admin@emprec.com.ar
- **Teléfono Buenos Aires**: 011 7008 1092
- **Teléfono Córdoba**: 3505331634

## 📄 Licencia

Este proyecto es propiedad de Emprec. Todos los derechos reservados.

---

**Última actualización**: Diciembre 2024
