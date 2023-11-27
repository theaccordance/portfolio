export function main(args: {}): {} {
    let name: string = args['name'] || 'muntant, welcome to Krakoa'
    let greeting: string = 'Hello ' + name + '!'
    console.log(greeting)
    return { body: greeting }
}
