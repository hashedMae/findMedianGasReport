# Costs of Finding the Median For a Set of Numbers on Chain
---
The contracts and testing in this repository was used to find the gas cost for calculating the median from a set of uint on chain.
The conclusion is that finding the median is relatively cheap and creating an ordered list from an unordered one is costly.
For each comparison an array of lengths 2, 3, 4, and 5 was tested.

##Gas Cost in Wei
---

###List Order on chain

**Min** 111867
**Median** 144970
**Max** 202272

**2 Items** 112104
**3 Items** 126403
**4 Items** 164485
**5 Items** 202272

###List Ordered off Chain

**Min** 1125
**Median** 1301
**Max** 1477

**2 Items** 1325
**3 Items** 1125
**4 Items** 1477
**5 Items** 1277
