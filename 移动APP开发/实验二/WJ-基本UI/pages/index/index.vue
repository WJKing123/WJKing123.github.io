
<template>
	<view class="WJ-result">
		<input class="result" type="text" v-model="showValue" disabled="true" style="font-size: 70rpx;" />
	</view>
	<view class="WJ-btns">
		<view class="btns" v-for="item in buttons" :key="item.text" :class="[item.class]"
		        @click="operate(item)">{{item.text}}</view>
	</view>
	
</template>

<script>
	
	export default {
		data() {
			
			return {
				showValue: "",
				buttons: [
					{
					    text: '√￣',
					    class: 'ft-color bg-orange ml-zero',
					    func: 'sqrt',
					    params: 'sqrt',
					},
					{
					    text: 'n!',
					    class: 'ft-color bg-orange',
					    func: 'fac',
					    params: 'delete',
					},
					{
					    text: 'x²',
					    class: 'ft-color bg-orange',
					    func: 'pow',
					    params: 'pow',
					},
					{
					    text: 'π',
					    class: 'ft-color bg-orange',
					    func: 'inputText',
					    params: Math.PI.toString(),
					},
					{
				        text: 'AC',
				        class: 'ft-color bg-orange ml-zero',
				        func: 'clear',
				        params: 'clear',
				    },
					{
					    text: 'DEL',
					    class: 'ft-color bg-orange',
					    func: 'delete',
					    params: 'delete',
					},
				    {
				        text: '+/-',
				        class: 'ft-color bg-orange',
				        func: 'opposite',
				        params: 'opposite',
				    },
				    {
				        text: '÷',
				        class: 'bg-orange',
				        func: 'inputText',
				        params: '/',
				    },
				    {
				        text: '7',
				        class: 'bg-darkgray ml-zero',
				        func: 'inputText',
				        params: '7',
				    },
				    {
				        text: '8',
				        class: 'bg-darkgray',
				        func: 'inputText',
				        params: '8',
				    },
				    {
				        text: '9',
				        class: 'bg-darkgray',
				        func: 'inputText',
				        params: '9',
				    },
				    {
				        text: '×',
				        class: 'bg-orange',
				        func: 'inputText',
				        params: '*',
				    },
				    {
				        text: '4',
				        class: 'bg-darkgray ml-zero',
				        func: 'inputText',
				        params: '4',
				    },
				    {
				        text: '5',
				        class: 'bg-darkgray',
				        func: 'inputText',
				        params: '5',
				    },
				    {
				        text: '6',
				        class: 'bg-darkgray',
				        func: 'inputText',
				        params: '6',
				    },
				    {
				        text: '-',
				        class: 'bg-orange',
				        func: 'inputText',
				        params: '-',
				    },
				    {
				        text: '1',
				        class: 'bg-darkgray ml-zero',
				        func: 'inputText',
				        params: '1',
				    },
				    {
				        text: '2',
				        class: ' bg-darkgray',
				        func: 'inputText',
				        params: '2',
				    },
				    {
				        text: '3',
				        class: ' bg-darkgray',
				        func: 'inputText',
				        params: '3',
				    },
				    {
				        text: '+',
				        class: 'bg-orange',
				        func: 'inputText',
				        params: '+',
				    },
					{
					    text: '%',
					    class: 'bg-orange ml-zero',
					    func: 'inputText',
					    params: '%',
					},
				    {
				        text: '0',
				        class: 'bg-darkgray',
				        func: 'inputText',
				        params: '0',
				    },
				    {
				        text: '.',
				        class: 'bg-darkgray',
				        func: 'inputText',
				        params: '.',
				    },
				    {
				        text: '=',
				        class: 'bg-red',
				        func: 'equal',
				        params: 'result',
				    }
				]
			}
		},
		onLoad() {
			
		},
		methods: {
			operate(item) {
				const func = item.func;
				const params = item.params;

				switch (func) {
					case "clear":
						this.showValue = ""
						break;
					case "sqrt":
						try{
							this.showValue = Math.sqrt(parseFloat(this.showValue))
							break;
						}
						catch (e){
							this.showValue = "invalid key!"
						}
					case "fac":
					    const n = parseInt(this.showValue,10)
						if (n < 0) {  
						    this.showValue = "invalid key"  
						  } 
						  else if (n <= 1) {  
						    this.showValue = "1"
						  } 
						  else {  
						    let result = 1;  
						    for (let i = 1; i <= n; i++) {  
						      result *= i;  
						    }  
						    this.showValue = result.toString();
							break;
						  }  
					case "pow":
						try{
							this.showValue = Math.pow(parseFloat(this.showValue),2)
							break;
						}
						catch (e){
							this.showValue = "invalid key!"
						}
					case "delete":
						this.showValue = this.showValue.substring(0,this.showValue.length-1)
						break;
					case "opposite":
						this.showValue = -this.showValue
						break;
					case "inputText":
						this.showValue = this.showValue+params
						break;
					case "equal":
						try{
							this.showValue = eval(this.showValue)
							break;
						}
						catch (e){
							this.showValue = "ERROR!"
						}
					}
				}
		},
		
	}
	
</script>

<style lang="scss">
	.content {
		width: 100%;
		height: 100%;
		background-color: black;
		padding-left: 30rpx;
		padding-right: 30rpx;
		box-sizing: border-box;
	}
	.WJ-result{
	    width: 100%;
	    height: 22%;
		border: 2px solid black;
		box-sizing: border-box;
	    background: white;
		
		.result{
		        height: 30%;
				text-align: right;
				color: black;
				position: absolute;
				}
	    
	}
	
	.WJ-btns{
	    width: 100%;
		height: 78%;
		background: white;
		display: flex;
		flex-wrap: wrap;
		justify-content: space-evenly;
		
		.btns {
		        margin-left: 30rpx;
		        width: 150rpx;
		        height: 150rpx;
		        line-height: 150rpx;
		        border-radius: 50%;
		        text-align: center;
		        font-size: 60rpx;
		        
		    }
		
		.ml-zero {
		    margin-left: 0;
		}
		
		.ft-color {
		    color: black;
		}
		.bg-orange {
		    background-color: orange;
		}
		
		.bg-darkgray {
		    background: gray;
		}
		.bg-red {
			background-color: red;
		}
	}
	
</style>
