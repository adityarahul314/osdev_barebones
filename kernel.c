void main() {
	char* video_memory = (char*) 0xb8000;
	*video_memory = 'W';
	char* v2 = (char*) 0xb8004;
	*video_memory = 'r';
	char* v3 = (char*) 0xc8000;
	*video_memory = '2';
	char* v4 = (char*) 0xb8000;
	*video_memory = 'z';
}