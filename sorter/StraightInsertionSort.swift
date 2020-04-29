//単純挿入ソート
open class StraightInsertionSort : BaseSorter {
    public override func executeSort() {
        for ii in 1 ... (dataArray.count - 1) {
            var jj = ii
            let hold = dataArray[jj]

            while jj > 0 && compare(hold, dataArray[jj - 1]) {
                dataArray[jj] = dataArray[jj - 1]
                setCurrentDataDump()
                jj -= 1
            }
            dataArray[jj] = hold
            setCurrentDataDump()
        }
    }
}