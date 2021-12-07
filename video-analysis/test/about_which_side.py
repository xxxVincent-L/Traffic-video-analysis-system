import src.common as common
import src.crossing as crossing

crossing1 = crossing.crossing()
# print(common.whichSide(crossing1.yellow2, 153, 235))
print(common.onLines(crossing1, [220, 230, 297-220, 307-230]))
#print(common.whichSide(crossing1.yellow1, 120, 359))
#print(common.whichSide(crossing1.yellow2, 153, 235))

# [108, 190, 153, 235]
