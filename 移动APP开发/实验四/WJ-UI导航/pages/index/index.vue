<template>
	<view>
		<u-tabs
		:list="tabsList" 
		:current="tabsCurrent"
		@change="tabsChange"
		@click="click"></u-tabs>
		<view v-for="(item,index) in problemList" :key=index>
			<view v-if="tabsCurrent===index">
				<uni-section :title="'题目内容: ' + item.title" type="line" title-color="red" title-font-size="40rpx">
					<uni-card>
						<uni-title :title="item.decription" type="h2" color="#027fff"></uni-title>
						<uni-data-checkbox mode="list" icon="right" v-model="answers[index]" :localdata="item.choices" ></uni-data-checkbox>
					    <view>
							<button v-if="index > 0 && index < problemList.length-1" class="button" type="warn" size="mini"  @click="prevQuestion(index)">上一题</button>
							<button v-if="index > 0 && index < problemList.length-1" class="button" type="primary" size="mini"  @click="nextQuestion(index)">下一题</button>
					    	<button v-if="index === problemList.length-1" type="warn" @click="prevQuestion(index)">上一题</button>
					    	<button v-if="index === 0" type="primary" @click="nextQuestion(index)">下一题</button>
							<uni-collapse>
					    		<uni-collapse-item title="题目解析">
					    			<text class="text">{{item["answer"]}}</text>
					    		</uni-collapse-item>
					    	</uni-collapse>
					    </view>
					</uni-card>
				</uni-section>
			</view>
		</view>
	</view>
</template>

<script>
	export default {
		data() {
			return {
				value0:-1,
				value1:-1,
				value2:-1,
				value3:-1,
				value4:-1,
				value5:-1,
				value6:-1,
				answers:["value0","value1","value2","value3","value4","value5","value6"],
				tabsCurrent:0,
                tabsList: 
				[{name: '第一题'},
				{name: '第二题'},
				{name: '第三题'},
				{name: '第四题'},
				{name: '第五题'},
				{name: '第六题'},
				{name: '第七题'},],
				
				problemList:[
					{
						title:"计算机组成原理",
						decription:"在冯·诺依曼结构的计算机中，指令和数据均以二进制形式存放在同一存储器中。执行程序时，若需要从内存中取一条指令并执行，以下说法正确的是什么？",
						choices: [
								{"value": 0,"text": "A. 指令必须先加载到CPU的寄存器中才能被执行"	},
								{"value": 1,"text": "B. 指令可以直接在内存中被执行"},
								{"value": 2,"text": "C. 指令和数据在内存中的寻址方式完全相同"},
								{"value": 3,"text": "D. 指令和数据均以同样的方式从内存传输到CPU"}],
						answer:'在进程管理中，进程的基本状态通常包括以下几种：\n\n1. 新建态\n2. 执行态\n3. 就绪态\n4. 等待态\n5. 终止态\n\n因此正确答案为D. 静止态'
					},
					{
						title:"网络安全技术",
						decription:"以下哪种安全协议主要用于保护Web浏览器与服务器之间的通信安全？",
						choices:[
								{"value": 0,"text": "A. Secure Shell (SSH)"},
								{"value": 1,"text": "B. File Transfer Protocol over SSL/TLS (FTPS)"},
								{"value": 2,"text": "C. Internet Protocol Security (IPsec)"},
								{"value": 3,"text": "D. Transport Layer Security (TLS)"}],
						answer:"A. Secure Shell (SSH)：SSH是一种网络协议，主要用于加密远程登录会话和命令行交互，以及安全地传输文件。虽然SSH确实提供了强大的安全保护，但它主要应用于服务器管理和远程访问场景，如通过命令行连接到服务器进行管理操作、文件传输等。SSH并不直接用于保护Web浏览器与服务器之间的HTTP(S)通信，即用户通过浏览器访问网页时所发生的交互。\n\nB. File Transfer Protocol over SSL/TLS (FTPS)：FTPS是在FTP（File Transfer Protocol）协议基础上，通过SSL/TLS提供加密和身份验证的安全增强版。FTPS主要用于确保文件传输过程中的安全，特别是对于通过FTP协议上传、下载文件的情况。尽管与Web相关的文件传输可能使用FTPS，但它并不是直接应用于Web浏览器与服务器之间常规HTTP(S)网页请求和响应的通信安全。\n\nC. Internet Protocol Security (IPsec)：IPsec是一种在网络层（IP层）提供安全服务的协议簇，它能够为网络通信提供加密、认证和完整性保护。IPsec主要应用于网络设备之间（如路由器、防火墙等）或主机之间的端到端通信安全，常用于构建VPN（Virtual Private Network）或保护企业内部网络通信。尽管IPsec可以为整个网络流量（包括Web流量）提供安全保障，但它并非专门为Web浏览器与服务器之间的HTTP(S)通信设计的安全协议。\n\nD. Transport Layer Security (TLS)：TLS是目前用于保护Web浏览器与服务器之间通信安全的主流协议。它是SSL（Secure Sockets Layer）协议的继任者，专为在网络应用层之下、传输层之上提供安全服务而设计。当Web浏览器访问HTTPS（HTTP Secure）网站时，浏览器与服务器之间建立的加密连接就是基于TLS协议。TLS通过证书验证服务器身份、提供数据加密（保证数据的私密性）、以及实现消息完整性校验和重放攻击防护，确保Web通信的机密性、完整性和认证性。\n\n综上所述，正确答案是：D. Transport Layer Security (TLS)"
					},
					{
						title:"操作系统",
						decription:"在进程管理中，下列哪一项不是进程的基本状态？",
						choices:[
								{"value": 0,"text": "A. 新建态"	},
								{"value": 1,"text": "B. 执行态"},
								{"value": 2,"text": "C. 就绪态"},
								{"value": 3,"text": "D. 静止态"},
								{"value": 4,"text": "E. 终止态"}],
						answer:'在进程管理中，进程的基本状态通常包括以下几种：\n\n1. 新建态\n2. 执行态\n3. 就绪态\n4. 等待态\n5. 终止态\n\n因此正确答案为D. 静止态'
					},
					{
						title:"人工智能",
						decription:"在机器学习中，以下哪种技术常用于处理缺失值和异常值？",
						choices:[
								{"value": 0,"text": "A. 主成分分析"	},
								{"value": 1,"text": "B. 线性回归"},
								{"value": 2,"text": "C. K近邻算法"},
								{"value": 3,"text": "D. 奇异值分解"},
								{"value": 4,"text": "E. 插补"}],
						answer:"A. 主成分分析（PCA）：PCA是一种降维技术，主要用于提取数据的主要特征并压缩数据，虽然在处理过程中可能间接涉及对缺失值的敏感性，但它本身并不直接用于处理缺失值或异常值。\n\nB. 线性回归：线性回归是一种预测模型，虽然它可以作为基于模型的插补方法之一来预测缺失值，但“线性回归”本身并不特指缺失值处理技术，而是更广泛地应用于预测问题。\n\nC. K近邻算法（KNN）：KNN同样可以作为一种基于模型的插补方法来估计缺失值，但其主要用途是分类和回归任务，而非直接针对缺失值处理。\n\nD. 奇异值分解（SVD）：SVD是一种矩阵分解技术，主要用于数据降维、特征提取、推荐系统等领域，它本身并不直接用于处理缺失值或异常值，尽管在某些情况下，如在推荐系统中，可以结合SVD处理部分已知的评分数据来推断缺失的评分。\n\nE. 插补插补是专门用来处理缺失值的常见技术，包括使用统计量（如均值、中位数、众数）填充、基于模型（如线性回归、K近邻算法）的插补、以及更复杂的插补方法如多重插补等。这些方法旨在用合理的估计值替换数据集中缺失的值，使得数据集变得完整，便于后续的分析和建模。\n\n因此，正确答案是 E. 插补。",
					},
					{
						title:"Linux",
						decription:"在Linux中，登录系统时，获得的具有唯一标识符的Shell进程的ID是什么？",
						choices:[
								{"value": 0,"text": "A. NID"	},
								{"value": 1,"text": "B. PID"},
								{"value": 2,"text": "C. UID"},
								{"value": 3,"text": "D. CID"}],
						answer:"B. PID\n\n在Linux系统中，当登录后启动的Shell进程和其他任何进程一样，都有一个唯一的进程标识符，称为进程ID（Process IDentifier），简称PID。所以，当登录Linux时，分配给Shell的那个进程的唯一标识就是PID。"
					},
					{
						title:"数据结构",
						decription:" 以下哪种数据结构最适合用来表示一个班级的学生名单，每个学生有姓名和成绩？",
						choices:[
								{"value": 0,"text": "A. 数组 "	},
								{"value": 1,"text": "B. 栈 "},
								{"value": 2,"text": "C. 队列"},
								{"value": 3,"text": "D. 字典（哈希表）"}],
						answer:" D. 字典（哈希表）\n\n在这种情况下，字典（哈希表）是最合适的数据结构，因为我们可以用学生的姓名作为键（key），成绩作为对应的值（value）。这样可以通过姓名快速查找和修改对应的成绩，查询效率接近于 O(1)。"
					},
					{
						title:"无线网络技术",
						decription:" 802.11标准系列中最常见的两种无线局域网（WLAN）技术是什么？",
						choices:[
								{"value": 0,"text": "A. 802.11a和802.11b "	},
								{"value": 1,"text": "B. 802.11b和802.11g "},
								{"value": 2,"text": "C. 802.11g和802.11n"},
								{"value": 3,"text": "D. 802.11n和802.11a"}],
						answer:" B. 802.11b和802.11g\n\n802.11b是早期广泛应用的WLAN标准，工作在2.4GHz频段，最高速率11Mbps。802.11g也是在2.4GHz频段工作，但最高速率可达54Mbps，兼容802.11b设备，因此两者在一段时间内非常普遍。"
					}
					]
				
			}
		},
		methods: {
            click(item) {
                console.log('item', item);
            },
			tabsChange(index){
				this.tabsCurrent=index.index
			},
			prevQuestion(index) {
			      let newIndex = index > 0 ? index - 1 : this.problemList.length - 1;
			      this.tabsCurrent = newIndex;
			    },
			nextQuestion(index) {
			  let newIndex = (index + 1) % this.problemList.length;
			  this.tabsCurrent = newIndex;
			}
		}

	}
</script>
<style>
	.content {
		display: flex;
		flex-direction: column;
		align-items: center;
		justify-content: center;
	}
	.button{
	width: 130px;
	line-height: 38px;
	text-align: center;
	font-weight: bold;
	color: #fff;
	text-shadow:1px 1px 1px #333;
	border-radius: 5px;
	margin:0 20px 20px 0;
	position: relative;
	overflow: hidden;
	}
	.logo {
		height: 200rpx;
		width: 200rpx;
		margin-top: 200rpx;
		margin-left: auto;
		margin-right: auto;
		margin-bottom: 50rpx;
	}

	.text-area {
		display: flex;
		justify-content: center;
	}
	.text {
			font-size: 20px;
			color: blue;
			line-height: 20px;
		}
	.uni-body{
		font-size: 32rpx;
		color:#333;
		padding: 20rpx 10rpx;
	}
	.title {
		font-size: 36rpx;
		color: #8f8f94;
	}
	
</style>

