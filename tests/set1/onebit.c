extern int printf(const char *, ...);

int main(void) 
{
   struct{
     int twobit:2;
     int       :1;
     int threebit:3;
     unsigned int onebit:1;
   } s3;

   s3.onebit = 1;
   if(s3.onebit != 1){
      printf("Be especially careful with 1-bit fields! %d\n", (int) s3.onebit);
      return 1;
   }	
   return 0;
}