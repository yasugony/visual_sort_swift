//クイックソート
open class QuickSort : BaseSorter {
    public override func executeSort() {
        let startIndex = (begin: 0, end:dataArray.count - 1)
        quickCore(startIndex)
    }

    private func quickCore(_ index:(begin :Int, end :Int)) {
        if index.begin >= index.end {
            return
        }
        var ii = index.begin
        var jj = index.end
        let pivot = getMedian(num1:dataArray[ii],num2:dataArray[(ii + jj)/2], num3:dataArray[jj])
        while true
         {
            while compare(dataArray[ii] , pivot)  {
                ii += 1
            }
            while compare(pivot, dataArray[jj] )  {
                jj -= 1
            }

            if ii >= jj {
                break
            }
            swapDump(ii,jj)
            ii += 1
            jj -= 1
        }
        
        //左部部分を実行(要素が2個以上ある場合に実行)
        if ii > 0 {
            let left = (begin: index.begin, end: ii)
            // print("left:",left)
            quickCore(left)
        }

        //右部分を実行
        if jj + 2 < index.end {
            let right = (begin: jj + 1, end: index.end)
            // print("right:",right)
            quickCore(right)
        }
    }

    //３つの値から中央値を判定し返す
    private func getMedian(num1: Int, num2: Int, num3:Int) -> Int {
        if num1 > num2 {
            if num2 >= num3 { return num2 } else {
                if num3 >= num1 { return num1 } else { return num3 }
            }
        } else {
            if num2 >= num3 {
                if num3 >= num1 { return num3 } else { return num1 }
            } else { return num2 }
        }
    }
}