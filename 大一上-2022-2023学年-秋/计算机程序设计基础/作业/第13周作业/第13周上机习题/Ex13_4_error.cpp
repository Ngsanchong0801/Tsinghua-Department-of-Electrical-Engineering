#include <stdio.h>
#define MAX_M 100
#define MAX_N 100

int monkey_king(int, int);
int* inner_loop(int*, int, int);
int next(const int*, int, int);

int main() {
	int m, n;
	printf("������M��N���ո�ָ�����");
	scanf("%d%d", &m, &n);
	int king = monkey_king(m, n);
	printf("�����ǣ�%d\n", king);
	return 0;
}

int monkey_king(int m, int n) {
	int monkeys[m];
	
	for(int i=0; i<m; i++)
		monkeys[i]=i;
	
	return inner_loop(monkeys, m, n)-monkeys;
}

int* inner_loop(int* idx, int m, int n) {
	int n_candidate = m;
	int current_idx = 1;
	while(n_candidate) {
		for(int i=1; i<=n; i++) {
			if(current_idx==n) //�������ΪN
				idx[current_idx-1] = 0; //��Ȧ

			current_idx = next(idx, m, current_idx); //�ҳ���һ������
		}
	}
	for(int i=0; i<n; i++) {
		if(idx[i])
			return idx+i;
	}
	return NULL;
}

int next(const int* idx, int m, int cur) {
	while(true) {
		if(cur<=m)
			cur++;
		else
			cur=1;
		
		if(idx[cur-1])
			return cur;
	}
}