/**
 * @author jakemingolla
 * @since 1.0
 *
 * Interface for all renderable objects within the scene. This interface serves as
 * a runtime directive for a {@link Graph} instance to know which objects within
 * the Graph to render. Can be ignored to provide invisible objects within a Graph.
 */
public interface Renderable {

        /**
         * @author jakemingolla
         *
         * Renders the given object to the screen. Called every frame of drawing.
         */
        public void render();
}
