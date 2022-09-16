# Costs of Finding the Median For a Set of Numbers on Chain
---
The contracts and testing in this repository was used to find the gas cost for calculating the median from a set of uint on chain.
The conclusion is that finding the median is relatively cheap and creating an ordered list from an unordered one is costly.
For each comparison an array of lengths 2, 3, 4, and 5 was tested.

Gas Cost in Gwei
---

|        | List Ordered on Chain | List Ordered off Chain | 
|-----        |-----                     |-----                      |
|Min |111867 |1125|
|Median |144970 |1301|
|Max |202272 |1477 |
|2 Items |112104 | 1325 |
|3 Items|126403|1125|
|4 Items |164485 |1477|
|5 Items |202272 |1277 |

$ Cost at$1600 Ether
---

|Assuming 50 Gas per transaction | List Ordered on Chain | List Ordered off Chain | 
|-----        |-----                     |-----                      |
|Min |$89.49 |$0.09|
|Median |$91.98 |$0.10|
|Max |$161.82 |$0.12 |
|2 Items |$89.68 |$0.11 |
|3 Items|$101.12|$0.09|
|4 Items |$131.59 |$0.12|
|5 Items |$161.82 |$0.10 |
