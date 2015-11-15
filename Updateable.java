/**
 * @author jakemingolla
 * @since 1.0
 *
 * Interface for all updateable objects within a scene. This interface serves as
 * a runtime directive for a {@link Graph} instance to know which objects within
 * the Graph to update. Can be ignored to provide immutable objects within a Graph.
 */
public interface Updateable {

        /**
         * @author jakemingolla
         *
         * Updates a given object. Called every frame of drawing.
         */
        public void update();
}
