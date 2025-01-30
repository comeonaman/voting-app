import { WalletStatus } from "../components/wallet/status"

const WalletView = () => {
	return (
		<>
			<div className="mb-8">
				<h1 className="text-4xl font-bold mb-4">Your Wallet Information</h1>
				<WalletStatus />
			</div>
		</>
	)
}

export default WalletView
