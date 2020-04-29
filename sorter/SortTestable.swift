public protocol SortTestable {
    var dataArray : [Int] { get set }
    var dumpDataArray : [String] { get set }
    var compareCount : Int {get set}

    func executeSort() -> ()
}

open class BaseSorter : SortTestable {
    public var dataArray = [160,62,56,86,76,67,85,157,96,197,73,182,10,181,72,138,59,78,25,97,29,19,125,180,190,83,114,13,58,113,60,121,110,16,61,158,123,82,35,177,51,99,131,192,63,54,127,2,23,170,126,168,200,179,47,34,36,199,77,153,24,189,30,40,12,80,87,9,91,120,194,183,4,133,84,193,108,70,46,22,186,103,173,169,8,44,100,105,55,178,65,167,6,150,143,117,128,111,198,31,45,115,154,151,79,184,93,98,28,75,119,174,32,11,141,48,102,21,147,53,74,42,164,5,27,92,33,152,107,14,66,140,187,129,139,149,134,26,185,195,50,191,156,52,163,68,106,17,118,7,144,135,175,166,43,15,155,1,196,124,57,41,18,20,171,136,38,176,172,132,71,165,142,145,162,137,159,69,95,146,161,64,81,188,109,112,94,49,101,116,90,39,37,122,104,148,89,88,130,3]
    //var dataArray = [60,62,56,86,76,67,85,157,96 ]
    public var dumpDataArray : [String]
    public var compareCount = 0

    public init() {
        dumpDataArray = []
        setCurrentDataDump()
    }

    public func executeSort() {
    }

    public func setCurrentDataDump() {
        var str = "\"\(dataArray[0])"
        str += dataArray.dropFirst().reduce("") {
            return  "\($0),\($1)"
        }
        str += "\""
        dumpDataArray.append(str)
    }

    /// left < right の場合 true　を返す
    public func compare(_ left: Int, _ right: Int) -> Bool {
        compareCount += 1
        return left < right
    }

    public func swap(_ index1: Int, _ index2: Int) {
        let temp = dataArray[index1]
        dataArray[index1] = dataArray[index2]
        dataArray[index2] = temp
    }
    public func swapDump(_ index1: Int, _ index2: Int) {
        swap(index1, index2)
        setCurrentDataDump()
    }

}

open class SortExecuor {
    public init(){

    }

    public func exec<T>(_ sorter:T) where T : SortTestable {
        sorter.executeSort()
        let dumps = sorter.dumpDataArray
        let count = sorter.compareCount
        print("交換回数:",dumps.count," 比較処理回数:", count)
        // for dump in dumps {
        //     print(dump + ",")
        // }
    }
}