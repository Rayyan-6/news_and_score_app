const app = require('express')()
//const PORT : number  = 8080;
const PORT = 8080;

app.listen(
    PORT,
    ()=> console.log(`server running on ${PORT}`);
);
app.get(
    '/theme',
    (req,res): void =>{
        res.send(
            {
            'textColor':'red'
            }
        );
    }

);