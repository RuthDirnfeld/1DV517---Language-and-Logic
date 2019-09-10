import java.io.IOException;

import org.antlr.v4.runtime.ANTLRInputStream;
import org.antlr.v4.runtime.CommonTokenStream;
import org.antlr.v4.runtime.tree.ParseTree;

public class Main {
	public static void main(String[] args) throws IOException {
		
		// The Testing String from the the 2.5 Exercise (assignment2)
		ANTLRInputStream input = new ANTLRInputStream(
				 "struct location{int x;int y;};int main()"
				+ "{int snake_length=1;location snake[10];location food;"
				+ "int u=0;char d='L';init_game(snake);while(u!=1)"
				+ "{d=handle_input();u=update(snake,food,d,snake_length);if(u==2){"
				+ "food=make_new_food(snake);snake_length=snake_length+1;}"
				+ "if(snake_length==10){u=1;}}return 0;}"				 
				+ "int update(location snake[],location food,char direction,int snake_length)" 				
				+ "{int i=0;move_snake(snake,direction);"
				+ "while(i<snake_length){if(snake[i].x==food.x&&snake[i].y==food.y)"
				+ "{add_snake_part(snake,direction);}}return 0;}"
				
				);		
		
		HelloLexer lexer = new HelloLexer(input);
		CommonTokenStream tokens = new CommonTokenStream(lexer);
		HelloParser parser = new HelloParser(tokens);
		ParseTree tree = parser.p(); // begin parsing at 'p'
		System.out.println(tree.toStringTree()); 

	}
}
