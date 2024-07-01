# Proyecto de Streaming de Películas

Este es un proyecto básico de una aplicación de streaming de películas desarrollado con Node.js y Express.

## Descripción

La aplicación permite gestionar usuarios y películas mediante una API RESTful. Los usuarios pueden ser listados, creados, actualizados y eliminados. Las películas pueden tener operaciones similares para su gestión.

## Contenidos

- [Instalación](#instalación)
- [Trabajar con Ramas Específicas](#trabajar-con-ramas-específicas)
- [Uso](#uso)
- [Actualización](#actualización)
- [Notas Adicionales](#notas-adicionales)
- [Rutas Disponibles](#rutas-disponibles)
  - [Usuarios](#usuarios)
  - [Películas](#películas)

---

## Instalación

1. Clona el repositorio:
    ```bash
    git clone https://github.com/FrijolitoRaza/CaC-24129.git
    ```

2. Navega al directorio del proyecto:
    ```bash
    cd CaC-24129
    ```

3. Instala las dependencias:
    ```bash
    npm i
    ```
    
## Trabajar con Ramas Específicas

### 1. Crear una Nueva Rama
    ```bash
    git checkout -b <branch-name>
    ```
    
### 2. Verificar la Rama Actual
    ```bash
    git branch
    ```
    
## Uso

1. Inicia la aplicación en modo desarrollo:
    ```bash
    npm run dev
    ```

2. La aplicación estará corriendo en `http://localhost:3000`.

## Actualización

### 1. Realiza Cambios en los Archivos

Edita los archivos del proyecto según sea necesario. Por ejemplo, puedes editar el archivo `README.md`.

### 2. Verificar el Estado del Repositorio

1. Verifica el estado del repositorio para ver los archivos modificados:

    ```bash
    git status
    ```

### 3. Agregar los Cambios al Área de Preparación

1. Para agregar un archivo específico (por ejemplo, `README.md`):

    ```bash
    git add README.md
    ```

2. Para agregar todos los cambios realizados:

    ```bash
    git add .
    ```

### 5. Hacer un Commit de los Cambios

1. Realiza un commit con un mensaje descriptivo:

    ```bash
    git commit -m "Descripción de los cambios realizados"
    ```

### 6. Sincronizar con el Repositorio Remoto

1. Antes de subir tus cambios, es una buena práctica actualizar tu rama local con los cambios del repositorio remoto para evitar conflictos:

    ```bash
    git pull origin <branch-name>     #<branch-name> es un nombre de la brach de ejemplo.
    ```

2. Sube los cambios a la rama `<branch-name>` del repositorio remoto:

    ```bash
    git push origin <branch-name>
    ```
    
## Notas Adicionales

- **Branching**: Siempre asegúrate de estar trabajando en la rama correcta. Puedes verificar la rama actual con `git branch` y cambiar de rama con `git checkout <branch-name>`.

- **Conflictos**: Si encuentras conflictos al hacer `git pull`, resuélvelos antes de hacer `git push`. Visual Studio Code ofrece herramientas visuales para resolver conflictos de manera amigable.

- **Revisiones**: Es una buena práctica revisar los cambios antes de hacer un commit. Puedes usar `git diff` para ver los cambios que se han hecho.


## Rutas Disponibles

### Usuarios

- **Listar todos los usuarios**  
  `GET /api/users`
  
  Devuelve la lista completa de usuarios.

- **Obtener un usuario por ID**  
  `GET /api/users/:id`
  
  Devuelve el usuario con el ID especificado.

- **Crear un nuevo usuario**  
  `POST /api/users`
  
  Crea un nuevo usuario. El cuerpo de la solicitud debe contener `username`, `password` y `email`.

- **Actualizar un usuario por ID**  
  `PUT /api/users/:id`
  
  Actualiza el usuario con el ID especificado. El cuerpo de la solicitud puede contener `username`, `password` y `email`.

- **Eliminar un usuario por ID**  
  `DELETE /api/users/:id`
  
  Elimina el usuario con el ID especificado.

### Películas

(Notar que la implementación de las rutas de películas no está proporcionada en tu código, pero a continuación se describe cómo podrían ser estas rutas.)

- **Listar todas las películas**  
  `GET /api/movies`
  
  Devuelve la lista completa de películas.

- **Obtener una película por ID**  
  `GET /api/movies/:id`
  
  Devuelve la película con el ID especificado.

- **Crear una nueva película**  
  `POST /api/movies`
  
  Crea una nueva película. El cuerpo de la solicitud debe contener `title`, `director`, `releaseDate`, etc.

- **Actualizar una película por ID**  
  `PUT /api/movies/:id`
  
  Actualiza la película con el ID especificado. El cuerpo de la solicitud puede contener `title`, `director`, `releaseDate`, etc.

- **Eliminar una película por ID**  
  `DELETE /api/movies/:id`
  
  Elimina la película con el ID especificado.


# CaC-24129-NodeJS_Express_G10