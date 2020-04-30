//ヒープソート
//ヒープデータ(親は子より大きい値)の根を順次、最後尾にもっていくことでソートする
open class HeapSort : BaseSorter {
    public override func executeSort(){
        var heapCount = dataArray.count

        //データをヒープ化
        toHeap(heapCount)

        swapDump(0, heapCount-1)
        heapCount -= 1

        while heapCount > 1 {
            toHeap(heapCount)
            swapDump(0, heapCount-1)
            heapCount -= 1
        }
    }

    private func toHeap(_ heapCount: Int) {
        let count = heapCount / 2 - 1 //ヒープのレベルを計算
        for r in stride(from:count,to:-1,by:-1) {
            var rootIndex = r
            let temp = dataArray[r] //元の親データを控えておく
            while rootIndex < heapCount/2 { //heapCount/2 以上の添字は子データは存在しない

                let leftIndex = 2 * rootIndex + 1
                let rightIndex = 2 * rootIndex + 2
                var childIndex : Int = 0
                //子同士で大きい値をchildIndexにする
                if rightIndex < heapCount && compare(dataArray[leftIndex], dataArray[rightIndex]) {
                    childIndex = rightIndex
                } else {
                    childIndex = leftIndex
                }

                //親の方が大きかったら終了
                if compare(dataArray[childIndex], dataArray[rootIndex]) {
                    break
                }

                dataArray[rootIndex] = dataArray[childIndex] //親を子で上書き
                setCurrentDiffDataDump(rootIndex, childIndex, DumpType.I)
                rootIndex = childIndex //元親データが 孫データといれかれれるまでループを繰り返す
            }
            //最終的に親の値が落ち着いたindexに戻す
            dataArray[rootIndex] = temp
            setCurrentDiffDataDump(rootIndex, temp, DumpType.W)

        }
    }
}