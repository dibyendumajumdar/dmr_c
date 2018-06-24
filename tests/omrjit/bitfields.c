struct S3 {
     int twobit:2;
     int       :1;
     int threebit:3;
     unsigned int onebit:1;
     int ninebit:9;
};
extern int sets3(struct S3 *s3, int v);
int sets3(struct S3 *s3, int v) {
	int rc = 0;
	s3->threebit = 7;
	s3->twobit = s3->threebit;
	s3->threebit = s3->twobit;
	s3->ninebit = v;
	if(s3->threebit != 3){
		if(s3->threebit == -1){
			rc++;
     	}
   }

   s3->onebit = 1;
   if(s3->onebit != 1){
			rc++;
   }
   return rc;
}

int TestNano(void) {
    struct S3 s3;
    int rc = sets3(&s3, 129);
    if (rc == 0 && s3.ninebit != 129)
     rc = 1;
    if (rc == 0 && s3.threebit != 3)
      rc = 2;
    if (rc == 0 && s3.twobit != -1)
      rc = 3;
    if (rc == 0 && s3.onebit != 1)
      rc = 4;
    return rc;
}