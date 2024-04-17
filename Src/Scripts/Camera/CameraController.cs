using Godot;

public partial class CameraController : Camera3D
{
	[Export]
	private Node3D _followTarget;

	public override void _Process(double delta)
	{
		Position = new Vector3(_followTarget.GlobalPosition.X, _followTarget.GlobalPosition.Y, 10f);
	}
}
