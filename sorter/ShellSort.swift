//シェルソート
open class ShellSort : BaseSorter {
    public override func executeSort() {
        //hを求める 計算式としては 3h + 1
        var h = 1
        while 3*h + 1 < dataArray.count - 1  {
            h = 3*h + 1
        }
        while h > 0 {
            for ii in h ... (dataArray.count - 1) {
                var jj = ii
                let hold = dataArray[jj]

                while jj >= h && compare(hold, dataArray[jj - h]) {
                    dataArray[jj] = dataArray[jj - h]
                    setCurrentDataDump()
                    jj -= h
                }
                dataArray[jj] = hold
                setCurrentDataDump()
            }
            h /= 3 //間隔をだんだん小さくしていく
        }
    }
}