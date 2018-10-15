#include <stdio.h>
#include <stdlib.h>

void BullbleSort(int arr[],int n)
{
    int i,j,temp;
    for(i=0;i<n-1;i++)
	{
		for(j=0;j<n-1-i;j++)
		{
			if(arr[j]>arr[j+1])
			{
				temp=arr[j];
				arr[j]=arr[j+1];
				arr[j+1]=temp;
			}
		}
	}
}

int main()
{
    int i,j,k;
    unsigned int A[20]={78,54,80,88,38,77,96,65,57,98,60,36,93,58,40,71,96,43,7,26};
	unsigned int B[30]={49,75,7,83,67,62,95,15,56,5,29,90,22,90,20,37,42,34,32,78,77,19,88,54,77,53,2,91,46,22};
	unsigned int S[20];
	i=0;j=0;k=0;
	BullbleSort(A,20);
	BullbleSort(B,30);
	while(i<20&&j<30)
	{
		if(A[i]<B[j])
		{
			i++;
		}
		else if(A[i]>B[j])
		{
			j++;
		}
		else if(A[i]==B[j])
		{
			S[k++]=A[i];
			printf("%d\n",A[i]);
			i++,j++;
		}
	}
	return 0;
}

