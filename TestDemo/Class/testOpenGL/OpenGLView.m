//
//  OpenGLView.m
//  OpenGLDemo
//
//  Created by zhu_hbo on 14/12/3.
//  Copyright (c) 2014年 zhu_hbo. All rights reserved.
//

#import "OpenGLView.h"

//10. 一个用于跟踪所有顶点信息的结构Vertex(目前只包含位置和颜色)
typedef struct {
    float Position[3];
    float Color[4];
    
} Vertex;

//11. 定义了以上面这个Vertex结构为类型的array
const Vertex Vertices[] = {{{1, -1, 0}, {1, 0, 0, 1}}, {{1, 1, 0}, {0, 1, 0, 1}}, {{-1, 1, 0}, {0, 0, 1, 1}}, {{-1, -1, 0}, {0, 0, 0, 1}}};

//12. 一个用于表示三角形顶点的数组
const GLubyte Indices[] = {0, 1, 2, 2, 3, 0};

@implementation OpenGLView


//7. 编译vertex shader和fragment shader
-(GLuint) compileShader:(NSString *)shaderName withType:(GLenum)shaderType {

    //1. 这是一个UIKit编程的标准用法,就是在NSBundle中查找某个文件.
    NSString *shaderPath = [[NSBundle mainBundle] pathForResource:shaderName ofType:@"glsl"];
    
    NSError *error;
    NSString *shaderString = [NSString stringWithContentsOfFile:shaderPath encoding:NSUTF8StringEncoding error:&error];
    if (!shaderString) {
        NSLog(@"Error loading shader: %@", error.localizedDescription);
        exit(1);
    }
    
    //2. 调用glCreateShader来创建一个代表shader的OpenGL对象.这时必须告诉OpenGL,你想创建fragment shader
    //还是vertex shader. 所以便有了这个参数:shaderType
    GLuint shaderHandle = glCreateShader(shaderType);
    
    //3. 调用glShaderSource,让OpenGL获取到这个shader的源代码.(就是glsl)这里我们还把NSString转换成C-string
    const char *shaderStringUTF8 = [shaderString UTF8String];
    int shaderStringLength = (int)[shaderString length];
    glShaderSource(shaderHandle, 1, &shaderStringUTF8, &shaderStringLength);
    
    //4. 最后,调用glCompileShader在运行时编译shader
    glCompileShader(shaderHandle);
    
    //5. 如果编译失败,glGetShderiv和glGetShaderInfoLog会把error信息输出到屏幕.(然后退出)
    GLint compileSuccess;
    glGetShaderiv(shaderHandle, GL_COMPILE_STATUS, &compileSuccess);
    if (compileSuccess == GL_FALSE) {
        GLchar messages[256];
        glGetShaderInfoLog(shaderHandle, sizeof(messages), 0, &messages[0]);
        
        NSString *messageString = [NSString stringWithUTF8String:messages];
        NSLog(@"%@", messageString);
        exit(1);
    }
    return shaderHandle;

}

//8. 我们还需要一些步骤来编译vertex shader和fragment shader
//  把它们俩关联起来
//  告诉OpenGL来调用这个程序,还需要一些指针什么的.
-(void) compileShaders {

    //1. 用来调用刚刚写的动态编译方法, 分别编译了vertex shader和fragment shader
    GLuint vertexShader = [self compileShader:@"SimpleVertex" withType:GL_VERTEX_SHADER];
    GLuint fragmentShader = [self compileShader:@"SimpleFragment" withType:GL_FRAGMENT_SHADER];
    
    //2. 调用了glCreateProgram glAttachShader glLinkProgram连接vertex和fragment shader成一
    //个完整的program
    GLuint programHandle = glCreateProgram();
    glAttachShader(programHandle, vertexShader);
    glAttachShader(programHandle, fragmentShader);
    glLinkProgram(programHandle);
    
    //3. 调用glGetProgramiv glGetProgramInfoLog来检查是否有error,并输出信息
    GLint linkSuccess;
    glGetProgramiv(programHandle, GL_LINK_STATUS, &linkSuccess);
    if (linkSuccess == GL_FALSE) {
        GLchar messages[256];
        glGetProgramInfoLog(programHandle, sizeof(messages), 0, &messages[0]);
        NSString *messageString = [NSString stringWithUTF8String:messages];
        
        NSLog(@"%@", messageString);
        exit(1);
    }
    
    //4. 调用glUseProgram让OpenGL真正执行你的program
    glUseProgram(programHandle);
    
    //5. 最后,调用glGetAttribLocation来获取指向vertex shader传入变量的指针.以后可能通过这些
    //指针来使用了.还有调用glEnableVertexAttribArray来启用这些数据.(因为默认是disabled的)
    _positionSlot = glGetAttribLocation(programHandle, "Position");
    _colorSlot = glGetAttribLocation(programHandle, "SourceColor");
    glEnableVertexAttribArray(_positionSlot);
    glEnableVertexAttribArray(_colorSlot);
}

//13.
-(void) setupVBOs {
 
    GLuint vertexBuffer;
    
    //13.1 glGenBuffers - 创建一个Vertex Buffer对象
    glGenBuffers(1, &vertexBuffer);
    
    //13.2 告诉OpenGL我们的vertexBuffer是指GL_ARRAY_BUFFER
    glBindBuffer(GL_ARRAY_BUFFER, vertexBuffer);
    
    //13.3 把数据传到OpenGL-land
    glBufferData(GL_ARRAY_BUFFER, sizeof(Vertices), Vertices, GL_STATIC_DRAW);
    
    GLuint indexBuffer;
    glGenBuffers(1, &indexBuffer);
    glBindBuffer(GL_ELEMENT_ARRAY_BUFFER, indexBuffer);
    glBufferData(GL_ELEMENT_ARRAY_BUFFER, sizeof(Indices), Indices, GL_STATIC_DRAW);
    
}

-(id) initWithFrame:(CGRect)frame {

    self = [super initWithFrame:frame];
    if (self) {
        [self setupLayer];
        [self setupContext];
        [self setupRenderBuffer];
        [self setupFrameBuffer];
        
        //9. 7、8步之后,添加shaders:顶点着色器和片段着色器
        [self compileShaders];
//        [self render1];
        
        
        [self setupVBOs];
        [self render2];
    }
    
    return self;
}

//1. 设置layer class 为CAEAGLLayer
//想要显示OpenGL的内容,你需要把它缺省的layer设置为一个特殊的layer
+(Class) layerClass {

    return [CAEAGLLayer class];
}

//2. 设置layer为不透明
-(void)setupLayer {

    _eaglLayer = (CAEAGLLayer *) self.layer;
    
    //因为缺省的话,CALayer是透明的,而透明的层对性能负荷很大,特别是OpenGL的层
    //如果可能,尽量都把层设置为不透明.
    //另一个比较明显的例子是自定义tableview cell
    _eaglLayer.opaque = YES;
}

//3. 创建OpenGL context
-(void) setupContext {

    EAGLRenderingAPI api = kEAGLRenderingAPIOpenGLES2;
    _context = [[EAGLContext alloc] initWithAPI:api];
    
    if (!_context) {
        NSLog(@"Failed to initialize OpenGLES 2.0 context");
        exit(1);
    }
    
    if (![EAGLContext setCurrentContext:_context]) {
        NSLog(@"Failed to set current OpenGL context");
        exit(1);
    }
}

//4. 创建render buffer (渲染缓冲区)
//Render buffer 是OpenGL的一个对象, 用于存放渲染过的图像
//有时候你会发现render buffer会作为一个color buffer被引用,因为本质上它就是存放用于显示的颜色
-(void) setupRenderBuffer {

    //4.1 调用glGenRenderbuffers 来创建一个新的render buffer object.这里返回一个唯一的integer来
    //标记render buffer(这里把这个唯一值赋值到_colorRenderBuffer).有时候你会发现这个唯一值被用来作为
    //程序内的一个OpenGL的名称.(反正它唯一嘛)
    glGenRenderbuffers(1, &_colorRenderBuffer);
    
    //4.2 调用glBindRenderbuffer,告诉这个OpenGL: 我在后面引用GL_RENDERBUFFER的地方,其实是想用
    //_colorRenderBuffer.其实就是告诉OpenGL,我们定义的buffer对象是属于哪一种OpenGL对象
    glBindRenderbuffer(GL_RENDERBUFFER, _colorRenderBuffer);
    
    //4.3 最后,为render buffer分配空间.renderbufferStorage
    [_context renderbufferStorage:GL_RENDERBUFFER fromDrawable:_eaglLayer];
}


//5. 创建一个frame buffer (帧缓冲区)
//Frame buffer也是OpenGL的对象,它包含了前面提到的render buffer, 以及其它后面会讲到的诸如:depth buffer、
//stencil buffer和accumulation buffer.
-(void) setupFrameBuffer {

    //5.1 类似render buffer的创建
    GLuint framebuffer;
    glGenFramebuffers(1, &framebuffer);
    glBindFramebuffer(GL_FRAMEBUFFER, framebuffer);
    
    //5.2 把前面创建的buffer render依附在frame buffer的 GL_COLOR_ATTACHMENT0 位置上
    glFramebufferRenderbuffer(GL_FRAMEBUFFER, GL_COLOR_ATTACHMENT0, GL_RENDERBUFFER, _colorRenderBuffer);
}

//6. 清理屏幕
//为了尽快在屏幕上显示一些什么,在我们和那些vertexes,shaders打交道之前,把屏幕清理一下,显示另一个颜色(RGB0,104,55,绿色)
//这里每个RGB色的范围是0~1,所以每个要除一下255.
-(void) render1 {

    //6.1 调用glClearColor,设置一个RGB颜色和透明度, 接下来会用这个颜色涂满全屏.
    glClearColor(0, 104.0/255.0, 55.0/255.0, 1.0);
    
    //6.2 调用glClear来进行这个"填色"的动作(大概就是photoshop那个油桶).还记得前面说过有很多buffer的话,这里我们要用
    //到GL_COLOR_BUFFER_BIT来声明要清理哪一个缓冲区.
    glClear(GL_COLOR_BUFFER_BIT);
    
    //6.3 调用OpenGL context的presentRenderbuffer方法,把缓冲区(render buffer和color buffer)的颜色呈现到UIView上
    [_context presentRenderbuffer:GL_RENDERBUFFER];
}

//14. 用新的渲染方法来把顶点数据画到屏幕上
-(void) render2 {

    glClearColor(0, 104.0/255.0, 55.0/255.0, 1.0);
    glClear(GL_COLOR_BUFFER_BIT);
    
    //14.1 调用glViewport设置UIView中用于渲染的部分.这个例子中指定了整个屏幕.但如果你希望用更小的部分,可以更变这些参数
    glViewport(0, 0, self.frame.size.width, self.frame.size.height);
    
    //14.2 调用glVertexAttribPointer来为vertex shader的两个输入参数配置两个合适的值.
    //这是一个很重要的方法
    //第一个参数,声明这个属性的名称,之前我们称之为glGetAttribLocaiton
    //第二个参数,定义这个属性由多少个值组成.譬如说position是由3个float(x, y, z)组成,而颜色是4个float(r, g, b, a)
    //第三个参数,声明每一个值是什么类型.(这例子中无论是位置还是颜色, 我们都用了GL_GLOAT)
    //第四个参数,..总是false就好了.
    //第五个参数,指stride的大小.这是一个描述每个vertex数据大小的方式.所以我们可以简单地传入sizeof(Vertex),让编译器计算出来就好.
    //最后一个,是这个数据结构的偏移量.表示在这个结构中,从哪里开始获取我们的值.Position的值在前面,所以传0进去就可以了.而颜色是紧接着位置
    //的数据,而position的大小是3个float的大小,所以是从3*sizeof(float)开始的.
    glVertexAttribPointer(_positionSlot, 3, GL_FLOAT, GL_FALSE, sizeof(Vertex), (GLvoid*)(sizeof(float)*3));

    //14.3
    glDrawElements(GL_TRIANGLES, sizeof(Indices)/sizeof(Indices[0]), GL_UNSIGNED_BYTE, 0);
    
    [_context presentRenderbuffer:GL_RENDERBUFFER];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
