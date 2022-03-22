**隐藏版本**

http增加一行

```bash
 server_tokens off;
```
![image](https://user-images.githubusercontent.com/62100249/159419128-16ba9d1a-a428-4eed-88cd-2df9f3ffb48c.png)
![image](https://user-images.githubusercontent.com/62100249/159419467-0f08708d-188b-49ad-b5a3-baf7ca324013.png)


**下载**

server增加一行

```bash
autoindex on;
```
![image](https://user-images.githubusercontent.com/62100249/159419226-c4f26dd8-0fb7-4108-9954-661d05126f30.png)


将下载的MP3文件放在wyt文件夹下的MP3
访问网页

![image](https://user-images.githubusercontent.com/62100249/159419277-5e47a4fe-6205-49a0-a9c5-e2eade4a9bc1.png)



**状态统计**
root html}下增加一行 

```bash
location = /wyt_status{
stub_status;}
```

![image](https://user-images.githubusercontent.com/62100249/159419369-67ef6ba4-4865-49a1-b373-ca9541ec3b75.png)

![image](https://user-images.githubusercontent.com/62100249/159419323-5317cca4-208c-435e-919d-537b125509ef.png)
