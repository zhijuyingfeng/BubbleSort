#include <stdlib.h>

int main()
{
	int i,j,temp;
	unsigned int arr[10]={8,6,9,2,3,5,4,0,1,7};
	for(i=0;i<10-1;i++)
	{
		for(j=0;j<10-1-i;j++)
		{
			if(arr[j]>arr[j+1])
			{
				temp=arr[j];
				arr[j]=arr[j+1];
				arr[j+1]=temp;
			}
		}
	}
	for(i=0;i<10;i++)
	{
		printf("%d\n",arr[i]);
	}
	return 0;
}