<template>
  <view class="container">
    <view
      :id="`cont_${index + 1}`"
      class="cont-box"
      :style="{ width: widthCalc, 'margin-left': index === 0 ? 0 : marginCalc }"
      v-for="(numVal, index) in flowData.column"
      :key="numVal"
    >
      <view class="item-box" v-for="(item, j) in flowData[`column_${index + 1}`]" :key="j">
        <image class="img-tip" :src="item.imgUrl" mode="widthFix" lazy-load :data-item="item" @load="imgLoad" @error="imgError" />
        <view class="tit-tip multi-line-omit">{{ item.title }}</view>
        <view class="desc-tip multi-line-omit">{{ item.desc }}</view>
      </view>
    </view>
  </view>
</template>
 
<script>
export default {
  data() {
    return {
      flowData: {
        list: [], 
        column: 2, 
        columnSpace: 2 
      }
    };
  },
  created() {

    for (let i = 1; i <= this.flowData.column; i++) {
      this.$set(this.flowData, `column_${i}`, []);
    }
  },
  onLoad() {

    this.flowData.list = [
      {
        imgUrl: "https://img0.baidu.com/it/u=3860261429,3691049320&fm=253&fmt=auto&app=138&f=JPEG?w=200&h=200",
        title: "蒸汽机器人：布里茨",
        desc: "布里茨是一个蒸汽机器人，他是由皮尔斯教授所创造的。布里茨拥有强大的力量和速度，可以在战场上迅速移动并造成巨大的伤害。"
      },
      {
        imgUrl: "https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fsafe-img.xhscdn.com%2Fbw1%2F3f846550-1787-478d-b6ba-acb8ce6d31ce%3FimageView2%2F2%2Fw%2F1080%2Fformat%2Fjpg&refer=http%3A%2F%2Fsafe-img.xhscdn.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=auto?sec=1715348785&t=ee7a9417b1f47649c31d61f6debccbac",
        title: "黎明使者：锐雯",
        desc: "锐雯（Riven）是一个来自艾欧尼亚的战士，被称为“黎明使者”。她曾经是艾欧尼亚军队的一员，但在一场战争中被背叛，因而成为了流亡者。锐雯擅长使用符文之剑进行战斗，她的剑技高超，能够轻松击溃敌人。"
      },
      {
        imgUrl: "https://img0.baidu.com/it/u=3024528416,3031391694&fm=253&fmt=auto&app=138&f=JPEG?w=889&h=500",
        title: "斩星魔剑：易",
        desc: "他寻找着传说中的无极剑法，以实现自己的目标。他被描绘为一个追求极致剑道的剑客，不畏艰险，勇往直前。斩星剑在游戏中是一名高机动性的刺客，擅长快速击杀敌人并在团战中发挥关键作用。"
      },
      {
        imgUrl: "https://img2.baidu.com/it/u=605458075,3978116470&fm=253&fmt=auto&app=138&f=JPEG?w=889&h=500",
        title: "赵云：赵信",
        desc: "赵信是英雄联盟中的一名英雄，他是一名来自战争学院的战士，被称为“德玛西亚之力”。赵信以强大的近战能力和控制技能而闻名，他可以迅速接近敌人，造成高额伤害并控制他们。赵信的设计灵感来自中国历史上的战将赵云，但两者并非同一人物。"
      },
      {
        imgUrl: "https://file.moyublog.com/free_wallpapers_files/flwi0jh2b1c.jpg",
        title: "战斗学院：蕾欧娜",
        desc: "战斗学院蕾欧娜的皮肤通常会采用学院制服风格的服装设计，结合科技感和运动元素，如带有战斗学院标志的夹克、短裙或短裤，搭配护腕、长靴等装备，整体色彩可能以紫色为主调，象征智慧与神秘，同时配以亮色装饰，体现其啦啦队员的活力。武器和盾牌也会相应地进行改造，融入未来科技感，与战斗学院的主题保持一致。"
      },
      {
        imgUrl: "https://img2.baidu.com/it/u=638664153,925065552&fm=253&fmt=auto&app=138&f=JPEG?w=889&h=500",
        title: "源计划：艾希",
        desc: "在源计划世界观中，艾希并非仅仅是北方弗雷尔卓德的女皇，而是化身为一位身经百战的高科技战士，她可能是源计划组织的一员，或是与之对抗的反抗势力领袖。源计划艾希往往被赋予一种冷峻、坚韧的气质，代表了在极端科技环境下对自由与正义的执着追求。"
      },
      {
        imgUrl: "https://img1.baidu.com/it/u=524911866,1249977102&fm=253&fmt=auto&app=138&f=JPEG?w=889&h=500",
        title: "KDA女团",
        desc: "KDA女团（K/DA）是《英雄联盟》（League of Legends，简称LOL）游戏开发商拳头游戏（Riot Games）创造的一个虚拟音乐团体。该女团将游戏中四位女性英雄的形象与流行音乐文化相结合，形成了一支风格独特、深受玩家喜爱的虚拟偶像团体。"
      },
      {
        imgUrl: "https://img1.baidu.com/it/u=1270462466,1839519413&fm=253&fmt=auto&app=138&f=PNG?w=150&h=150",
        title: "鲁班七号",
        desc: "鲁班七号是机关大师鲁班大师的天才机关造物，代表着鲁班大师最高级别的工艺成就。他以人偶形态存在，拥有小巧可爱的外表，短胳膊短腿，显得既可爱又充满力量。虽然身为机关造物，鲁班七号却展现出强烈的情感和自我意识，对战斗有着极高的热情，是战场上的破坏力惊人的射手。"
      },
      {
        imgUrl: "https://img1.baidu.com/it/u=4061371701,2488013469&fm=253&fmt=auto&app=138&f=JPEG?w=889&h=500",
        title: "游龙清影：西施",
        desc: " 西施在《王者荣耀》的世界观中是一位具有操控重力之力的少女，她出生于江南水乡，与大自然尤其是水元素有着深厚的联系。在游戏中，西施被塑造成一个机智、活泼、善良的角色，擅长利用自己的力量帮助队友并巧妙地控制战场局势。她的技能设计围绕着操纵敌人的行动和强化自身输出展开，展现了她灵巧而富有策略的一面。"
      },
      {
        imgUrl: "https://img0.baidu.com/it/u=1137751540,3398843193&fm=253&fmt=auto&app=138&f=JPEG?w=888&h=500",
        title: "神威：马超",
        desc: "马超在《王者荣耀》的背景故事中，延续了其在历史记载中的勇猛形象。他出身西凉，身手矫健，武艺高强，是五虎上将之一，以其卓越的骑射技艺和迅捷的战斗风格闻名于世。在游戏中，马超是一位以长枪为武器的战士/刺客型英雄，擅长快速突进、持续追击和高额爆发输出。"
      },
      {
        imgUrl: "https://img2.baidu.com/it/u=3173895792,2384702375&fm=253&fmt=auto&app=138&f=JPEG?w=889&h=500",
        title: "一念神魔：李信",
        desc: "一位拥有光明与黑暗双重力量的战士。他出身于长安，背负着家族的诅咒和命运的考验。在游戏中，李信具有独特的双形态机制，可以根据战斗需要在两种截然不同的形态之间切换。"
      },
      {
        imgUrl: "https://img2.baidu.com/it/u=581177170,2107892220&fm=253&fmt=auto&app=138&f=JPEG?w=800&h=500",
        title: "特工魅影：百里守约",
        desc: "一位精通狙击、善于潜行的射手英雄，他与弟弟百里玄策有着深厚的兄弟情谊。守约继承了家族的射术天赋，但为了保护弟弟和履行与弟弟的约定，他选择了成为长城守卫军的一员，用精准的远程射击和冷静的判断力守护家园。百里守约在游戏中以其超远的攻击距离、出色的视野控制能力和高爆发的单体伤害著称。"
      },
      {
        imgUrl: "https://img1.baidu.com/it/u=2647843065,1234977120&fm=253&fmt=auto&app=120&f=JPEG?w=1467&h=800",
        title: "帝君：钟离",
        desc: "一位拥有悠久历史的古老神祇，曾经以摩拉克斯的身份统治璃月长达数千年，以公正、睿智和强大而闻名。他在人间行走时，化名为“钟离”，以旅行者的身份游历各地，与玩家角色相遇并结伴而行。尽管表面上看似淡泊名利、悠然自得，但钟离始终关注着璃月的安危与人民的生活，必要时会毫不犹豫地运用神力保护这片土地。"
      },
      {
        imgUrl: "https://img0.baidu.com/it/u=3872329442,3979799693&fm=253&fmt=auto&app=120&f=JPEG?w=1143&h=800",
        title: "海贼王：路飞",
        desc: "路飞的全名是蒙奇·D·路飞（Monkey D. Luffy），他因头戴一顶草帽而被广泛称为“草帽小子”或“草帽路飞”。"
      }
    ];
    this.$nextTick(() => {
      this.initValue(0);
    });
  },
  computed: {

    widthCalc() {
      return `${100 / this.flowData.column - this.flowData.columnSpace}%`;
    },

    marginCalc() {
      const columnWidth = 100 / this.flowData.column - this.flowData.columnSpace;
      return `${(100 - columnWidth.toFixed(5) * this.flowData.column) / (this.flowData.column - 1)}%`;
    }
  },
  methods: {

    getMinObj(a, s) {
      let m = a[0][s];
      let mo = a[0];
      for (let i = a.length - 1; i >= 0; i--) {
        if (a[i][s] < m) m = a[i][s];
      }
      mo = a.filter(i => i[s] === m);
      return mo[0];
    },

    getMinColumnHeight() {
      return new Promise(resolve => {
        const heightArr = [];
        for (let i = 1; i <= this.flowData.column; i++) {
          uni
            .createSelectorQuery()
            .in(this)
            .select(`#cont_${i}`)
            .boundingClientRect(res => {
              heightArr.push({ column: i, height: res.height });
            })
            .exec(() => {
              if (this.flowData.column <= heightArr.length) {
                resolve(this.getMinObj(heightArr, "height"));
              }
            });
        }
      });
    },

    async initValue(i) {
      if (i >= this.flowData.list.length) return false;
      const minHeightRes = await this.getMinColumnHeight();
      this.flowData[`column_${minHeightRes.column}`].push({
        ...this.flowData.list[i],
        index: i
      });
    },

    imgLoad(e) {
      const i = e.target.dataset.item.index;
      this.initValue(i + 1); 
    },

    imgError(e) {
      const i = e.target.dataset.item.index;
      this.initValue(i + 1); 
    }
  }
};
</script>
 
<style lang="scss" scoped>
		.container {
		  padding: 20rpx;
		  .cont-box {
			$borderRadius: 12rpx;
			float: left;
			.item-box {
			  width: 100%;
			  padding-bottom: 20rpx;
			  margin-bottom: 30rpx;
			  border-radius: $borderRadius;
			  box-shadow: 0rpx 3rpx 6rpx rgba(0, 46, 37, 0.08);
			  .img-tip {
				width: 100%;
				border-radius: $borderRadius $borderRadius 0 0;
			  }
			  .tit-tip {
				text-align: justify;
				font-size: 30rpx;
				padding: 10rpx 20rpx 0;
				font-weight: 900;
			  }
			  .desc-tip {
				text-align: justify;
				font-size: 26rpx;
				padding: 5rpx 20rpx 0;
				margin-top: 10rpx;
			  }
			}
		  }
		}

		.multi-line-omit {
		  word-break: break-all; 
		  text-overflow: ellipsis; 
		  overflow: hidden; 
		  display: -webkit-box; 
		  -webkit-line-clamp: 2;
		  -webkit-box-orient: vertical;
		}

		.one-line-omit {
		  width: 100%;
		  white-space: nowrap;
		  overflow: hidden;
		  text-overflow: ellipsis; 
}
</style>