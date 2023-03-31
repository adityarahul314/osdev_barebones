void main() {
	char* video_memory = (char*) 0xb8000;
	*video_memory = 'W';
	char* v2 = (char*) 0xb8004;
	*v2 = 'r';
	char* v3 = (char*) 0xb8008;
	*v3 = '2';
	char* v4 = (char*) 0xb800b;
	*v4 = 'K';
}