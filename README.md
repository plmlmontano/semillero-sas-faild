## Parqueadero

Implementación de una aplicación para el manejo de un pequeño parqueadero

### Prerequisitos

```
NodeJs = v12.22.5
MySQL = v8.0
VueJs2 = v4.5.7
```
### Repositorio
* Github: https://github.com/calypsobronte/parqueadero

### Instalación

* Clona el repositorio por medio de git
```bash
$ git clone https://github.com/calypsobronte/parqueadero.git
```

<br>
<br>

### Backend *(nodejs, morgan, express, mysql2, nodemon, ES6+)*

1. Ingresar al directorio clonado `parqueadero/backend`

```bash
$ cd backend
```

2. Instalar las dependencias para correr el server

```bash
$ yarn install o npm install
```

3. Inicie el servidor de desarrollo:
```bash
$ yarn start o npm start
```

4. Puede abrir postman o la apliacacion de su preferencia e ingresar los datos con la siguiente endpoint  `http://localhost:5000/api/index` para saber que si esta corriendo el servidor correctamente. Si este `endpoint` corre bien puedes seguir con los demas endpoint que se encuentra en la tabla de rutas para postman.

  > Nota: la base de datos del proyecto se llama `bayd1pq9zidxtmfxk8sy` y se utilizo un cluster de [Clever Cloud](https://www.clever-cloud.com/en/)

<br>
<br>

### Rutas utilizadas por medio de postman
|  Entrada   |     URL    |  Salida   |
| ---------- | ---------- | ---------- |
| GET   | `http://localhost:5000/api/parqueadero`   | [{"id": 1, "placa": "TMI090", ...}] |
| POST   | `http://localhost:5000/api/parqueadero`   | { "nombre": "Lina", ...} |
| PUT   | `http://localhost:5000/api/parqueadero/state/:placa`   | {"info": "Rows matched: 1  Changed: 1  Warnings: 0", ...} |
| PUT   | `http://localhost:5000/api/parqueadero/exit/:placa`   | {"info": "Rows matched: 1  Changed: 1  Warnings: 0", ...} |
| GET   | `http://localhost:5000/api/parqueadero/:placa`   | [{"placa": "YHE456", "valor": "5100.00", ...}] |


### Frontend *(vuejs2, vuetify, axios)*

1. Ingresar al directorio clonado `parqueadero/frontend`

```bash
$ cd frontend
```

2. Instalar las dependencias para correr el server

```bash
$ yarn install o npm install
```

3. Inicie el servidor de desarrollo:
```bash
$ yarn serve o npm run serve
```

4. Abra el sitio de desarrollo yendo a `http://localhost:8080` en su navegador.

## Criterios de aceptacion
- [x] Registrar información de vehiculos y consultarlos con sus respectivos requisitos funcionales
- [x] Utilizar base de datos como H2, MariaDBo MySql.
- [x] Separacion por capas de la logica.
- [x] Implementacion de Lenguajes para el Back con `Node JS` o `JAVA` (o similares).
- [x] Implementacion de Lenguajes para el Front con `React JS` o `Angular` (o similares).

## Construido con

* WLS2 ubuntu 20 en Win10
* Visual Studio Code
* Postman
* Clever Cloud (MySQL)
* Vuetify (VueJS2)
* Ssweetalert 2

## Contribuyendo

Contribuya usando GitHub Flow. Cree una rama, agregue confirmaciones y abra una solicitud de extracción .

## Versionado

v1

## Autor

* **Lina María Montaño Ramírez** - *Backend Developer* - [calypsobronte](https://github.com/calypsobronte)


## Licencia

 MIT License 
