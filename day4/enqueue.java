 class enqueue {
    public static void main(String[] args) {

        int queue[] = new int[5];
        int front = -1;
        int rear = -1;
        int value = 10;
        if (rear == queue.length - 1) {
            System.out.println("Queue is full");
        } else {
            if (front == -1) {
                front = 0;
            }
            rear++;
            queue[rear] = value;
        }
        for (int i = front; i <= rear; i++) {
            System.out.print(queue[i] + " ");
        }
    }
}