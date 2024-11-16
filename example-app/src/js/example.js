import { Reader } from 'capacitor-reader';

window.testEcho = () => {
    const inputValue = document.getElementById("echoInput").value;
    Reader.echo({ value: inputValue })
}
