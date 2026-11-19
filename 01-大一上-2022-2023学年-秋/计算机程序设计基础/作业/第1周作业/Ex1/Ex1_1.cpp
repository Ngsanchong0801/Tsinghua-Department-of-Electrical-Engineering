// ------------------------------将下面内容拷贝到 students.cpp 中 -----------------------------------------
#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <conio.h>

void main() {
    // 1 输入
	// 1.1 打开文件
	FILE* f = fopen("students.txt","rt");
	if ( f== NULL) {
		printf("找不到 students.txt！ \n");
		return;
	}
	// 1.2 读入学生信息到数组
	char students[200][100];
	int count = 0;
	while ( !feof(f) ) {
		if ( fgets(students[count],100,f) != NULL) count++;
		//fscanf(f,"%s", students[count++]);
		//
		if (count >= 200) break;
	}

	// 2 处理： 找到指定学生
	srand( (unsigned)time( NULL ) );
	int k = rand() % count;
	
	// 3 输出： 指定学生信息
	printf("\n===============================\n\n");
	printf("挑战者:  %s\n",students[k]);
	printf("===============================\n");
	printf("\n");
	printf("\t有请挑战者...\n\n");
	_getch();
}
