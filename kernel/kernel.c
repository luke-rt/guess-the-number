void entrypoint_test() {

}

void main() {
	char* video_mem = (char*) 0xb8000;
	*video_mem = 'X';
}
