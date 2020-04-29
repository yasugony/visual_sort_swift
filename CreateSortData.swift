

func createData(_ val: Int) -> String {
    let datas = (1 ... val).shuffled()
    var str = "\"\(datas[0])"
    str += datas.dropFirst().reduce("") {
        return  "\($0),\($1)"
    }
    str += "\""
    return str
}
var a = createData(200);
print(a)
