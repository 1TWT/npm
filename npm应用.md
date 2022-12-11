# 使用npm包—Vant Wepp

## 相关安装配置

- 获取`package.json` 文件：在相关目录下使用 `npm int -y` 命令

- 创建相关仓库 ： 使` npm i @vant/weapp -S --production` 安装``node_modules``文件

  

- 使用工具构建npm获取!``miniprogram_npm ``文件

## 简单使用

1. 引入组件

   ```JSON
   // 通过 npm 安装
   // app.json 全局
   "usingComponents": {
     "van-button": "@vant/weapp/button/index"
   }
   ```

   

2. 引入组件后直接使用样式

   ```CSS
   <van-button type="primary">按钮</van-button>
   
   ```

   

## 相关wxss配置

链接 [txt文件](https://1twt.github.io/wxpeiz/vantWxss.txt)



## 定制方法

### 定制单个组件的主题样式

> 在 wxss 中为组件设置 CSS 变量

```html
<van-button class="my-button">
  默认按钮
</van-button>
.my-button {
  --button-border-radius: 10px;
  --button-default-color: #f2f3f5;
}
```



# 使用npm-API Promies化（基于回调函数异步）



## 相关安装

```
npm install --save miniprogram-api-promise@1.0.4
```

获得 ``miniprogram-api-promise``  文件夹，再次npm构建

## 相关使用

```JS
//app.json文件中
import {promisifyAll} from 'miniprogram-api-promise'
const wxp= wx.p={}
promisifyAll(wx,wxp)

// 页面.js中使用
async getinfo(){
    const {data:res}= await wx.p.request({
      method:'GET',
      url: 'https://www.escook.cn/categories',
      
     
    })
    console.log(res)
   
  }
```



# npm实现全局数据共享

全局数据共享是为了解决组件之间数据共享的问题

## 小程序中全局数据共享方案

- mobx-miniprogram 来创建store 实例对象
- mobx-miniprogram-bindigs用来吧Store的共享数据来绑定到页面或组件中使用



### 1.安装Mobx相关的包

````
npm install --save mobx-miniprogram@4.13.2 mobx-miniprogram-bindings@1.2.1
````



### 2.创建Stroe文件夹并创建Store.js 并在这个文件中创建Store的实例对象



```js
//store.js 文件中
import {action, observable} from 'mobx-miniprogram'
export const store= observable({

  //数据字段
  numA:1,
  numB:2,
  //计算属性
  get sum(){
    return this.numA+this.numB
  },
  //actions 方法用来修改store中的属性
  update1 :action({
    function (step) {
      this.numA +=step
    }
  }),
  update2 :action({
    function (step) {
      this.numB +=step
    }
  })
```

### 3.将Store 中的成员绑定到页面中



```js
// 页面.js中
import {createStoreBindings} from 'mobx-miniprogram-bindings'
import {store} from '../../Store/store'

//利用mobx-miniprogram-bindings 将store 绑定到页面中
onLoad(options) {
      this.StoreBindings=createStoreBindings(this,{
        store,
        fields:['numA','numB','sum'],
        actions:['update2','update1']
      })
  },
      
onUnload() {
    //销毁
      this.StoreBindings.destoryStoreBindings()
  },
```

### 4.在页面中使用Store

```html
//页面.html
<view>{{numA}}+{{numB}}={{sum}}</view>
<van-button type="primary" class="a" bindtap="btnHander" data-step="{{1}}" >numA+1</van-button>
```

```js
//页面.js
btnHander(e){
    //将store绑定后就可以使用store中的方法
    this.update2(e.target.dataset.step)
  },
```

### 5.在组件中使用Store

```html
//组件.html
<view >{{numA}}+{{numB}}={{sum}}</view>
<van-button bindtap="btnhand" data-step="{{1}}">numA+1</van-button>

```





```js
//组件.js 
import {storeBindingsBehavior} from 'mobx-miniprogram-bindings'
import {store} from '../../Store/store'
Component({
behaviors:[storeBindingsBehavior],
  storeBindings:{
    //数据源
    store,
    fields:{
      numA:'numA',
      numB:'numB',
      sum:'sum'
    },
    actions:{
      update2:'update2',
      update1:'update1'
    }
  }
    
  ........
      methods: {
    btnhand(e){
      this.update1(e.target.dataset.step)
    }
  }
  ........
})
```

















