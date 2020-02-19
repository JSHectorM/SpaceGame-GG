const { app, BrowserWindow }= require('electron');
const url = require ('url');
const path = require ('path');

//Codigo para actualizar la pantalla principal sin cerrarla
// solo durate la produccion se ejecuta este modulo
if(process.env.NODE_ENV !== 'production'){

    require ('electron-reload')(__dirname, {

    })

}

let mainWindow
app.on('ready', () => {
    
    mainWindow = new BrowserWindow({});
    mainWindow.loadURL(url.format({

        pathname: path.join (__dirname, 'views/index.html'),
        protocol: 'file',
        slashes: true

    }))

});