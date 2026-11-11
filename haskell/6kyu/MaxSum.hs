module MaxSum (maxSum) where

import Data.Function
import MaxSumPreload -- TreeNode = None | Node TreeNode Int TreeNode

maxSum :: TreeNode -> Int
maxSum node =
  case node of
    None -> 0
    Node l n r ->
      case (l, r) of
        (None, None) -> n
        (None, _) -> n + maxSum r
        (_, None) -> n + maxSum l
        _ -> n + (max `on` maxSum) l r
