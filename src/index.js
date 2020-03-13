
const { app, BrowserWindow, Menu }= require('electron');

const url = require ('url');
const path = require ('path');




//Codigo para actualizar la pantalla principal sin cerrarla
// solo durate la produccion se ejecuta este modulo 

if(process.env.NODE_ENV !== 'production'){

    require ('electron-reload')(__dirname, {
        electron: path.join(__dirname, '../node_modules', '.bin', 'electron')
    })

}



let mainWindow
let logInWindow

app.on('ready', () => {
    
    mainWindow = new BrowserWindow({});
    mainWindow.loadURL(url.format({

        pathname: path.join (__dirname, 'views/index.html'),
        protocol: 'file',
        slashes: true

    }))

    const mainMenu = Menu.buildFromTemplate(templateMenu);
    Menu.setApplicationMenu(mainMenu);


    mainWindow.on('closed', () => {
        app.quit();
    });

    //DEv Tols
    //mainWindow.webContents.openDevTools()

});

function logIn (){
    logInWindow = new BrowserWindow({
        with: 350,
        height: 480,

        title: 'Iniciar sesión'
    });

    logInWindow.setMenu(null);

    logInWindow.loadURL(url.format({

        pathname: path.join (__dirname, 'views/logIn.html'),
        protocol: 'file',
        slashes: true
    }))
    logInWindow.on('closed', () => {
        logInWindow = null
    });
}

const templateMenu = [
    {
        label: 'Control',
        submenu: [
            {
                label: 'Iniciar Sesión',
                click(){
                    logIn();
                }
            }
        ]
    }
];

