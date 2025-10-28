# 1. 定义编译器和编译选项
CC = gcc
CFLAGS = -Wall -g  # -Wall 开启所有警告，-g 生成调试信息
LDFLAGS =          # 链接阶段的选项（此处暂时为空）

# 2. 列出所有源文件（.c文件）
SRCS = Buffer.c \
       Channel.c \
       ChannelMap.c \
       EpollDispatcher.c \
       EventLoop.c \
       HttpRequest.c \
       Httpresponse.c \
       TcpConnection.c \
       TcpServer.c \
       ThreadPool.c \
       WorkerThread.c \
       main.c \
       PollDispatcher.c \
       SelectDispatcher.c 

# 3. 自动生成对应的目标文件（.o文件）列表
OBJS = $(SRCS:.c=.o)

# 4. 定义最终生成的可执行文件名称
TARGET = ReactorHttp2222222

# 5. 编译规则：生成可执行文件，依赖所有目标文件
$(TARGET): $(OBJS)
	$(CC) $(CFLAGS) -o $@ $^ $(LDFLAGS)

# 6. 模式规则：将每个.c文件编译为对应的.o文件
%.o: %.c
	$(CC) $(CFLAGS) -c $< -o $@

# 7. 清理规则：删除所有目标文件和可执行文件
clean:
	rm -f $(OBJS) $(TARGET)