"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.main = void 0;
function main(args) {
    let name = args['name'] || 'muntant, welcome to Krakoa';
    let greeting = 'Hello ' + name + '!';
    console.log(greeting);
    return { body: greeting };
}
exports.main = main;
